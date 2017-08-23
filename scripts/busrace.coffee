# Description:
#  bus race
#
# Dependencies:
#  None
#
# Configuration:
#  None
#
# Commands:
#  bus race
#
# Author:
#  Edward Connolly

sleep = (ms) ->
  start = new Date().getTime()
  continue while new Date().getTime() - start < ms

module.exports = (robot) ->
  robot.hear /bus race/i, (message) ->
    message.send "|----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----|\n|(strugglebus)a\n|(strugglebus)b\n|----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----|\nON YOUR MARK!"
    sleep(100)
    message.send "s/ON YOUR MARK!/ON YOUR MARK! -- GET SET!"
    sleep(100)
    message.send "s/ON YOUR MARK! -- GET SET!/ON YOUR MARK! -- GET SET! -- GOOOOOO!"

    apos = 0
    bpos = 0
    while apos < 10 and bpos < 10
      random = Math.random()
      if random > .5
        apos +=1
        message.send "s/(strugglebus)a/----- (strugglebus)a"
      else
        bpos +=1
        message.send "s/(strugglebus)b/----- (strugglebus)b"

    if apos == 10
      message.send "s/ON YOUR MARK! -- GET SET! -- GOOOOOO!/BUS A WINS!"
      while bpos < 10
        bpos +=1
        message.send "s/(strugglebus)b/----- (strugglebus)b"
    else
      message.send "s/ON YOUR MARK! -- GET SET! -- GOOOOOO!/BUS B WINS!"
      while apos < 10
        apos +=1
        message.send "s/(strugglebus)a/----- (strugglebus)a"
