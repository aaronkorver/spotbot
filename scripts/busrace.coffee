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
#  hubot bus race start
#  hubot bet <0-25> <(cartwheel)|(strugglebus)|(nyancat)>
#  hubot bus race stats
#
# Author:
#  Edward Connolly

raceids = []
raceids_running = []
races = 0
c_wins = 0
b_wins = 0
n_wins = 0

module.exports = (robot) ->
  robot.brain.on 'loaded', =>
    raceids = robot.brain.get("bus_race_raceids") || []
    raceids_running = robot.brain.get("bus_race_raceids_running") || []
    races = robot.brain.get("bus_race_races") || 0
    c_wins = robot.brain.get("bus_race_cartwheel_wins") || 0
    b_wins = robot.brain.get("bus_race_strugglebus_wins") || 0
    n_wins = robot.brain.get("bus_race_nyancat_wins") || 0

  robot.respond /bus race stats/i, (message) ->
    strmsg = "(cartwheel) has won " + c_wins + "/" + races + " times.\n"
    strmsg += "(strugglebus) has won " + b_wins + "/" + races + " times.\n"
    strmsg += "(nyancat) has won " + n_wins + "/" + races + " times."
    message.send strmsg

  robot.respond /bet (.*) (.*)/i, (message) ->
    amount = message.match[1].strip()
    if amount < 0 or amount > 25
      amount = 25
    raceid = message.message.room

    emoji = message.match[2].strip()
    user = message.message.user.mention_name

    betobj = {user, emoji, amount}

    bets = robot.brain.get("bus_race_bets_"+raceid) || []
    cont = true
    if raceids.includes(raceid)
      for e in bets
        if e.user == user
          bets[bets.indexOf(e)] = betobj
          robot.brain.set("bus_race_bets_"+raceid,bets)
          cont = false
      if cont == true
        bets.push betobj
        robot.brain.set("bus_race_bets_"+raceid,bets)

  robot.respond /bus race start/i, (message) ->
    raceid = message.message.room #Math.floor(new Date().getTime() / 1000).toString(16).toUpperCase()
    if raceid !in raceids_running
      message.send "BETTING HAS OPENED FOR THE RACE -- BETTING CONCLUDES IN 40 SECONDS"
      setTimeout ->
        race(raceid, message)
      , 40000
      #raceids = robot.brain.get("bus_race_raceids") || []
      raceids.push(raceid)
      robot.brain.set("bus_race_raceids", raceids)
      robot.brain.set("bus_race_raceids_running", raceids)
      robot.brain.set("bus_race_bets_"+raceid,[])


  race = (raceid, message) ->
    #races = robot.brain.get("bus_race_raceids") || []
    raceids = raceids.filter (word) -> word isnt raceid
    robot.brain.set("bus_race_raceids", raceids)

    message.send "BETTING HAS CONCLUDED -- STARTING RACE "+raceid
    initstr  = "|----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----|\n"
    initstr += "|(strugglebus)\n"
    initstr += "|(cartwheel)\n"
    initstr += "|(nyancat)\n"
    initstr += "ON YOUR MARK!"

    message.send initstr
    setTimeout ->
      message.send "s/ON YOUR MARK!/ON YOUR MARK! -- GET SET!"
    , 1000
    setTimeout ->
      message.send "s/ON YOUR MARK! -- GET SET!/ON YOUR MARK! -- GET SET! -- GOOOOOO!"
    , 2000

    apos = 0
    bpos = 0
    cpos = 0
    while apos < 22 and bpos < 22 and cpos < 22
      random = Math.random()

      if random >= .666
        apos +=1
        setTimeout ->
          message.send "s/(strugglebus)/----- (strugglebus)"
        , 3000 + 100 * (apos+bpos+cpos)

      if random < .666 and random >= .333
        bpos +=1
        setTimeout ->
          message.send "s/(cartwheel)/----- (cartwheel)"
        , 3000 + 100 * (apos+bpos+cpos)

      if random < .333
        cpos +=1
        setTimeout ->
          message.send "s/(nyancat)/----- (nyancat)"
        , 3000 + 100 * (apos+bpos+cpos)

    setTimeout ->
      races += 1
      robot.brain.set("bus_race_races", races)
      if apos == 22
        message.send "s/(cartwheel)/(rip)"
        message.send "s/(nyancat)/(rip)"
        b_wins += 1
        robot.brain.set("bus_race_strugglebus_wins", b_wins)
        karmaspam(raceid, "(strugglebus)", b_wins)

      if bpos == 22
        message.send "s/(strugglebus)/(rip)"
        message.send "s/(nyancat)/(rip)"
        c_wins += 1
        robot.brain.set("bus_race_cartwheel_wins", c_wins)
        karmaspam(raceid, "(cartwheel)", c_wins)

      if cpos == 22
        message.send "s/(cartwheel)/(rip)"
        message.send "s/(strugglebus)/(rip)"
        n_wins += 1
        robot.brain.set("bus_race_nyancat_wins", n_wins)
        karmaspam(raceid, "(nyancat)", n_wins)
    , 3000 + 100 * (apos+bpos+cpos+1)

    karmaspam = (raceid, winner, numwin) ->
      #numwin = robot.brain.get("bus_race_"+winner.replace(")","").replace("(","")+"_wins")
      #numrac = robot.brain.get("bus_race_races")
      raceids_running = raceids_running.filter (word) -> word isnt raceid
      robot.brain.set("bus_race_raceids_running", raceids_running)
      message.send winner + " IS THE WINNER!\n"+winner+" now has "+numwin+" wins in "+races+" races!"

      bets = robot.brain.get("bus_race_bets_"+raceid) || []
      setTimeout ->
        cntr = 0
        karlist = []
        for e in bets
          st = "-"
          if e.emoji == winner
            st = "+"
          amt = e.amount
          for i in [0 .. Math.ceil(e.amount/5.0)-1]
            si = st
            for ii in [0 .. Math.min(amt-1,4)]
              si += st
            karlist.push(String("s/karma spam silent/@"+e.user + " " + si))
            amt -= 5
        for e in karlist
          setTimeout ->
            robot.messageRoom("171096_bus_race_karma_spam@conf.hipchat.com", karlist.pop())
          , 200 * cntr
          cntr += 1
      , 1000
