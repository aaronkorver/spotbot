# Description:
#   Listens for spotbot lunchspin me(.*)
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   spotbot lunchspin me
#     -> defaults to downtown lunch menu
#   spotbot lunchspin me north campus
#     -> north campus lunch menu
#
# Author:
#   EdwardConnolly

module.exports = (robot) ->
  robot.respond /lunchspin me(.*)/i, (message) ->
    place = message.match[1]
    if place == " north campus"
      url = "http://target.cafebonappetit.com/cafe/traders-point/"
    else
      url = "http://target.cafebonappetit.com/cafe/cafe-target/"
    robot.http(url)
      .get() (err, res, body) ->
        fooditems = []
        tmp = body.match(/Bamco.menu_items =(.*);/)
        arr = tmp[0].split '<\\/strong>'
        for itm in arr
          spc = itm.split "label"
          if spc.length > 1
            act = spc[1].split "\","
            label = act[0]
            label = label.replace /\"/, ""
            label = label.replace /:/, ""
            spc = itm.split "<strong>"
            category = spc[1]
            category = category.replace /@/, ""

            #message.send "You should eat "+label+"\" from the "+category+" station."
            fooditems.push "You should eat "+label+"\" from the "+category+" station."
        message.send message.random fooditems
