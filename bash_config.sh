c_default='\[\e[0m\]'
c_path='\[\e[37;44m\]'
c_host='\[\e[01;32m\]'
c_green='\[\e[0;32m\]'
c_red='\[\e[0;31m\]'

PROMPT_COMMAND='PS1="\A [${c_host}\h${c_default}]:${c_path} \w ${c_default}$(git_status)\$ "'

# Get the state of the branch (if there is a branch)
git_status ()
{
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi
  # sed the current branch
  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  # check the diff for the state of the branch
  if git diff --quiet 2>/dev/null >&2; then
    git_color="${c_green}"
  else
    git_color=${c_red}
  fi
  echo " [$git_color$git_branch$c_default]"
}

