# Compact vector diagrams shared by the HTML and PDF notes.
rv_flowchart <- function(method) {
  grid::grid.newpage()
  ink <- "#24483E"
  edge <- "#427D6B"
  pale <- "#F1F8F5"
  text_at <- function(x, y, label, size = 11, bold = FALSE) {
    grid::grid.text(label, x, y,
      gp = grid::gpar(col = ink, fontsize = size,
                      fontface = if (bold) "bold" else "plain", lineheight = 1.15))
  }
  box <- function(x, y, label, w = .215, h = .64, size = 11) {
    grid::grid.roundrect(x, y, w, h, r = grid::unit(2.5, "mm"),
      gp = grid::gpar(fill = pale, col = edge, lwd = 1.2))
    text_at(x, y, label, size)
  }
  diamond <- function(x, y, label, w = .20, h = .32, size = 10.5) {
    grid::grid.polygon(x + c(-w/2, 0, w/2, 0), y + c(0, h/2, 0, -h/2),
      gp = grid::gpar(fill = "#FFF8E7", col = edge, lwd = 1.2))
    text_at(x, y, label, size)
  }
  arrow <- function(x, y) {
    grid::grid.lines(x, y,
      arrow = grid::arrow(length = grid::unit(1.7, "mm"), type = "closed"),
      gp = grid::gpar(col = edge, fill = edge, lwd = 1.25, linejoin = "round"))
  }
  row <- function(labels) {
    xs <- c(.12, .37, .62, .87)
    for (i in seq_along(xs)) box(xs[i], .55, labels[[i]])
    for (i in 1:3) arrow(c(xs[i] + .1075, xs[i+1] - .1075), c(.55, .55))
  }
  if (method == "inverse") {
    row(list("1. Specify the\ntarget CDF F",
             expression(paste("2. Find ", F^{-1}, "(u)")),
             "3. Draw independent\nU values in (0, 1)",
             expression(atop("4. Return each", X == F^{-1}(U)))))
  } else if (method == "mixture") {
    row(list("1. Specify components\nand weights w",
             "2. Draw one label C\nusing weights w",
             "3. Draw X from the\nchosen component C",
             "4. Save X; repeat\nwith a fresh label"))
  } else if (method == "cholesky") {
    row(list("1. Specify n, mean,\nand covariance",
             "2. Compute once:\nR = chol(Sigma)",
             "3. Fill n by d matrix Z\nwith independent N(0,1)",
             "4. Form Z %*% R;\nadd mean to each row"))
  } else if (method == "rejection") {
    # Branches rejoin at the draw step: both random inputs must be fresh.
    box(.125, .79, "1. Check f <= M g\nSet count k = 0", w = .235, h = .24)
    box(.405, .79, "2. Draw fresh Y from g\nand U from Unif(0, 1)\n(independently)", w = .245, h = .24)
    diamond(.67, .79, "3. Is U <=\nf(Y) / [M g(Y)]?", w = .22, h = .36)
    box(.90, .79, "Save Y\nk = k + 1", w = .17, h = .24)
    diamond(.90, .35, "4. Is\nk = n?", w = .17, h = .30)
    box(.64, .35, "Return the n\nsaved values", w = .23, h = .22)
    arrow(c(.2425, .2825), c(.79, .79))
    arrow(c(.5275, .56), c(.79, .79))
    arrow(c(.78, .815), c(.79, .79))
    text_at(.80, .87, "Yes", 9.5)
    arrow(c(.90, .90), c(.67, .50))
    arrow(c(.815, .755), c(.35, .35))
    text_at(.786, .42, "Yes", 9.5)
    arrow(c(.67, .67, .405, .405), c(.61, .54, .54, .67))
    text_at(.54, .595, "No: discard Y", 9.5)
    arrow(c(.90, .90, .31, .31, .405, .405), c(.20, .10, .10, .63, .63, .67))
    text_at(.60, .16, "No: keep drawing", 9.5)
  } else stop("Unknown flowchart: ", method)
}
