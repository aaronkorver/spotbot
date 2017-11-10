# Description:
#   Makes hubot report version information to the room after hubot is restarted.
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_HEROKU_API_KEY
#
# Commands:
#   hubot version - The robot reports its version to the room.
#   hubot version subscribe - The robot reports its version to the room after restarts.
#   hubot version unsubscribe - The robot no longer reports its version to the room after restarts.
#
# Author:
#   Matthew.Rick2

Log = require 'log'
{inspect} = require 'util'

@robot = undefined

logger = new Log process.env.HUBOT_LOG_LEVEL or 'info'

githubApiKey = process.env.HUBOT_GITHUB_API_KEY
herokuApiKey = process.env.HUBOT_HEROKU_API_KEY

# Makes it possible for this to work locally
defaultVersion = {
    "app": {
      "id": "df1tSha-a9e1-4ffb-94f3-0a447ea18932",
      "name": "target-spotbot"
    },
    "created_at": "2015-01-01T01:01:01Z",
    "description": "Deploy df1tSha",
    "id": "df1tSha-96d0-4ade-99c2-4b03a90131ce",
    "slug": {
      "id": "df1tSha-fcf6-4e2d-b172-8aa302f1bea8"
    },
    "updated_at": "2015-01-01T01:01:01Z",
    "user": {
      "email": "aer@the-greater-reeves.com",
      "id": "df1tSha-4ce5-4fe4-8d48-eb336b79d0ee"
    },
    "version": 320
}

module.exports = (robot) ->

  @robot = robot

  unless herokuApiKey?
    logger.warning "The HUBOT_HEROKU_API_KEY environment variable is not set"

  robot.brain.on 'loaded', =>
    # We need to wait to make sure we've actually entered the rooms before we
    # try to talk in them.  The Hipchat adapter doesn't really emit an
    # appropriate event for figuring that out, unfortunately.
    setTimeout(onReady.bind(this), 10 * 1000)

  robot.respond /version$/i, (msg) ->
    messageRoom(msg.message.user.reply_to, robot.brain.data.version || defaultVersion)

  robot.respond /version subscribe/i, (msg) ->
    rooms = robot.brain.data.adminRooms || []
    if (!(msg.message.user.reply_to in rooms))
      rooms.push(msg.message.user.reply_to)
      robot.brain.data.adminRooms = rooms
      msg.send "This room will now be notified of #{robot.name}'s version on restart."
    else
      msg.send "This room was already being notified of #{robot.name}'s version on restart."

  robot.respond /version unsubscribe/i, (msg) ->
    rooms = robot.brain.data.adminRooms || []
    if (msg.message.user.reply_to in rooms)
      newRooms = []
      for room in rooms
        if !(room is msg.message.user.reply_to)
          newRooms.push room
      robot.brain.data.adminRooms = newRooms
      msg.send "This room will no longer be notified of #{robot.name}'s version on restart."
    else
      msg.send "This room wasn't being notified of #{robot.name}'s version on restart."

onReady = () ->
    oldVersion = @robot.brain.data.version || defaultVersion
    @robot.http("https://api.heroku.com/apps/target-spotbot/releases")
    .header('Accept', 'application/vnd.heroku+json; version=3')
    .header('Authorization', "Bearer #{herokuApiKey}")
    .header('Range', "version ..; order=desc,max=1;")
    .get() (err, response, body) ->
      rooms = @robot.brain.data.adminRooms || ['shell']

      if response?.statusCode != 200
        newVersion = defaultVersion
      else
        newVersion = JSON.parse(body).pop()

      for room in rooms
        messageRoom(room, newVersion, oldVersion, "#{@robot.name} starting up...")

      if (newVersion['version'] != oldVersion['version'])
        @robot.brain.data.version = newVersion

messageRoom = (room, newVersion, oldVersion, firstLine) ->
  messageLines = []

  if (firstLine?)
    messageLines.push(firstLine)

  messageLines.push("#{@robot.name}'s version is v#{newVersion['version']}: #{newVersion['description']} (deployed by #{newVersion['user']['email']})")

  if (oldVersion? && newVersion['version'] != oldVersion['version'])
    messageLines.push("#{@robot.name}'s last start was version v#{oldVersion['version']}: #{oldVersion['description']} (deployed on #{oldVersion['updated_at']} by #{oldVersion['user']['email']})")
    newSha = newVersion['description'].match('Deploy (.*)')[1]
    oldSha = oldVersion['description'].match('Deploy (.*)')[1]
    messageGitCommits(room, newSha, oldSha)

  @robot.messageRoom(room, messageLines.join("\n"))

messageGitCommits = (room, newestCommit, lastMessagedCommit) ->
  if (githubApiKey)
    url = "https://git.target.com/api/v3/repos/aaronkorver/spotbot/commits?access_token=#{githubApiKey}&sha=#{newestCommit}"
    logger.info url
    @robot.http(url)
    .get() (err, response, body) ->
      messageLines = ["Changes:"]
      for commit in JSON.parse(body)
        commitSha = commit['sha'].substring(0,7)
        if (commitSha == lastMessagedCommit)
          break
        else
          commitMessage = commit['commit']['message'].split("\n")[0]
          commitAuthor = commit['commit']['author']['name']
          messageLines.push("#{commitSha} #{commitAuthor} -- #{commitMessage}")
      if (messageLines.length)
        @robot.messageRoom(room, messageLines.join("\n"))
