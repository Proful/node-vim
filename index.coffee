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
    # TODO: just given default mode 0777. Not sure much.
    # I think 777 gives read,write and execute access to the user
    # Looks like node does not support creating folder with relative path. '~/.vim'
    # I got error: Error: ENOENT, No such file or directory '~/.vim'
    fs.mkdirSync process.env.HOME + '/.vim',0777
    console.log 'Created .vim folder'
    fs.mkdirSync process.env.HOME + '/.vim/autoload',0777
    console.log 'Created .vim/autoload folder'
