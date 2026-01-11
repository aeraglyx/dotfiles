eval "$(starship init bash)"
eval "$(zoxide init --cmd h bash)"
eval "$(direnv hook bash)"

export HISTCONTROL=ignoredups

alias resh="$SHELL"

flake="--flake path:/home/aeraglyx/nixos#${HOSTNAME}"
alias nrs="sudo nixos-rebuild switch $flake"
alias nrt="sudo nixos-rebuild test $flake"
alias nrd="sudo nixos-rebuild dry-activate $flake"
alias nfu="sudo nix flake update --flake ~/nixos"
alias ncg="sudo nix-collect-garbage"
alias ntr="nix-tree /home/aeraglyx/nixos#nixosConfigurations.${HOSTNAME}.config.system.build.toplevel"
alias nso="sudo nix-store --optimize"
alias nsp="nix-shell -p"

alias g="lazygit"
alias grh="git fetch --all && git reset --hard origin/main"
alias e="nvim"
alias et="nvim ."
alias lsa="ls -Alh"
alias f=yazi
alias tre="rg --hidden --files | grep -v '.git/' | tree --fromfile"
alias da="direnv allow"
alias og="sh ~/scripts/open_github.sh"
alias qmkc="qmk compile -j $(nproc) --compiledb"
alias matrix="cmatrix -C cyan"

cmd="-c 'Telescope find_files'"
alias en="cd ~/nixos/ && nvim $cmd ."
alias ed="cd ~/dotfiles/ && nvim $cmd ."
alias eb="cd ~/dotfiles/bash/ && nvim .bashrc"
alias eh="cd ~/dotfiles/hypr/.config/hypr/ && nvim $cmd ."
alias ev="cd ~/dotfiles/nvim/.config/nvim/ && nvim $cmd ."
alias ec="cd ~/projects/onyx.nvim/ && nvim $cmd ."
alias kb="cd ~/projects/qmk_userspace/ && nvim $cmd ."

dir() {
    mkdir -p "$1"
    cd "$1" || exit
}
