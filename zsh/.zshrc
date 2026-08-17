# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.npm-global/bin:$PATH"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf)

source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)

alias vim="nvim"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# opencode
export PATH=/home/bakabruh/.opencode/bin:$PATH

bindkey -s ^f "tmux-sessionizer\n"
bindkey -s '\eh' "tmux-sessionizer -s 0\n"
bindkey -s '\et' "tmux-sessionizer -s 1\n"
bindkey -s '\en' "tmux-sessionizer -s 2\n"
bindkey -s '\es' "tmux-sessionizer -s 3\n"

# Note taking
note() {
    # 1. Define your notes directory
    local NOTES_DIR="$HOME/personal/vault"
    
    # 2. Ensure the directory exists
    mkdir -p "$NOTES_DIR"

    # 3. Determine editor command (fallback to nvim if EDITOR is empty)
    local ed="${EDITOR:-nvim}"

    # 4. If an argument is passed (e.g., 'note sql-drivers'), open or create it directly
    if [ -n "$1" ]; then
        ${=ed} "$NOTES_DIR/$1.md"
        return
    fi

    # 5. If NO argument is passed, open fzf to search existing notes
    local selected
    selected=$(find "$NOTES_DIR" -type f -name "*.md" -printf "%P\n" | \
        fzf --query="$1" \
            --preview="bat --color=always --style=numbers '$NOTES_DIR/{}' 2>/dev/null || cat '$NOTES_DIR/{}'" \
            --header="Enter: Open | Ctrl-N: Create New Note" \
            --bind="ctrl-n:execute[read \"new_note?New note name: \" && [ -n \"\$new_note\" ] && touch \"$NOTES_DIR/\$new_note.md\"]+reload[find \"$NOTES_DIR\" -type f -name \"*.md\" -printf \"%%P\n\"]"
    )

    # 6. Open the selected note if the user didn't exit fzf
    if [ -n "$selected" ]; then
        ${=ed} "$NOTES_DIR/$selected"
    fi
}

# Ensure bob's proxy comes BEFORE other paths
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

# Being able to use steam with flatpak
export XDG_DATA_DIRS="$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:$XDG_DATA_DIRS"
eval "$(zoxide init zsh)"

# pnpm
export PNPM_HOME="/home/bakabruh/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Go Configuration
export GOROOT="$HOME/.local/opt/go"
export GOPATH="$HOME/go"
export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"

# Mise config
eval "$(mise activate zsh)"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
