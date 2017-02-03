# Description
#    Blocker Gif
#
# Dependencies
#    None
#
# Configuration:
#    None
#
# Commands:
#    block - displays blocker gif
#    blocks - displays blocker gif
#    blocker  - displays blocker gif
#
# Author
#    Dana Hazen

threshold = 0.0

module.exports = (robot) ->
  robot.hear /\bblock(er|s|ers)?\b/i, (message) ->
    random = Math.random()
    roomThreshold = robot.thresholdStorage.getThreshold(message, "blocker", threshold)
    if random < roomThreshold
      message.send "https://s3.amazonaws.com/uploads.hipchat.com/171096/4162754/IklrILMnx50T98g/blocker.gif"
	  
