require 'busted.runner'()

describe('analysis.lua class', function()
  describe('should analyze poker hands', function()

    local analysis = require "holdem.analysis"
    local Card = require "holdem.card"

    local hand
    local board

    it('should do an analysis for a specific hand', function()

      hand = { Card.new(2, 1), Card.new(2, 2) }
      board = {}
      analysis.evaluate(hand, board)

      board = { Card.new(10, 2), Card.new(14, 2), Card.new(13, 2)  }
      analysis.evaluate(hand, board)

      board = { Card.new(10, 2), Card.new(14, 2), Card.new(13, 2), Card.new(7, 2) }
      analysis.evaluate(hand, board)

      board = { Card.new(3,3), Card.new(3,1), Card.new(8,4), Card.new(5,4), Card.new(4,4) }
      analysis.evaluate(hand, board)

      board = { Card.new(3,3), Card.new(3,1), Card.new(10,4), Card.new(5,4), Card.new(4,4) }
      analysis.evaluate(hand, board)

      board = { Card.new(2,3), Card.new(2,4), Card.new(10,4), Card.new(5,4), Card.new(4,4) }
      analysis.evaluate(hand, board)

    end)

    it('should return error when hands are invalid', function()

      local status
      local _

      -- nil hand
      hand = nil
      board = { Card.new(10, 2), Card.new(14, 2), Card.new(13, 2) }

      status, _ = pcall(function() analysis.evaluate(hand, board) end)
      assert(not status, "It should throw an error message")

      -- one card hand
      hand = { Card.new(10, 3) }
      board = { Card.new(10, 2), Card.new(14, 2), Card.new(13, 2) }

      status, _ = pcall(function() analysis.evaluate(hand, board) end)
      assert(not status, "It should throw an error message")

      -- three card hand
      hand = { Card.new(10, 3), Card.new(11, 3), Card.new(12, 3) }
      board = { Card.new(10, 2), Card.new(14, 2), Card.new(13, 2) }

      status, _ = pcall(function() analysis.evaluate(hand, board) end)
      assert(not status, "It should throw an error message")

      -- hand with same card
      hand = { Card.new(10, 3), Card.new(10, 3) }
      board = { Card.new(10, 2), Card.new(14, 2), Card.new(13, 2) }

      status, _ = pcall(function() analysis.evaluate(hand, board) end)
      assert(not status, "It should throw an error message")

      -- evaluate with one card on board
      hand = { Card.new(10, 3), Card.new(10, 3) }
      board = { Card.new(10, 2) }

      status, _ = pcall(function() analysis.evaluate(hand, board) end)
      assert(not status, "It should throw an error message")

      -- evaluate with two card on board
      hand = { Card.new(10, 3), Card.new(10, 3) }
      board = { Card.new(10, 2), Card.new(14, 2) }

      status, _ = pcall(function() analysis.evaluate(hand, board) end)
      assert(not status, "It should throw an error message")

      -- evaluate with six card on board
      hand = { Card.new(10, 3), Card.new(10, 3) }
      board = { Card.new(10, 2), Card.new(14, 2), Card.new(5, 1), Card.new(2, 1), Card.new(3, 1), Card.new(4, 1) }

      status, _ = pcall(function() analysis.evaluate(hand, board) end)
      assert(not status, "It should throw an error message")

      -- evaluate with repeated cards on board
      hand = { Card.new(10, 3), Card.new(10, 3) }
      board = { Card.new(10, 2), Card.new(10, 2), Card.new(5, 1) }

      status, _ = pcall(function() analysis.evaluate(hand, board) end)
      assert(not status, "It should throw an error message")

    end)
  end)
end)