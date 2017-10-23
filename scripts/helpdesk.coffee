# Description:
#   Hubot responds to any mention of the phrase 'help desk' or 'helpdesk'
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot helpdesk - Prints out the helpdesk number & URL
# Author:
#   Rod
#
helpdesk_msg = "The Minneapolis help desk number is (612) 304-4357 or https://targetprod.service-now.com/sp"


module.exports = (robot) ->
  robot.respond /help ?desk\b/i, (msg) ->
      msg.send helpdesk_msg

  robot.respond /\bcsc\b/i, (msg) ->
      msg.send helpdesk_msg
