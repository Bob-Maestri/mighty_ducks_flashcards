
# MVC
# M - interfacing w/ txt file
# Flashcard (question, answer)
# match?(answer)
# Deck holds flashcards
# next_card, shuffle, finished?
#
# View
# Menu
# Controller
# - instigating all the processes
#   - parsing of data from file
#   - interacting w/ view
#     - get input from user
#     - print output to user

#   - control flow of flashcard game
#      - start w/ first card
#      - rules continuing the game
#        - right/wrong
#        - repeat if wrong
#        - show answer after 3 fails....
#

q_and_a = {"question1"=> "answer1", "question2"=> "answer2", "question3"=> "answer3",
           "question4"=> "answer4"}


def initial_menu

  puts "Welcome to the mighty ducks flashcard experience"
  puts "If youve flown with us before press 1 to start the game"
  puts "If your new to the flock press 2 for directions"
  user_menu_selection = gets.chomp
  menu_logic(user_menu_selection) #outputs an integer to the menulogic method

end

def menu_logic(user_input)

  if user_input == 1
    flip_through_flashcards(q_and_a)
  elsif user_input == 2
    instructions_menu
  else
    puts "I didnt recognize your human language, quack! Please input again"
    initial_menu
  end

end

def instructions_menu
  puts "The mighty ducks shall give you a definition,
  you must quack back what you think the answer is.  If your quack rings true
  we will quacknowledge your intelligence, if not, we shall bite you with our ducky
  lips.  If you feel you are prepared, press 1 my duckawan."
  user_choice = gets.chomp
  menu_logic(user_choice)

end

def flip_through_flashcards(flashcard_deck)

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


flip_through_flashcards(q_and_a)
