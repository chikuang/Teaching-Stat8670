# STAT 8670 lecture updates

The user requested on 2026-10-20 that every lecture update include rendering and uploading.

- The user's local source repository is `~/Documents/GitHub/teaching/Teaching-Stat8670`.
- The current course branch is `2026F` in `chikuang/Teaching-Stat8670`. Start from its latest version and preserve existing local edits.
- After changing lecture content, render both HTML and the combined PDF with Quarto. Inspect the changed figures in both outputs.
- Commit and push the source changes and tracked rendered course artifacts to `2026F`.
- Publish the rendered `_book/` content under `teaching/2026F_stat8670/` in the `master` branch of `chikuang/chikuang.github.io`.
- Commit and push the website update, then verify the deployed course page and affected figure. The public course URL is `https://chikuang.github.io/teaching/2026F_stat8670/`.
- For these lecture updates, rendering and uploading are already authorized. Do not stop after editing local source or ask for upload permission again.
- Update only this course's published directory; preserve other website content.
- After every update, include visible, clickable links to the updated course page or figure and the online PDF in the final response. When a figure changes, also display its rendered image inline.
- Do not add suggested activity durations such as "(3 minutes)" to classroom exercise headings or practice instructions.
- After every update, provide a versioned course-page link so the user can open or refresh the latest published page.

- Use `set.seed(8670)` for STAT 8670 randomized examples. Normally set the seed once per independent simulation and continue the random-number stream across repetitions. Preserve deliberate demonstrations of resetting the seed.



## Teaching publication and primary-checkout synchronization

Standing user instruction (2026-10-22): every teaching-material update must finish
with rendering, committing, pushing, and verification that the primary local
repositories match GitHub. Rendering and uploading are already authorized.

- Before editing, fetch the affected primary source and publishing repositories
  and start from the latest current-course branch. Prefer the primary checkouts;
  preserve existing local edits and avoid working from stale copies.
- Render the affected teaching material to HTML and PDF with the documented
  project build. Execute changed examples and check affected figures, numerical
  outputs, links, and PDF layout. Keep both formats consistent.
- Commit and push the source plus tracked generated artifacts. Publish the
  rendered course output to its directory in `chikuang/chikuang.github.io`, then
  commit and push the publishing repository. For teaching-listing changes,
  render and push the affected `chikuang/website` source and published pages too.
  Preserve other courses and website content; do not clean the whole website.
- After pushing from any temporary clone or worktree, fetch and fast-forward the
  corresponding primary local source and publishing checkouts. Updating only a
  temporary copy is not completion. Synchronize other clean copies used during
  the task as well. Reconcile local edits/divergence without losing work.
- Before reporting completion, fetch again, verify the actual GitHub branch SHA
  equals local HEAD, and require `git rev-list --left-right --count
  HEAD...@{upstream}` to report `0 0` in every affected primary checkout. Check
  `git status --short --branch` for uncommitted or unpushed task changes. Preserve
  and explicitly report unrelated pre-existing work.
- Verify the deployed course page and PDF. Return versioned/refreshable links,
  the relevant commits, and the primary-checkout synchronization result. Repair
  failures or report the exact unfinished step; do not claim completion early.

The primary website source is `~/Documents/GitHub/personal_web/website` (`master`).
The primary publishing checkout is
`~/Documents/GitHub/personal_web/chikuang.github.io` (`master`).
