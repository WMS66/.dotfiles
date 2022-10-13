source ~/.profile
export PATH={$PATH}:/usr/local/mysql-8.0.12-macos10.13-x86_64/bin 

# Setting PATH Mysql
# export PATH={PATH}:/usr/local/mysql/bin


# Setting PATH for Python 3.10
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
export PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Setting PAHT poetry
export PATH="$HOME/.poetry/bin:$PATH"

# Setting Oracle
export ORACLE_HOME=/app/oracle/product/10.2.0/db_1
export PATH=/usr/local/mysql/bin:$PATH
export PATH=${PATH}:/usr/local/mysql/bin/
# export PATH="/usr/local/mysql/bin:$PATH"
alias startmysql='sudo /usr/local/mysql/support-files/mysql.server start'
alias stopmysql='sudo /usr/local/mysql/support-files/mysql.server stop'

# Colors
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CLICOLOR="auto"

alias ls="ls -G"
