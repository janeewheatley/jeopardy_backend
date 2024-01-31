# == Schema Information
#
# Table name: games
#
#  id              :integer          not null, primary key
#  total_questions :integer
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Game < ApplicationRecord
    has_many :questions
end
