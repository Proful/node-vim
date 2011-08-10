fs = require 'fs'
exec = require('child_process').exec

home = process.env.HOME
config = fs.readFileSync "config.json"
configJson = JSON.parse(config)
for plugin in configJson["plugin"]
  console.log "Cloning #{plugin['git']}"
  script = "cd #{home}/.vim/bundle && git clone #{plugin['git']}"
  child = exec script,(error,stdout,stderr)->
    if error is not null
      console.log "git cloning failed : #{error}" 
    else
      console.log "git cloning successful"
