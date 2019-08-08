# Customization
alias glo="git log --first-parent --pretty='%C(yellow)%h%Creset%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold cyan)<%an>%Creset'"

function gdist() { git rev-list $1..$2 --count --first-parent }
compdef _git gdist
