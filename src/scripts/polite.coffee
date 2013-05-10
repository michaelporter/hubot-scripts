# Description:
#   Polite.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#
# Author:
#   dannymcc
#
# Edits:
#   michaelporter

responses = [
  "You're welcome.",
  "No problem.",
  "Anytime.",
  "You are more than welcome.",
  "This is what I do",
  "Don't mention it."
]

shortResponses = [
  "yw",
  "np"
]

welcomeResponses = [
  "sup doodz",
  "sup",
  "yo"
]

farewellResponses = [
  "Goodbye",
  "Have a good night",
  "Bye",
  "Take care",
  "See you later"
]

defensiveResponses = [
  "Hey, I'm trying",
  "This is not an easy life",
  "I'm working on it, guys"
]

solidarityResponses = [
  "I'm with ya, brother",
  "I got your back"
]

# http://en.wikipedia.org/wiki/You_talkin'_to_me%3F
youTalkinToMe = (msg, robot) ->
  input = msg.message.text.toLowerCase()
  name = robot.name.toLowerCase()
  input.indexOf(name) != -1

module.exports = (robot) ->
  robot.hear /\b(thanks|thank you|cheers|(good|nice) (job|one)|well done)\b/i, (msg) ->
    msg.send msg.random responses if youTalkinToMe(msg, robot)

  robot.hear /\b(ty|thx)\b/i, (msg) ->
    msg.send msg.random shortResponses if youTalkinToMe(msg, robot)

  robot.hear /\b(hello|hi|hey|sup|howdy|how(')?s it goin(g)?|good (morning|evening|afternoon))\b/i, (msg) ->
    msg.send msg.random welcomeResponses if youTalkinToMe(msg, robot)
    
  robot.hear /\b(bye|night|goodbye|good night)\b/i, (msg) ->
    msg.send msg.random farewellResponses if youTalkinToMe(msg, robot)

  robot.hear /\b(c(\')?mon|come on|not even (you)?|let(\')?s go)\b/i, (msg) ->
    msg.send msg.random defensiveResponses if youTalkinToMe(msg, robot)

  robot.hear /\b(just me and)\b/i, (msg) ->
    msg.send msg.random solidarityResponses if youTalkinToMe(msg, robot)
