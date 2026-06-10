# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
    # 1. Define your notes directory (Change this to your actual path)
    local NOTES_DIR="$HOME/personal/vault"
    
    # 2. Ensure the directory exists
    mkdir -p "$NOTES_DIR"

    # 3. If an argument is passed (e.g., 'note sql-drivers'), open or create it directly
    if [ -n "$1" ]; then
        $EDITOR "$NOTES_DIR/$1.md"
        return
    fi

    # 4. If NO argument is passed, open fzf to search existing notes
    # Pressing CTRL-N inside fzf allows you to create a brand new note
    local selected
    selected=$(find "$NOTES_DIR" -type f -name "*.md" -printf "%P\n" | \
        fzf --query="$1" \
            --preview="bat --color=always --style=numbers '$NOTES_DIR/{}' 2>/dev/null || cat '$NOTES_DIR/{}'" \
            --header="Enter: Open | Ctrl-N: Create New Note" \
            --bind="ctrl-n:execute(read -p 'New note name: ' new_note && touch '$NOTES_DIR/\$new_note.md') + reload(find '$NOTES_DIR' -type f -name '*.md' -printf '%P\n')"
    )

    # 5. Open the selected note if the user didn't exit fzf
    if [ -n "$selected" ]; then
        $EDITOR "$NOTES_DIR/$selected"
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
