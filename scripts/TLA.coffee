# Description:
#   Ask Spotbot about an acronym and learn what it is
#
# Dependencies:
#   None
#
# Commands:
#   hubot acronym <acronym>
#
# Author:
#   Nathan Ische-Knoblauch, Dillon Byrne, Sarah Bogaert, Stephanie Winsky

module.exports = (robot) ->
  robot.respond /acronym (.*)/i, (message) ->
    acronym = message.match[1].toUpperCase()
    firstLetter = acronym[0]
    isLetter = /[A-Z]/
    if !isLetter.test(firstLetter)
        message.send "Sorry we can only search for acronyms that start with letters, but it might still be on http://wiki.target.com/tgtwiki/index.php/Acronyms/0..9"
    else
      message.http("http://wiki.target.com/tgtwiki/index.php/Acronyms/#{firstLetter}?action=raw")
      .get() (err, res, body) ->
        data = body
        regexMatch = ///\*'''(\[\[)?#{acronym}(\]\])?''',(.*)///
        if regexMatch.test(data)
          result = data.match(regexMatch)[3]
          result = result.split("[").join("").split("]").join("").split(",").join(" or")
          result = "#{acronym} could mean#{result}"
          message.send "#{result}"
          message.send "Find more info at: http://wiki.target.com/tgtwiki/index.php/#{acronym}"
        else
          message.send "Sorry we couldn't find #{acronym} on http://wiki.target.com/tgtwiki/index.php/Acronyms"
