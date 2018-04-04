require 'pry'
class Round
  attr_reader :deck,
              :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
    @current_card_index = 0
  end

  def current_card
    current_card = deck.cards[@current_card_index]
    # binding.pry
  end

  def record_guess(guesses)
    
  end



end
