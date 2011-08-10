https = require 'https'
fs = require 'fs'

options = {
  host: 'raw.github.com',
  port: 443,
  path: '/tpope/vim-pathogen/HEAD/autoload/pathogen.vim'
}

https.get options, (res)->
  res.on 'data',(d)->
    fd = fs.openSync 'pathogen.vim', 'w'
    fs.writeSync fd, d.toString()
    fs.closeSync fd
