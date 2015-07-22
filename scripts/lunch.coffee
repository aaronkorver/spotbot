# Description:
#   None
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   lunch - Displays a random hamster eating gif
#
# Author:
#   cormick.white (based on brilliantfantastic's ackbar script)

threshold = 0.5
hamsters = [
    "http://i.kinja-img.com/gawker-media/image/upload/s--FKeB6IVI--/wk6expz4dxvkr9hzk7lp.gif"
    "http://www.manteresting.com/sites/default/files/field/image/nail/2014/Jul/21/giphy.gif"
    "http://i.kinja-img.com/gawker-media/image/upload/s--RqKaZ-bv--/dtphnp8tiqoyvzdjuagw.gif"
    "http://big.assets.huffingtonpost.com/hamsterpizza570.gif"
    "http://i.imgur.com/EQc5kqT.gif"
    "http://usatftw.files.wordpress.com/2014/09/anigif_enhanced-20618-1410890581-30.gif?w=640&h=361"
    "http://i.kinja-img.com/gawker-media/image/upload/t_original/g6zhkmffsh6ixoqzgpo2.gif"
    "http://www.motherjones.com/files/BrowserPreview_tmp-2_0.gif"
]

module.exports = (robot) ->
    robot.hear /(^|[\s])\blunch\b/i, (msg) ->
        random = Math.random()
        if random < threshold
            msg.send msg.random hamsters
