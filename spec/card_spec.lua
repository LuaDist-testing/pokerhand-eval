require 'busted.runner'()

describe('card.lua class', function()
  describe('should modelize poker cards', function()

    local Card = require "holdem.card"
    local aceSpades

    it('should create a card and give values', function()

      aceSpades = Card.new(14, 1)
      assert(aceSpades:tostring() == "AS")

      aceSpades = Card.new("AS")
      assert(aceSpades:tostring() == "AS")

      aceSpades = Card.new("as")
      assert(aceSpades:tostring() == "AS")

    end)

    local status
    local _

    it('should give error when create a invalid card', function()

      -- invalid suit
      status, _ = pcall(function() Card.new(1, 0) end)
      assert(not status, "It should throw an error message")

      status, _ = pcall(function() Card.new(1, 5) end)
      assert(not status, "It should throw an error message")

      -- invalid rank
      status, _ = pcall(function() Card.new(0, 1) end)
      assert(not status, "It should throw an error message")

      status, _ = pcall(function() Card.new(15, 1) end)
      assert(not status, "It should throw an error message")

      -- empty string
      status, _ = pcall(function() Card.new("") end)
      assert(not status, "It should throw an error message")

      -- empty value
      status, _ = pcall(function() Card.new() end)
      assert(not status, "It should throw an error message")

      -- nil value
      status, _ = pcall(function() Card.new(nil) end)
      assert(not status, "It should throw an error message")

      -- number value
      status, _ = pcall(function() Card.new(5) end)
      assert(not status, "It should throw an error message")

      -- invalid string val
      status, _ = pcall(function() Card.new("AZ") end)
      assert(not status, "It should throw an error message")

    end)
  end)
end)
