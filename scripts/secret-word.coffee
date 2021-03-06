# Description:
#   Pee Wee Problem
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_SECRETWORD_ADMIN
#
# Commands:
#   hubot the secret word is <word> - changes secret word to <word> if user is admin
#   hubot what is the secret word - tells you the secret word if user is admin
#
# Author:
#   Jordan McGowan and Rory Straubel

secretWord = "astrobleme"
done = [
  "Consider it done."
  "You got it, Coach."
  "Anything you say."
]
threshold = 1

module.exports = (robot) ->

  robot.brain.on 'loaded', =>
    secretWord = robot.brain.get("secretWord") || "astrobleme"

  unless process.env.HUBOT_SECRETWORD_ADMIN?
    robot.logger.warning 'The HUBOT_SECRETWORD_ADMIN environment variable not set'

  if process.env.HUBOT_SECRETWORD_ADMIN?
    admins = (admin.toLowerCase() for admin in process.env.HUBOT_SECRETWORD_ADMIN.split ',')
  else
    admins = []

  robot.respond /who are the secret word admins/i, (msg) ->
      for admin in admins
          msg.send admin

  robot.respond /what is the secret word/i, (msg) ->
    if msg.message.user.mention_name?
      sender =  msg.message.user.mention_name.toLowerCase()
    else
      sender = msg.message.user.name.toLowerCase()

    if sender in admins
      msg.send "The secret word is " + secretWord
    else
      msg.send "#{sender} is not an admin, you cannot do that!"

  robot.respond /the secret word is (.*)/i, (msg) ->
    if msg.message.user.mention_name?
      sender =  msg.message.user.mention_name.toLowerCase()
    else
      sender = msg.message.user.name.toLowerCase()

    if sender in admins
      secretWord = msg.match[1]
      robot.brain.set("secretWord", secretWord)
      msg.send msg.random done
    else
      msg.send "#{sender} is not an admin, you cannot do that!"

  robot.hear /.*/, (msg) ->
    random = Math.random()
    roomThreshold = robot.thresholdStorage.getThreshold(msg, "secret-word", threshold)
    word = ///(\b#{secretWord}\b)///i
    bot = ///^#{robot.name}\b///i
    if word.test(msg.message)
      if not bot.test(msg.message) and random < roomThreshold
        msg.send "YOU SAID THE SECRET WORD! EVERYBODY SCREAM REAL LOUD!"
        msg.send "https://s3.amazonaws.com/uploads.hipchat.com/171096/2268827/ZzKYO7E7K2nZu8v/ZWARaOZ.gif"
