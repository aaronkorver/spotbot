# Description:
#   Clearly illustrate with an image what people mean whenever they say "wtf"
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   wtf
#
# Author:
#   arudge

threshold = 0

wtf = [
  "http://i.imgur.com/P2vkwAS.gif"
  "http://media.giphy.com/media/xw1vTI3HYbB6M/giphy.gif"
  "http://media.giphy.com/media/jwKE2r7zbiL9m/giphy.gif"
  "http://media.giphy.com/media/NLbivNFUwhoTm/giphy.gif"
  "http://media2.giphy.com/media/HlFDE0DEp9Gq4/giphy.gif"
  "http://media.giphy.com/media/NJkIw5wfnM3e0/giphy.gif"
  "http://media.giphy.com/media/Zc74HFG3OZBLO/giphy.gif"
  "http://media.giphy.com/media/1eSFCxINhCNFe/giphy.gif"
  "https://s3.amazonaws.com/uploads.hipchat.com/171096/1531231/Z47IaqDG5dHT0rP/wtf.gif"
  "https://s3.amazonaws.com/uploads.hipchat.com/171096/1531231/iw2thmpeZpShMwl/sarah-wtf.gif"
]

module.exports = (robot) ->
  robot.hear /wtf\b/i, (message) ->
    random = Math.random()
    roomThreshold = robot.thresholdStorage.getThreshold(message, "wtf", threshold)
    if random < roomThreshold
      message.send message.random wtf
