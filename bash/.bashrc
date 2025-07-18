eval "$(starship init bash)"

alias resh="$SHELL"

alias nrs="sudo nixos-rebuild switch --flake ~/nixos#${hostname}"
alias nrt="sudo nixos-rebuild test --flake ~/nixos#${hostname}"
alias nfu="sudo nix flake update --flake ~/nixos#${hostname}"
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
