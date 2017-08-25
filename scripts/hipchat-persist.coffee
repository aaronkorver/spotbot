# Description:
#   Allows users to persist hubot in rooms after restart without the need to set
#   HUBOT_HIPCHAT_ROOMS
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot stay - The robot rejoins the room after restarts.
#   hubot don't stay - The robot no longer joins the room after restarts.
#   hubot list rooms - Lists the rooms the robot joins after restarts.
#
# Author:
#   Matthew.Rick2 (the evil twin!!!1!!)

Util = require "util"
rooms = []

module.exports = (robot) ->

  # robot.brain.on 'loaded', =>
  #   cleanYourRooms()
  #   if robot.adapter.connector?
  #     rooms = robot.brain.data.rooms || []
  #     for room in rooms
  #       robot.adapter.connector.join(room, 0)

  robot.respond /stay$/i, (msg) ->
    room = msg.message.user.reply_to
    if rooms.indexOf(room) is -1
      rooms.push room
      robot.brain.data.rooms = rooms
      msg.send "I'm here to stay. Try typing '#{getRobotName()} help' to see what I can do."
    else
      msg.send "I'm already staying in this room. Try typing '#{getRobotName()} help' to see what else I can do."

  robot.respond /do(n't| not) stay$/i, (msg) ->
    response = "#{getRobotName()} did not automatically join this room."
    banishingRoom = msg.message.user.reply_to
    newRooms = []
    for room in rooms
      if !(room is banishingRoom)
        newRooms.push room
      else
        response = "#{getRobotName()} will no longer join this room automatically."
    rooms = newRooms
    robot.brain.data.rooms = rooms
    msg.send response

  robot.respond /list rooms$/i, (msg) ->
    response = "#{getRobotName()} doesn't join any rooms automatically."
    if rooms.length
      lines = ["#{getRobotName()} joins these rooms on restart:"]
      for room in rooms
        lines.push "\t#{room}"
      response = lines.join("\n")
    msg.send response

  getRobotName = ->
    robot.name.charAt(0).toUpperCase() + robot.name.slice(1)

  cleanYourRooms = ->
    cleanedRooms = []
    rooms = robot.brain.data.rooms || []
    for room in rooms
      if cleanedRooms.indexOf(room) is -1
        cleanedRooms.push room
    robot.brain.data.rooms = cleanedRooms
