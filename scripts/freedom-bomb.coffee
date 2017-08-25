# Description:
#   FREEDOM!
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot freedom bomb => unleashes freedome

# Author:
#   Dak for AlisonBeattie

module.exports = (robot) ->
    robot.respond /freedom bomb/i, (msg) ->
        msg.send("https://s3.amazonaws.com/uploads.hipchat.com/171096/4162754/o2FpuSfLBGZShgp/freedom_bomb.gif") for num in [1..7]
