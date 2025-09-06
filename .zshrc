# ────────────────────────────────────────────────────────────────
# 0) Old visual terminal pre nicer looking
# ────────────────────────────────────────────────────────────────
# PROMPT='%F{cyan}%2~%f %# '
# PS1="%B%{%F{red}%}%n%{%f%} @ %{%F{yellow}%}%m %{%F{118}%}%~ %{%F{21}%}»%f%}%b "


# ────────────────────────────────────────────────────────────────
# 1) Basics & completion
# ────────────────────────────────────────────────────────────────

# Homebrew env (Apple Silicon)
eval "$(/opt/homebrew/bin/brew shellenv)"

# Make Homebrew-provided completions available
fpath+=("$(brew --prefix)/share/zsh/site-functions")

# Core zsh completion
autoload -Uz compinit
compinit        # if you see "insecure directories" once, try: compinit -u

# ────────────────────────────────────────────────────────────────
# 2) Runtime tools
# ────────────────────────────────────────────────────────────────

# pyenv & pyenv-virtualenv
# (Tip: pyenv recommends putting `eval "$(pyenv init --path)"` in ~/.zprofile.)
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# User-level CLI tools
export PATH="$HOME/.local/bin:$PATH"

# ────────────────────────────────────────────────────────────────
# 3) Prompt & plugins
# ────────────────────────────────────────────────────────────────

# Inline suggestions
#   brew install zsh-autosuggestions zsh-syntax-highlighting
if [ -r /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Syntax highlighting (must be last among plugins)
if [ -r /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Starship prompt
eval "$(starship init zsh)"

# ────────────────────────────────────────────────────────────────
# 4) Aliases & functions
# ────────────────────────────────────────────────────────────────

alias z='source ~/.zshrc'
alias vz='vim ~/.zshrc'
alias c='clear'
alias python="python3"
alias mkvenv="python3 -m venv .venv && source .venv/bin/activate"
alias l="ls -l"
alias vi="nvim"
alias cc='claude'
alias fqh='killall -9 horizon-client'
alias fqa='killall -9 AeroSpace'
alias es='exec $SHELL -l'
alias obs="nvim ~/Users/olles/Library/Mobile Documents/iCloud~md~obsidian/Documents/North Rock"
alias venv='source .venv/bin/activate'
alias sl='python -m streamlit run app/main.py'
alias vmorg='vim /Users/olle/GitHub/laboratory/src/scripts/morgan_terminal.py'

morg() {
  (cd ~/GitHub/laboratory && source .venv/bin/activate && python src/scripts/morgan_terminal.py)
}

# [[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

