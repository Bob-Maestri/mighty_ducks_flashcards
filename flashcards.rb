  #   content = File.readlines("flashcards.txt")
  #   content.reject! {|item| item == "\n"}
  #   content.map! {|item| item.chomp}
  #   @card_hash = Hash[*content]

  # p  @card_hash

class Model
  attr_reader :card_hash

  def initialize
  end

  def self.parse_cards
    content = File.readlines("flashcards.txt")
    content.reject! {|item| item == "\n"}
    content.map! {|item| item.chomp}
    @card_hash = Hash[*content]
  end


end

class Controller

 def


 def show

 end
end

class View

end

cards = Deck.new
cards.parse_cards
cards.show_hash


