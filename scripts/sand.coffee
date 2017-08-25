# Description:
#   POCKET SAND
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   pocket sand - displays the pocket sand gif
#
# Author:
#   Nick Pabon

threshold = 1
sands= [
 "http://i.imgur.com/cMzI6gu.gif"
 "http://i.imgur.com/HTBXvCN.jpg"
 "http://i.imgur.com/KNHOfr3.gif"
 "http://i.imgur.com/0QON3dO.gif"
 "http://i.imgur.com/xOD9QGH.gif"
 "http://cdn.makeagif.com/media/1-22-2014/kKl4wR.gif"
 "http://i.imgur.com/6cFt1xY.gif"
 "http://i.imgur.com/j3MR3cS.gif"
 "https://i.imgur.com/2Umzspc.gif"
 "http://i.imgur.com/Nm1twBk.gif"
 "https://thumbs.gfycat.com/IncompleteGiftedFly-size_restricted.gif"
 "http://i.imgur.com/TpHkT.gif"
]


module.exports = (robot) ->
  robot.hear /pocket ?sand/i, (msg) ->
    random = Math.random()
    roomThreshold = robot.thresholdStorage.getThreshold(msg, "sand", threshold)
    if random < roomThreshold
      msg.send msg.random sands
