# Description:
#   Works every time
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   works every time - colt 45
#
# Author:
#   atmos

module.exports = (robot) ->
  robot.hear /works every time/i, (message) ->
    message.send "https://s3.amazonaws.com/uploads.hipchat.com/171096/1531191/eovVa6qUlovrHuC/colt45web.jpeg"
