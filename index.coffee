fs = require('fs')
exec = require('child_process').exec

# backup .vim directory if already available
script = "for i in ~/.vim ~/.vimrc ~/.gvimrc; do [ -e $i ] && mv $i $i.old; done"
child = exec script,(error,stdout,stderr)->
  if error is not null
    console.log 'Backup failed. Manually do the backup for .vimrc, .gvimrc and .vim folders' 
    console.log 'error : ' + error
  else
    console.log 'Backup successfully done for the following files: '
    console.log '~/.vimrc ==> ~/.vimrc.old'
    console.log '~/.gvimrc ==> ~/.gvimrc.old'
    console.log '~/.vim ==> ~/.vim.old'

# Create ~/.vim folder
# Create ~/.vim/autoload folder

