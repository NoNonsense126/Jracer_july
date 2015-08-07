class Game < ActiveRecord::Base
  belongs_to :player_one, class_name: "Player", foreign_key: :player1_id
  belongs_to :player_two, class_name: "Player", foreign_key: :player2_id
  belongs_to :winner, class_name: "Player", foreign_key: :winner_id

  # def player_one
  #   Player.find(self.player1_id)
  # end
end
