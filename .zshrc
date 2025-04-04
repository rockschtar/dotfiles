export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nano
#ZSH_THEME="spaceship"

CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd.mm.yyyy"

LANDO_ZSH_CONFIG_FILE=".lando.yml"
LANDO_ZSH_SITES_DIRECTORY="$HOME/code"
LANDO_ZSH_WRAPPED_COMMANDS="composer phpcs phpcbf npm wp artisan"
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#adadad"

PURE_GIT_UNTRACKED_DIRTY=0

plugins=(git autojump nvm lando)

source $ZSH/oh-my-zsh.sh

if [ -f ~/.bash_paths ]; then
    . ~/.bash_paths
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

[ -f $HOME/.config/.zshrc_macos.sh ] && . $HOME/.config/.zshrc_macos.sh
[ -f $HOME/.config/.zshrc_fzf.sh ] && . $HOME/.config/.zshrc_fzf.sh

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust
### End of Zinit's installer chunk

# zstyle :prompt:pure:git:stash show yes
# zstyle :prompt:pure:path color '#3F94A8'
# zstyle :prompt:pure:prompt:success color '#5AB977'

zinit load zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
# zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
# zinit light sindresorhus/pure
# zinit light spaceship-prompt/spaceship-prompt
#eval "$(oh-my-posh init zsh --config 'https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/spaceship.omp.json')"
eval "$(oh-my-posh init zsh --config '~/.omp.json')"


