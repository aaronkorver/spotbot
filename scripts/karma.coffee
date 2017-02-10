# Description:
#   Fights with the karma hipchat plugin.  For the lolz.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Author:
#   matthew.rick2

threshold = 0

module.exports = (robot) ->
  robot.hear /(@.*)\b\s?(\++)/i, (message) ->

    random = Math.random()
    roomThreshold = robot.thresholdStorage.getThreshold(message, "karma", threshold)

    if random < roomThreshold
      minuses = Array(message.match[2].length+1).join "-"

      message.send "@#{message.mention_name}#{minuses}"
      message.send "#{message.match[1]}#{minuses}"
