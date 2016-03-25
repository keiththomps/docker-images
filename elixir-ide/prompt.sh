# Set default variables
export SHELL=/bin/bash
export EDITOR=vim
export PATH=$PATH:/opt/elixir-1.2.2/bin

# Set directory and file colors for ls
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=''

# Allow for case insensitive terminal (for cd, ls, etc)
bind "set completion-ignore-case on"

# Segment customizing the look and feel of the prompt
# This first block sets up custom colors that can be used
txtblu='\e[0;34m' # Blue
txtcyn='\e[0;36m' # Cyan
txtrst='\e[0m'    # Text Reset

# Set up prompt format and git awareness
print_before_the_prompt () {
  printf "\n$txtblu%s: $txtcyn%s\n$txtrst" "$USER" "$PWD"
}
parse_git_dirty () {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}
PROMPT_COMMAND=print_before_the_prompt
PS1="\$([[ -n \$(git branch 2> /dev/null) ]] && echo \"[\")\[$txtblu\]\$(parse_git_branch)\[$txtrst\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \"]\")-> "
