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
    deck.cards[@current_card_index]
  end

  def record_guess(response, deck)
    @guesses << Guess.new(response, current_card)
    @guesses.last
  end

  def feedback

  end
  #
  # def number_correct
  #
  # end
  #
  # def percent_correct
  #
  # end


end
