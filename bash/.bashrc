eval "$(starship init bash)"
eval "$(zoxide init --cmd h bash)"

alias resh="$SHELL"

flake="--flake ~/nixos#${hostname}"
alias nrs="sudo nixos-rebuild switch $flake"
alias nrt="sudo nixos-rebuild test $flake"
alias nrd="sudo nixos-rebuild dry-activate $flake"
alias nfu="sudo nix flake update $flake"
alias ncg="sudo nix-collect-garbage"

alias g="lazygit"

alias e="nvim"
alias et="nvim ."

alias en="cd ~/nixos/ && nvim ."
alias ed="cd ~/dotfiles/ && nvim ."
alias eb="cd ~/dotfiles/bash/ && nvim .bashrc"
alias eh="cd ~/dotfiles/hypr/.config/hypr/ && nvim ."
alias ev="cd ~/dotfiles/nvim/.config/nvim/ && nvim ."

alias ec="cd ~/projects/onyx.nvim/ && nvim ."
alias kb="cd ~/projects/qmk_userspace/keyboards/grooovebob/dasbob/keymaps/aeraglyx/ && nvim ."
