 #  ___________________        ____....-----....____
 # (________________LL_)   ==============================
 #     ______\   \_______.--'.  `---..._____...---'
 #     `-------..__            ` ,/
 #     ___         `-._ -  -  - |
 #    ( /        /     `-------'
 #     / __ (   /_
 #   _/_(_)/_)_/ /_
 #  //
 # (/

Type = require "#{__dirname}/./type.coffee"
error = require "#{__dirname}/../error/error.coffee"

class ExpList

  constructor: (@expArray) ->

  toString: ->
    "#{(@bindingArray).join(', ')}"

  analyze: (context) ->
    for exp in @expArray
      @expArray[exp].analyze context

  optimize: ->
    for exp in @expArray
      @expArray[exp].optimize()


module.exports = ExpList