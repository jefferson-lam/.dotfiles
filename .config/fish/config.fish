status is-interactive; and starship init fish | source

[ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
# NOTE: guarded because an empty `which chromium` result collapses the whole
# `export` argument, which makes fish's `export` fall back to a bare `set -x`
# (dumping every exported variable) on every shell startup.
if command -v chromium >/dev/null
    export PUPPETEER_EXECUTABLE_PATH=(command -v chromium)
end
export GRAPHVIZ_DOT=/opt/homebrew/bin/dot

# Miniconda setup
# set -gx PATH ~/miniconda3/bin $PATH  # commented out by conda initialize

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# NOTE: reordered to prefer the cached conda.fish script over the slow
# `eval conda shell.fish hook` call (which spawns a Python process on
# every shell startup, ~0.3s).
if test -f "/Users/jeffersonlam/miniconda3/etc/fish/conf.d/conda.fish"
    . "/Users/jeffersonlam/miniconda3/etc/fish/conf.d/conda.fish"
else if test -f /Users/jeffersonlam/miniconda3/bin/conda
    eval /Users/jeffersonlam/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    set -x PATH "/Users/jeffersonlam/miniconda3/bin" $PATH
end
# <<< conda initialize <<<


# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/jeffersonlam/.lmstudio/bin
# End of LM Studio CLI section

export PATH="$HOME/.local/bin:$PATH"
