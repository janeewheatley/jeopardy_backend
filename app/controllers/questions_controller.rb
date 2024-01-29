class QuestionsController < ApplicationController
    def create
        question = Question.first_or_create!(:game_id => Game)
        # if (game.total_questions != nil )
        #     return game.total_questions
        # else 
        #     return 0
        render json: question, status: :created
    end
end