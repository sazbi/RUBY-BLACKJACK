# Create Card Details, including values
card_details = [{ace_of_spades: {numerical_value: 1, value: 11}},
                {king_of_spades: {numerical_value: 2, value: 10}},
                {queen_of_spades: {numerical_value: 3, value: 10}},
                {jack_of_spades: {numerical_value: 4, value: 10}},
                {ten_of_spades: {numerical_value: 5, value: 10}},
                {nine_of_spades: {numerical_value: 6, value: 9}},
                {eight_of_spades: {numerical_value: 7, value: 8}},
                {seven_of_spades: {numerical_value: 8, value: 7}},
                {six_of_spades: {numerical_value: 9, value: 6}},
                {five_of_spades: {numerical_value: 10, value: 5}},
                {four_of_spades: {numerical_value: 11, value: 4}},
                {three_of_spades: {numerical_value: 12, value: 3}},
                {two_of_spades: {numerical_value: 13, value: 2}},
                {ace_of_clubs: {numerical_value: 14, value: 11}},
                {king_of_clubs: {numerical_value: 15, value: 10}},
                {queen_of_clubs: {numerical_value: 16, value: 10}},
                {jack_of_clubs: {numerical_value: 17, value: 10}},
                {ten_of_clubs: {numerical_value: 18, value: 10}},
                {nine_of_clubs: {numerical_value: 19, value: 9}},
                {eight_of_clubs: {numerical_value: 20, value: 8}},
                {seven_of_clubs: {numerical_value: 21, value: 7}},
                {six_of_clubs: {numerical_value: 22, value: 6}},
                {five_of_clubs: {numerical_value: 23, value: 5}},
                {four_of_clubs: {numerical_value: 24, value: 4}},
                {three_of_clubs: {numerical_value: 25, value: 3}},
                {two_of_clubs: {numerical_value: 26, value: 2}},
                {ace_of_diamonds: {numerical_value: 27, value: 11}},
                {king_of_diamonds: {numerical_value: 28, value: 10}},
                {queen_of_diamonds: {numerical_value: 29, value: 10}},
                {jack_of_diamonds: {numerical_value: 30, value: 10}},
                {ten_of_diamonds: {numerical_value: 31, value: 10}},
                {nine_of_diamonds: {numerical_value: 32, value: 9}},
                {eight_of_diamonds: {numerical_value: 33, value: 8}},
                {seven_of_diamonds: {numerical_value: 34, value: 7}},
                {six_of_diamonds: {numerical_value: 35, value: 6}},
                {five_of_diamonds: {numerical_value: 36, value: 5}},
                {four_of_diamonds: {numerical_value: 37, value: 4}},
                {three_of_diamonds: {numerical_value: 38, value: 3}},
                {two_of_diamonds: {numerical_value: 39, value: 2}},
                {ace_of_hearts: {numerical_value: 40, value: 11}},
                {king_of_hearts: {numerical_value: 41, value: 10}},
                {queen_of_hearts: {numerical_value: 42, value: 10}},
                {jack_of_hearts: {numerical_value: 43, value: 10}},
                {ten_of_hearts: {numerical_value: 44, value: 10}},
                {nine_of_hearts: {numerical_value: 45, value: 9}},
                {eight_of_hearts: {numerical_value: 46, value: 8}},
                {seven_of_hearts: {numerical_value: 47, value: 7}},
                {six_of_hearts: {numerical_value: 48, value: 6}},
                {five_of_hearts: {numerical_value: 49, value: 5}},
                {four_of_hearts: {numerical_value: 50, value: 4}},
                {three_of_hearts: {numerical_value: 51, value: 3}},
                {two_of_hearts: {numerical_value: 52, value: 2}},
                
]
# Returns the Value of the card
def get_card_value(card_details, card)
  card_details.each do |name|
    name.each do |key, value|
      new_value = value[:numerical_value]
      return value[:value] if new_value == card
    end
  end
end

#Returns the details of the Card
def get_card_detail(card_details, numerical_value)
  card_details.each do |name|
    name.each do |key, value|
      new_value = value[:numerical_value]
      return key if new_value == numerical_value
    end
  end
end

#Calculates the Hand Value
def hand_value(card_details, card1, card2)
  hand_value1 = get_card_value(card_details, card1)
  hand_value2 = get_card_value(card_details, card2)
  return hand_value1 + hand_value2
end


deck = (1..52).to_a.shuffle!

puts " "

player_card_1 = deck.pop
computer_card_1 = deck.pop
player_card_2 = deck.pop
computer_card_2 = deck.pop

player_hand_value = hand_value(card_details, player_card_1, player_card_2)
dealer_hand_value = hand_value(card_details, computer_card_1, computer_card_2)

puts "Player is holding #{get_card_detail(card_details, player_card_1)} and #{get_card_detail(card_details, player_card_2)} for a total of #{player_hand_value}"
puts "Dealer is holding #{get_card_detail(card_details, computer_card_1)} and #{get_card_detail(card_details, computer_card_2)} for a total of #{dealer_hand_value}"

#Decide who wins
if dealer_hand_value <= 21 and player_hand_value <= dealer_hand_value #If the dealer beats the player or it is a tie, and if the house doesn't bust
  if dealer_hand_value == 21 #If the Dealer gets blackjack
    puts "BLACKJACK!!!! DEALER WINS!"
  else #If dealer doesnt get blackjack but has higher value
    puts "Dealer Wins"
  end
else #Player wins
  if player_hand_value == 21 #If blackjack
    puts "BLACKJACK PLAYER WINS!"
  else #if not blackjack
    puts "Player Wins"
  end

end
  
  
  
