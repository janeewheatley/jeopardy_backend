class GamesController < ApplicationController
    def create
        game = Game.find_by(:user_id => current_user.id)
        game = Game.create(:user_id => current_user.id) unless game
        # if (game.total_questions != nil )
        #     return game.total_questions
        # else 
        #     return 0
        game.total_questions = ( game.total_questions || 0 ) + 1

        game.save

        # game.questions.create(:clue => params[:clue], :user_answer => params[:user_answer], :correct => params[:correct])
        question = Question.create(:game_id => game.id, :clue => params[:clue], :user_answer => params[:user_answer], :correct => params[:correct])
        
        response = {
            game: game,
            questions: game.questions
        }

        render json: response, status: :created
    end
end