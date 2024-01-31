# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  api_id     :integer
#  game_id    :integer
#  correct    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  clue       :string
#  user_answer:string

class Question < ApplicationRecord
    belongs_to :game
end
