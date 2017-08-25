# Description:
#   WUBBA LUBBA DUB DUB
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   WLDD
#
# Author:
#   Clayton Beyers
threshold = 0.75

module.exports = (robot) ->
  robot.hear /WLDD/i, (message) ->
    random = Math.random()
    roomThreshold = robot.thresholdStorage.getThreshold(message, "WLDD", threshold)
    if random < roomThreshold
      message.send "http://ih0.redbubble.net/image.104525267.7495/flat,1000x1000,075,f.jpg"
