# Borrowed from Vimothee Chalamet

url=$(git remote get-url origin)

if [[ $url == *github.com* ]]; then
    if [[ $url == git@* ]]; then
        url="${url#git@}"
        url="${url/:/\/}"
        url="https://$url"
    fi
    xdg-open "$url" & disown
else
    echo "This repository is not hosted on GitHub"
fi
