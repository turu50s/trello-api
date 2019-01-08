require 'trello'
require 'pry'

def puts_todos
  configure
  cards = get_cards

  # binding.pry
  # binding.pry
  
  puts '-----------------'
  puts '[Todo]'
  cards.each do |card|
    puts card.name
  end
  puts '-----------------'
end

def configure
  Trello.configure do |config|
    config.developer_public_key = '85f9e306aa6c289348db8f9de8f6e887' # The "key" from step 1
    config.member_token = '7f4252dccf13b3129bf460539705151944a456a695b0e6de5908fc086ae886d8' # The token from step 2.
  end
end

def get_cards
  member = Trello::Member.find('b853336604854d5ca04f6e990acab7b7')
  boards = member.boards
  board = boards.find { |board| board.name == 'Todo' }
  list = board.lists[0]
  cards = list.cards
  cards
end

puts_todos