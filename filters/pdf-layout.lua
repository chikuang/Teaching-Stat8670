-- PDF-only repairs keep the web layout and authored mathematical content.
function RawInline(raw)
  if quarto.doc.is_format("pdf") and
      (raw.format == "tex" or raw.format == "latex") and raw.text:match("^\\Sigma%s*$") then
    -- This symbol occurs once in prose without math delimiters.
    return {pandoc.Math("InlineMath", "\\Sigma"), pandoc.Space()}
  end
end

function RawBlock(raw)
  if not quarto.doc.is_format("pdf") or raw.format ~= "latex" then return nil end
  -- Full-width assignment questions must not inherit paragraph end padding.
  if raw.text:find("\\begin{minipage}{\\linewidth}", 1, true) then
    raw.text = "\\begingroup\\setlength{\\parindent}{0pt}\\setlength{\\parfillskip}{0pt plus 1fil}\n" .. raw.text
    return raw
  elseif raw.text:find("\\end{minipage}", 1, true) then
    raw.text = raw.text .. "\n\\endgroup"
    return raw
  end
end

function CodeBlock(block)
  if not quarto.doc.is_format("pdf") then return nil end
  local _, count = block.text:gsub("\n", "")
  if count < 50 then return nil end
  -- Highlight the complete listing before adding page-break opportunities,
  -- so splitting a long function does not flag its closing braces as errors.
  local latex = pandoc.write(pandoc.Pandoc({block}), "latex")
  local start = latex:find("\\begin{Highlighting}", 1, true)
  local finish = latex:find("\\end{Highlighting}", 1, true)
  if not start or not finish then return nil end
  local first = latex:find("\n", start, true) + 1
  local body, lines = latex:sub(first, finish - 1), {}
  for line in body:gmatch("([^\n]*)\n") do lines[#lines + 1] = line end
  local chunks, since_break = {}, 0
  for i, line in ipairs(lines) do
    chunks[#chunks + 1] = line
    since_break = since_break + 1
    if i < #lines and (since_break >= 40 or (since_break >= 20 and line == "")) then
      chunks[#chunks + 1] = "\\end{Highlighting}\n\\end{Shaded}\n\n\\begin{Shaded}\n\\begin{Highlighting}[]"
      since_break = 0
    end
  end
  return pandoc.RawBlock("latex", latex:sub(1, first - 1) ..
    table.concat(chunks, "\n") .. "\n" .. latex:sub(finish))
end
