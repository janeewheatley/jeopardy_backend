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
#
require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
