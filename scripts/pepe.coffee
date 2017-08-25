# Description:
#   fixing the Pepe meme hipchat removed
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   (feelsgoodman) - displays pepe feels good man meme
#   (feelsbadman) - displays pepe feels bad man meme
#
# Author:
#   Aaron.E.Reeves

threshold = 0.00

module.exports = (robot) ->
  robot.hear /\b(feelsbadman)\b/i, (message) ->
    random = Math.random()
    roomThreshold = robot.thresholdStorage.getThreshold(message, "pepe", threshold)
    if random < roomThreshold
      message.send "https://s3.amazonaws.com/uploads.hipchat.com/171096/2297566/i38SbatCbJph80K/pepe-feelsbad.png"

  robot.hear /\b(feelsgoodman)\b/i, (message) ->
    random = Math.random()
    roomThreshold = robot.thresholdStorage.getThreshold(message, "pepe", threshold)
    if random < roomThreshold
      message.send "https://s3.amazonaws.com/uploads.hipchat.com/171096/2297566/3GN2G8srDdeKuoW/pepe-feelsgood.png"
