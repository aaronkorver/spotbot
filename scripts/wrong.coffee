# Description:
#  Listens for 'wrong' and tells people when they are wrong in the worst kind of way
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot wrong - displays Trump wrong gif

#
# Author:
#   Jordan McGowan

threshold = 0.00

wrongGifs = ['https://media.giphy.com/media/3oz8xrkBxxhPyVFgek/giphy.gif',
'https://media.giphy.com/media/hPPx8yk3Bmqys/source.gif',
'https://media.giphy.com/media/3oz8xLd9DJq2l2VFtu/giphy.gif']

module.exports = (robot) ->
  robot.hear /\bwrong\b/i, (message) ->
    random = Math.random()
    roomThreshold = robot.thresholdStorage.getThreshold(message, "wrong", threshold)
    if random < roomThreshold
      message.send message.random wrongGifs
