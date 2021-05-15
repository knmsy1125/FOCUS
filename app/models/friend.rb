class Friend < ApplicationRecord
  def self.looks(word, method)
    if method == "perfect_match"
      @friends = User.where("name LIKE?", "#{word}")
    elsif method == "forward_match"
      @friends = User.where("name LIKE?","#{word}%")
    elsif method == "backward_match"
      @friends = User.where("name LIKE?","%#{word}")
    elsif method == "partial_match"
      @friends = User.where("name LIKE?","%#{word}%")
    else
      @friends = User.all
    end
  end
end
