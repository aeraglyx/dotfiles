eval "$(starship init bash)"
eval "$(zoxide init --cmd h bash)"

alias resh="$SHELL"

flake="--flake ~/nixos#${HOSTNAME}"
alias nrs="sudo nixos-rebuild switch $flake"
alias nrt="sudo nixos-rebuild test $flake"
alias nrd="sudo nixos-rebuild dry-activate $flake"
alias nfu="sudo nix flake update --flake ~/nixos"
alias ncg="sudo nix-collect-garbage"
alias ntr="nix-tree /home/aeraglyx/nixos#nixosConfigurations.${HOSTNAME}.config.system.build.toplevel"
alias nso="sudo nix-store --optimize"

alias g="lazygit"
alias grh="git fetch --all && git reset --hard origin/main"

alias e="nvim"
alias et="nvim ."
alias lsa="ls -Alh"
alias f=yazi
alias matrix="cmatrix -C blue"

alias en="cd ~/nixos/ && nvim ."
alias ed="cd ~/dotfiles/ && nvim ."
alias eb="cd ~/dotfiles/bash/ && nvim .bashrc"
alias eh="cd ~/dotfiles/hypr/.config/hypr/ && nvim ."
alias ev="cd ~/dotfiles/nvim/.config/nvim/ && nvim ."

alias ec="cd ~/projects/onyx.nvim/ && nvim ."
alias kb="cd ~/projects/qmk_userspace/keyboards/grooovebob/dasbob/keymaps/aeraglyx/ && nvim ."
