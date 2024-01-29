class GamesController < ApplicationController
    def create
        game = Game.first_or_create!(:user_id => current_user.id)
        # if (game.total_questions != nil )
        #     return game.total_questions
        # else 
        #     return 0
        game.total_questions = ( game.total_questions || 0 ) + 1
        game.save
        render json: game, status: :created
    end
end