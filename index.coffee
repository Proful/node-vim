fs = require('fs')
exec = require('child_process').exec
path = require('path')

home = process.env.HOME

# Delete non empty folder (synch) 
# From rimraf logic
rmnedirSync = (p)->
  s = fs.lstatSync(p)
  if not s.isDirectory() 
    fs.unlinkSync(p)
  else
    fs.readdirSync(p).forEach (f) -> 
      rmnedirSync(path.join(p, f))
    fs.rmdirSync(p)

# Remove if the file already exists
rmIfExists = (filePath)->
  if(path.existsSync(filePath))
    if fs.statSync(filePath).isFile()
      fs.unlinkSync filePath
      console.log "Removing file #{filePath}"
    else
      rmnedirSync filePath
      console.log "Removing directory #{filePath}"
  else
    console.log "File not exist: #{filePath}"

# Verify .vimrc.old, .gvimrc.old and .vim.old if present remove it
rmIfExists "#{home}/.vimrc.old"
rmIfExists "#{home}/.gvimrc.old"
rmIfExists "#{home}/.vim.old"


# backup .vim directory if already available
# used the following script from janus.
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
    fs.mkdirSync home + '/.vim', 0777
    console.log 'Created .vim folder'
    fs.mkdirSync home + '/.vim/autoload',0777
    console.log 'Created .vim/autoload folder'

    # Retrieving pathogen.vim file
    options = {
      host: 'raw.github.com',
      port: 443,
      path: '/tpope/vim-pathogen/HEAD/autoload/pathogen.vim'
    }

    # Retrieving pathogen.vim file and saving in .vim/autoload
    https.get options, (res)->
      res.on 'data',(d)->
      fd = fs.openSync "#{home}/.vim/autoload/pathogen.vim", 'w'
      fs.writeSync fd, d.toString()
      fs.closeSync fd
      console.log 'pathogen.vim copied to ~/.vim/autoload '
