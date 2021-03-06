# Description:
#   Listens for use of @all and responds with appropriate gif to help get the attention you need
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Author:
#   Matt Duffin

threshold = 0

clarioncall = [
  "http://i.giphy.com/5YhFFUFq6ZTry.gif"
  "http://i.imgur.com/eulNxcI.gif"
  "http://i.giphy.com/W7oJhW48rO0ww.gif"
  "https://33.media.tumblr.com/effaee30583975831a092120639e52b2/tumblr_n1qrklV4zZ1t7i4r6o1_500.gif"
  "http://i.perezhilton.com/wp-content/uploads/2014/08/warriors.gif"
]

module.exports = (robot) ->
  robot.hear /(@all\b|@here\b)/i, (msg) ->
    random = Math.random()
    roomThreshold = robot.thresholdStorage.getThreshold(msg, "clarioncall", threshold)
    if random < roomThreshold
      msg.send msg.random clarioncall
