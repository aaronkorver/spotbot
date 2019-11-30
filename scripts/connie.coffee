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
#   connie - Displays a random Daria gif
#
# Author:
#   dakota.reesebrown (based on brilliantfantastic's ackbar script)

threshold = 0

connies = [
  "http://i.giphy.com/10Iu43S5QuBTMc.gif"
  "http://i.giphy.com/5wBBmDD10iAg.gif"
  "http://i.giphy.com/H0lImuTYTVVWE.gif"
  "http://i.giphy.com/gaOxhtFQiYYeI.gif"
  "http://33.media.tumblr.com/c36bfc9aa9ef3f458b9350787e4e2c91/tumblr_mhs1a0vUzA1r42ynoo1_r3_500.gif"
  "http://33.media.tumblr.com/tumblr_ltjcx16vO21qzovtro1_500.gif"
  "http://i319.photobucket.com/albums/mm472/Astrid-Clothingline/Daria%20The%20Show/Daria%20gifs/tumblr_lmim4kf25R1qb3cw3.gif"
  "http://24.media.tumblr.com/tumblr_lshqisvAuw1r2wm2po1_r1_500.gif"
  "http://memecrunch.com/meme/NW9N/i-had-fun-once-daria/image.png?w=400&c=1"
  "http://www.quickmeme.com/img/f6/f691f5113467a86b8a9cbc8aab79d5c584b9bcfaf1210e7c78f73bed21b87672.jpg"
  "http://media-cache-ec0.pinimg.com/736x/c1/fd/4e/c1fd4ecc0d24e3ff66f7a997e5848a7c.jpg"
  "http://cdn.meme.am/instances/500x/11581930.jpg"
  "http://i319.photobucket.com/albums/mm472/Astrid-Clothingline/Daria%20The%20Show/Daria%20gifs/tumblr_lmh6uwiHOC1qb3cw3.gif"
  "http://i319.photobucket.com/albums/mm472/Astrid-Clothingline/Daria%20The%20Show/Daria%20gifs/tumblr_lmh8v8Clka1qb3cw3.gif"
  "http://i.giphy.com/GUfGNG3G6hKZG.gif"
  "http://media.giphy.com/media/vUnZDxxAi513a/giphy.gif"
  "http://i319.photobucket.com/albums/mm472/Astrid-Clothingline/Daria%20The%20Show/Daria%20gifs/tumblr_lnk1oeENFJ1qcnbfpo1_400.gif"
  "http://media.tumblr.com/tumblr_lmh8v8Clka1qb3cw3.gif"
  "http://29.media.tumblr.com/tumblr_m3cox5LWCa1qjn7buo1_500.jpg"
]

module.exports = (robot) ->
  robot.hear /\bconnie\b/i, (msg) ->
    random = Math.random()
    roomThreshold = robot.thresholdStorage.getThreshold(msg, "connie", threshold)
    if random < roomThreshold
      msg.send msg.random connies
