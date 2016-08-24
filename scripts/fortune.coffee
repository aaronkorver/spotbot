# Description:
#   Displays a Target brand fortune from overheard-at-Target.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot fortune - Displays a quote overlayed on a Bullseye image
#
# Author:
#   Matthew.Rick2 (the evil twin)

createMeme = require('./lib/img-flip')

templates = [44448051,44448759]

quotes =
[
	["We all hang out over here because Greg Case is pretty much the coolest.", "--Matt Rick"]
	["We suck. We're sorry. Come help us.", "--Elwin Loomis"]
	["Work. Together. Nothing at Target is someone else's problem.", "--Alan Wizemann"]
	["Any person can lead a horse to water, but it takes a really strong person to drown a horse.", "--Brad Kiewel"]
	["Have some compassion for the the next person that has to read/maintain this code.", "--Greg Case"]
	["But what do I know, I come from a state where we cook bratwursts in beer.", "--Greg Case"]
	["It's not a toy, it's a vehicle.", "--Markus Silpala"]
	["So the when and the then are the where and the what? Yes, yes they are.", "--Tim Johnson"]
	["It's horrible in every way.", "--Greg Case"]
	["Pants just slow you down.", "--Max Thyen"]
	["Greg Case generates all the code for me.", "--Aaron Korver"]
	["How did they get that squirrel in the suit of armor!?", "--Theryn Groetken"]
	["Screw you guys, I'm switching to TMHS.", "--Alex Wall"]
	["God, I love the look of disappointment on people's faces when they realize that all that's in the candy bowl is boxes of raisins.", "--Matt Rick"]
	["This is a change without a difference.", "--Matt Rick"]
	["PHP was crawling around in Huggies when Perl was already at wizard level.", "--Rocky DeVries"]
	["I kind of want to pick up this story with no description . . . only because it's issue # 1337.", "--Matt Rick"]
	["That needing to wait till noon to drink thing is a myth.  You can drink anytime of the day.", "--Greg Case"]
]

module.exports = (robot) ->
	robot.respond /fortune(.*)/i, (msg) ->
		if msg.match[1] == "cookie me"
			return
		quote = quotes[randomIndex(quotes)]
		createMeme(msg, templates[randomIndex(templates)], quote[0], quote[1])

randomIndex = (array) ->
  Math.floor(Math.random() * array.length)
