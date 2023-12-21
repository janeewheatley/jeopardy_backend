class CluesController < ApplicationController
    def show
        #this method of putting the API request into the backend is more secure than calling directly to the API from the frontend.  It blocks seeing the api (or api keys) in the network panel instead of allowing anyone to see it it.

        uri = URI('http://cluebase.lukelav.in/clues/random')
        #this is where the request is made to the api, the response is assigned to the res variable
        res = Net::HTTP.get_response(uri)
        #checking if the response was a success.  if it is successful, you are getting the response body to send to the frontend
        if res.is_a?(Net::HTTPSuccess)
            #we need to parse the response body from a string body into a json response for the format we need in the FE
            render json: JSON.parse(res.body)
        else
            render error: 404
        end
    end
end