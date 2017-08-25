# Description:
#   For when stuff is fubar
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot dumpster fire - displays dumpster fire
#
# Author:
#   AlexWolf

threshold = 1.0

module.exports = (robot) ->
  robot.respond /dumpster\s?fire\b/i, (message) ->
    message.send "https://s3.amazonaws.com/uploads.hipchat.com/171096/2336124/f9VF0juPpCX5cu2/dumpster.gif"


  robot.hear /\(dumpsterfire2?\)/i, (message) ->
    random = Math.random()
    roomThreshold = robot.thresholdStorage.getThreshold(message, "dumpster", threshold)
    if random < roomThreshold
      message.send "https://s3.amazonaws.com/uploads.hipchat.com/171096/2336124/f9VF0juPpCX5cu2/dumpster.gif"
