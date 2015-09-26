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

alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'
alias sites="cd ~/www"
alias zprofile="atom ~/.zshrc"
alias cca="drush cc all"
alias dev="git checkout dev"
alias stage="git checkout stage"
alias mysql="mysql -u root -p"
alias keith="ssh root@keith.solutions"
alias o="open ."
alias ao="atom ."


deploy() {
  local branch=$(current_branch)
  ggl
  ggp
  echo .......Checking out
  echo $1
  git checkout $1
  ggl
  echo .......Merging
  echo $branch
  git merge $branch
  ggp
  git checkout $branch
  echo .......Success
}
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

perm () {
  sudo chmod -R 777 $1
}
fra () {
  drush features-revert-all -y
}
den () {
  drush en $1 -y
}
sfp() {
  drush variable-set stage_file_proxy_origin "$@"
}
commit () {
  ga -A :/
  gcmsg "$@"
  ggl
  ggp
}

# Site aliases
alias ringling="cd ~/www/rng-mainsite/site/sites/all"
alias atl="cd ~/www/atlarge-site-2014/site/sites/all"
alias dvm="cd ~/www/petco-dvm/site/sites/all"
alias tog="cd ~/www/tog-drupal/site/sites/all"
alias trac="cd ~/www/trac/site/sites/all"

# Codesniffing
alias drupalcs="phpcs --standard=/Users/keithcaulkins/.drush/coder/coder_sniffer/Drupal --extensions='php,module,inc,install,text,profile,theme,js,css,info,txt'"
source ~/.bin/z/z.sh
