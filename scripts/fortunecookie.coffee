# Description:
#   Listens for spotbot fortune cookie me
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   spotbot fortune cookie me
#
# Author:
#   EdwardConnolly

module.exports = (robot) ->
  robot.respond /fortunecookie me/i, (msg) ->
    msg.http("http://fortunecookieapi.com/v1/cookie?")
      .header('Accept', 'application/json')
      .get() (err, res, body) =>
        if err
          msg.send "Error getting a fortune cookie, maybe today is not your day?"
          return
        data = JSON.parse(body)
        if data.length <= 0
          msg.send "Unable to get a fortune cookie, perhaps mercury is in retrograde?"
          return
        data = data[0]
        fullmessage = "#{data.fortune.message} \n"
        fullmessage += "lesson : #{data.lesson.english} / #{data.lesson.chinese}\n"
        fullmessage += "pronunciation : #{data.lesson.pronunciation}\n"
        fullmessage += "lucky numbers : "
        fullmessage += "#{data.lotto.numbers[0]} "
        fullmessage += "#{data.lotto.numbers[1]} "
        fullmessage += "#{data.lotto.numbers[2]} "
        fullmessage += "#{data.lotto.numbers[3]} "
        fullmessage += "#{data.lotto.numbers[4]} "
        fullmessage += "#{data.lotto.numbers[5]}"

        msg.send fullmessage
