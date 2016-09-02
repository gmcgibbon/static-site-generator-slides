fs = require 'fs'

module.exports = class Slideshow
  @view: ->
    slides: do -> "slides/#{f}" for f in fs.readdirSync('./src/slides')
