#!/usr/bin/env bash
# Check spelling in Australian English. Run it with `mise run spell`.
# mise runs tasks from the repository root, so the relative paths below work.
#
# Harper options:
#   --dialect au        Australian English.
#   --only              Only Harper's spelling rules, so it does not report
#                       style choices such as the Oxford comma.
#   --user-dict-path    The accepted project words, one per line.
#   --file-dict-path    A folder that does not exist, so a developer's own
#                       Harper settings never change the result.
#
# `git ls-files -z` lists the tracked Markdown files, separated by NUL
# characters so that names with spaces are safe. `xargs -0` passes them to
# harper-cli as arguments. The list comes from git because harper-cli does not
# look inside subfolders. Passing a folder such as docs would skip the files in
# it. Add a pattern to the list when the repository gets other file types, such
# as '*.ts' for code comments.
#
# `pipefail` makes the script fail when git fails. Without it, only the last
# command in the pipeline would count, and a failing `git ls-files` would pass
# unnoticed. When Harper finds a problem, xargs exits with status 123.

set -euo pipefail

git ls-files -z '*.md' | xargs -0 harper-cli lint --no-color --dialect au \
        --user-dict-path .config/harper/dictionary.txt \
        --file-dict-path .config/harper/no-file-dictionaries \
        --only SpellCheck,NounVerbSpelling
