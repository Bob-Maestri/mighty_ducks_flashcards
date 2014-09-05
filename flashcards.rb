class FlashcardModel
  attr_reader :card_hash

  def self.get_all_flashcards #potential split into 2 methods. 1 pull from file, 2 format as if db or csv
    content = File.readlines("flashcards.txt")
    content.reject! {|item| item == "\n"}
    content.map! {|item| item.chomp}
    @card_hash = Hash[*content]
  end

end

class FlashcardController
attr_accessor :flashcards


  def self.show
   FlashcardModel.get_all_flashcards
  end

end

class View

  def self.run
    initial_menu
  end

   def self.recieve_cards(flashcards)
      @flashcards = flashcards
   end

  def self.initial_menu
    puts "Welcome to the mighty ducks flashcard experience"
    puts "If youve flown with us before press 1 to start the game"
    puts "If your new to the flock press 2 for directions"
    user_menu_selection = gets.chomp
    menu_logic(user_menu_selection) #outputs an integer to the menulogic method
  end

  def self.menu_logic(user_input)
    if user_input == "1"
      flip_through_flashcards(FlashcardController.show)
    elsif user_input == "2"
      instructions_menu
    else
      puts "I didnt recognize your human language, quack! Please input again"
      initial_menu
    end
  end

  def self.instructions_menu
    puts "The mighty ducks shall give you a definition,
    you must quack back what you think the answer is.  If your quack rings true
    we will quacknowledge your intelligence, if not, we shall bite you with our ducky
    lips.  If you feel you are prepared, press 1 my duckawan."
    user_choice = gets.chomp
    menu_logic(user_choice)
  end

  def self.flip_through_flashcards(flashcard_deck)
    flashcard_deck.each do |question, answer|
      puts question
      print "What is:"
      input = gets.chomp
      if input == "exit" then
        print "the mighty ducks frown upon you";
        return
      end
      puts input == answer ? "Correct!" : "Wrong! The answer is #{answer}"
    end
  puts "you finished, quack quack"
  end

end

View.run




