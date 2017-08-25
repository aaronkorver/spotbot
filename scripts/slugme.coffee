
# Description:
#   I WANT SLUGS
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot slug bomb - Display slugs when someone mentions Slug Bomb
#
# Author:
#   Tarah Slug Cleveland
#

slugPics= [
    'http://i.dailymail.co.uk/i/pix/2016/09/03/01/19977126000005DC-3771792-The_Spanish_Slug_Latin_name_Arion_vulgaris_was_identified_in_the-m-103_1472863041898.jpg'
    'https://pics.onsizzle.com/put-a-circle-of-salt-around-it-so-i-could-5052418.png'
    'http://i1.mirror.co.uk/incoming/article1322652.ece/ALTERNATES/s615/Brown%20Slug'
    'http://s2.quickmeme.com/img/12/1230130afe78896f103669f1198994f7d9b8a3cd97e307d840576bf7541c7c0a.jpg'
    'http://i2.kym-cdn.com/photos/images/facebook/000/932/087/b1a.jpg'
    'https://image.shutterstock.com/z/stock-photo-funny-slug-cartoon-95721493.jpg'
    'https://s-media-cache-ak0.pinimg.com/originals/4c/00/41/4c0041d66298bdf52396c1ed68954f86.jpg'
    'http://68.media.tumblr.com/c600a5a985ae60b8f2a780f6e5fa50ca/tumblr_nt2xh26OCE1udjm4ko1_1280.jpg'
    'http://static.diffen.com/uploadz/c/c1/slug2.jpg'
    'http://3.bp.blogspot.com/-cg9abDbYbpY/UhJ0swVhnuI/AAAAAAAAE0U/fbRy1qj1JQU/s1600/slugs+n+snails+SDC19510.JPG'
]

module.exports = (robot) ->
  robot.hear /\bslug ?bomb\b/i, (msg) ->
    for slug in slugPics
      msg.send slug
