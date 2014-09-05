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

  def self.get_all
   FlashcardModel.get_all_flashcards
  end

  def self.run
    View.initial_menu
    menu_logic(View.get_user_input)
  end

   def self.recieve_cards(flashcards)
      @flashcards = flashcards
   end

  def self.menu_logic(user_input)

    if user_input == "1"
      flip_through_flashcards(get_all)
    elsif user_input == "2"
      View.instructions_menu
      menu_logic(View.get_user_input)
    else
      View.invalid_input
      run
    end
  end


  def self.flip_through_flashcards(flashcard_deck)
    flashcard_deck.each do |question, answer|
      puts question
      View.game_prompt
      input = gets.chomp
      if input == "exit" then
        View.exit_prompt
        return
      end
      puts input == answer ? View.correct : View.incorrect(answer)
    end
  View.end_game_prompt
  end

end

class View


 def self.instructions_menu
    puts "The mighty ducks shall give you a definition,
    you must quack back what you think the answer is.  If your quack rings true
    we will quacknowledge your intelligence, if not, we shall bite you with our ducky
    lips. If you feel you are prepared, press 1 my duckawan."
  end

  def self.initial_menu
    puts "Welcome! Quack!"
    puts "Ducks fly together!"
    puts "Press 1 to start the game!"
    puts "Don't know what a knuckle puck is? Press 2 for directions!"
  end

  def self.invalid_input
    puts "I didnt recognize your human language, quack! Please input again!"
  end  

  def self.get_user_input
    gets.chomp
  end 

  def self.exit_prompt
    puts "The Mighty Ducks frown upon you!"
  end 

  def self.correct
    puts "Correct!" 
  end

  def self.incorrect(answer)
    puts "Wrong! The answer is #{answer}!"
  end

  def self.end_game_prompt
    puts "You finished.. Quack! Quack!"
  end 

  def self.game_prompt
    print "What is: " 
  end    
  

end

FlashcardController.run