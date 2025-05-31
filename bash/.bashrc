eval "$(starship init bash)"

alias resh="$SHELL"

alias nrs="sudo nixos-rebuild switch --flake ~/nixos"
alias nfu="sudo nix flake update --flake ~/nixos"
alias lg="lazygit"

alias en="cd ~/nixos/ && nvim ."
alias ed="cd ~/dotfiles/ && nvim ."
alias eb="cd ~/dotfiles/bash/ && nvim .bashrc"
alias eh="cd ~/dotfiles/hypr/.config/hypr/ && nvim ."
alias ev="cd ~/dotfiles/nvim/.config/nvim/ && nvim ."

alias kb="cd ~/projects/qmk_userspace/keyboards/grooovebob/dasbob/keymaps/aeraglyx/ && nvim ."
