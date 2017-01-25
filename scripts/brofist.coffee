# Description:
#   Get a brofist through the internet
#
# Commands:
#   hubot brofist[ me] - Receive a brofist through the internet

module.exports = (robot) ->
  robot.respond /brofist( me)?/i, (msg) ->
    msg.send 'https://s3.amazonaws.com/uploads.hipchat.com/171096/1531208/GYev8dquH9ZKt6G/upload.png'
