# Description:
#  maze time -- get the red guy to the green exit
#
# Dependencies:
#  None
#
# Configuration:
#  None
#
# Commands:
#  hubot maze start - starts a maze if one isn't started
#  hubot maze redraw - redraws the maze if something happens to spotbot
#  hubot maze left - move left in the maze
#  hubot maze right - move right in the maze
#  hubot maze up - move up in the maze
#  hubot maze down - move down in the maze
#
# Author:
#  Edward Connolly

mazes = [] #List of all rooms with a current maze
maze_w = 25 #Maze Width
maze_h = 17 #Maze Height

module.exports = (robot) ->
  robot.brain.on 'loaded', =>
    mazes = robot.brain.get("maze_time_mazes") || []

  robot.respond /maze start/i, (message) ->
    mazeid = message.message.room
    if mazeid == "undefined"
      mazeid = message.message.user.jid
    if mazeid !in mazes
      mazes.push mazeid
      maze = []

      #create borders and empty space
      for y in [0...maze_h]
        maze_row = []
        for x in [0...maze_w]
          if y == 0 || x == 0 || y == maze_h - 1 || x == maze_w - 1
            maze_row.push 1
          else
            maze_row.push 0
        maze.push maze_row

      #create maze
      for y in [1...maze_h-1]
        for x in [1...maze_w-1]
          if x%2 == 0 && y%2 == 0
            maze[y][x] = 1
            switch Math.round(Math.random()*4)
              when 1 then maze[y-1][x] = 1
              when 2 then maze[y+1][x] = 1
              when 3 then maze[y][x-1] = 1
              when 4 then maze[y][x+1] = 1
      maze[1][1] = 2
      maze[maze_h-2][maze_w-2] = 3

      robot.brain.set("maze_time_mazes", mazes)
      robot.brain.set("maze_time_"+mazeid+"_maze", maze)
      robot.brain.set("maze_time_"+mazeid+"_x", 1)
      robot.brain.set("maze_time_"+mazeid+"_y", 1)
      robot.brain.set("maze_time_"+mazeid+"_moves", 0)

      message.send drawstring(maze)

  robot.respond /maze left/i, (message) ->
    move(message, -1, 0)
  robot.respond /maze right/i, (message) ->
    move(message, 1, 0)
  robot.respond /maze up/i, (message) ->
    move(message, 0, -1)
  robot.respond /maze down/i, (message) ->
    move(message, 0, 1)

  robot.respond /maze redraw/i, (message) ->
    mazeid = message.message.room
    if mazeid == "undefined"
      mazeid = message.message.user.jid
    if mazeid in mazes
      maze = robot.brain.get("maze_time_"+mazeid+"_maze")
      message.send drawstring(maze)

  move = (message, xdir, ydir) ->
    mazeid = message.message.room
    if mazeid == "undefined"
      mazeid = message.message.user.jid
    if mazeid in mazes
      maze = robot.brain.get("maze_time_"+mazeid+"_maze")
      x = robot.brain.get("maze_time_"+mazeid+"_x")
      y = robot.brain.get("maze_time_"+mazeid+"_y")
      moves = robot.brain.get("maze_time_"+mazeid+"_moves")

      if(maze[y+ydir][x+xdir] == 0 || maze[y+ydir][x+xdir] == 3)
        olval = maze[y+ydir][x+xdir]
        oldds = drawstring(maze)
        maze[y][x] = 0
        maze[y+ydir][x+xdir] = 2
        x += xdir
        y += ydir
        moves += 1

        message.send "s/"+oldds+"/"+drawstring(maze)

        if olval == 3
          message.send "Congraulations, you completed the maze in "+moves+" moves!"
          mazes = mazes.filter (word) -> word isnt mazeid
          robot.brain.set("maze_time_mazes", mazes)
        else
          robot.brain.set("maze_time_"+mazeid+"_maze", maze)
          robot.brain.set("maze_time_"+mazeid+"_x", x)
          robot.brain.set("maze_time_"+mazeid+"_y", y)
          robot.brain.set("maze_time_"+mazeid+"_moves", moves)

  drawstring = (maze) ->
    strmaze = ""
    for y in [0...maze_h]
      for x in [0...maze_w]
        switch maze[y][x]
          when 0 then strmaze+="(ws)"
          when 1 then strmaze+="(bs)"
          when 2 then strmaze+="(rs)"
          when 3 then strmaze+="(gs)"
      if y != maze_h - 1
        strmaze += "\n"
    return strmaze
