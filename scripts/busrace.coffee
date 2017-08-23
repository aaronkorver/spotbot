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

module.exports = (robot) ->
  robot.hear /bus race/i, (message) ->
    message.send "|----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----|\n|(strugglebus)a\n|(strugglebus)b\n|----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----|\nON YOUR MARK!"
    setTimeout ->
      message.send "s/ON YOUR MARK!/ON YOUR MARK! -- GET SET!"
    , 1000
    setTimeout ->
      message.send "s/ON YOUR MARK! -- GET SET!/ON YOUR MARK! -- GET SET! -- GOOOOOO!"
    , 2000

    apos = 0
    bpos = 0
    while apos < 10 and bpos < 10
      random = Math.random()
      if random > .5
        apos +=1
        setTimeout ->
          message.send "s/(strugglebus)a/----- (strugglebus)a"
        , 3000 + 200 * (apos+bpos)
      else
        bpos +=1
        setTimeout ->
          message.send "s/(strugglebus)b/----- (strugglebus)b"
        , 3000 + 200 * (apos+bpos)

    if apos == 10
      setTimeout ->
        message.send "s/ON YOUR MARK! -- GET SET! -- GOOOOOO!/BUS A WINS!"
      , 3000 + 200 * (apos+bpos)
      while bpos < 10
        bpos +=1
        bpos +=1
        setTimeout ->
          message.send "s/(strugglebus)b/----- (strugglebus)b"
        , 3000 + 200 * (apos+bpos)
    else
      setTimeout ->
        message.send "s/ON YOUR MARK! -- GET SET! -- GOOOOOO!/BUS B WINS!"
      , 3000 + 200 * (apos+bpos)
      while apos < 10
        apos +=1
        bpos +=1
        setTimeout ->
          message.send "s/(strugglebus)a/----- (strugglebus)a"
        , 3000 + 200 * (apos+bpos)
