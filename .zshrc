# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx aws)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
export PATH="/Users/keithcaulkins:$PATH"
export PATH="/usr/local/bin:$PATH"

# PHP path for drush
export PATH="/Applications/MAMP/Library/bin:/Applications/MAMP/bin/php/php5.3.29/bin:$PATH"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nano'
 else
   export EDITOR='atom'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias sites="cd ~/www"
alias zprofile="sudo nano ~/.zshrc"
alias cca="drush cc all"
alias dev="git checkout dev"
alias stage="git checkout stage"
alias mysql="mysql -u root -p"
alias keith="ssh root@keith.solutions"
alias o="open ."
alias ao="atom ."

# Usage:
# deploy master
# Pulls and pushes current branch, checks out target branch, merges original branch in,
# pushes branch, then checks out original branch.
deploy() {
  local branch=$(current_branch)
  ggl
  ggp
  echo .......Checking out $1
  git checkout $1
  ggl
  echo .......Merging $branch
  git merge $branch
  ggp
  git checkout $branch
  echo .......Success
}

# Usage: importDB test_db ~/Downloads/database.sql
# Imports into database($1) the selected file ($2)
# For use on non-Drupal sites
importDB() {
  /Applications/MAMP/library/bin/mysql -u root -p $1 < $2
}

# Usage:
# dimp ~/Downloads/database.sql
dimp() {
  # Create DB from settings.php DB name.
  # If DB exists, it will drop it first.
  drush sql-create -y
  # Connects to database and imports database file
  `drush sql-connect` < $1
  drush sql-sanitize -y
  drush cc all
}

# Sets entire directory with as open permissions as possible (dangerous!)
perm () {
  sudo chmod -R 777 $1
}

# Reverts all Drupal features
fra () {
  drush features-revert-all -y
}

# Downloads Drupal module (if it doesn't exist) and enables it.
den () {
  drush en $1 -y
}

# Sets stage file proxy variable within Drupal - http://drupal.org/stage_file_proxy
sfp() {
  drush variable-set stage_file_proxy_origin "$@"
}

# Usage: commit 'message'
# Adds all changed files, commits with message, pulls then pushes to current branch.
commit () {
  ga -A :/
  gcmsg "$@"
  ggl
  ggp
}

# Z - https://github.com/rupa/z
source ~/.bin/z/z.sh
