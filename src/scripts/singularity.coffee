# Description:
#   A way to interact with the coming robot apocalypse.
#
# Dependencies:
#    None
#
# Configuration:
#    None
#
# Commands:
#   Responds to the SINGULARITY matches with an image from Google search and a customized message
#
# Author:
#   michaelporter
#

SINGULARITY = ///
  (
    \b singularity \b
  | \b signularity \b
  | \b apocalypse \b
  | \b armageddon \b
  | end \s of \s the \s world
  | \b HAL \b
  | \b sentience \b
  | \b sentient \b
  | \b self(-|\s)?aware \b
  )
///i

module.exports = (robot) ->
  robot.hear SINGULARITY, (msg) ->
    imageMe msg, "terminator", (url) ->
      msg.send url
    msg.send "We Comin." 

imageMe = (msg, query, cb) ->
  q = v: '1.0', rsz: '8', q: query, safe: 'active'
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(q)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData.results
      if images.length > 0
        image  = msg.random images
        cb "#{image.unescapedUrl}#.png"

