# require_relative './app/services/job_search_api.rb'
require 'google_search_results'
class JobSearchController < ApplicationController

  
  def index
    @user = User.find(params["user_id"])
    @last_skill = @user.assesments.last&.skills
    # debugger
    
    search = GoogleSearch.new(q: "#{@last_skill}", serp_api_key: "81aea3e5d36bbe050c9e79a1a4a433718191c63f9a7fa2d817a69f1067e3f8c9")
    @hash_results = search.get_hash

    render json: @hash_results
    
  end
end


# require 'google_search_results'

# class JobSearchController < ApplicationController
#   def search
#     params = {
#       api_key: "81aea3e5d36bbe050c9e79a1a4a433718191c63f9a7fa2d817a69f1067e3f8c9",
#       engine: "google_jobs",
#       q: "programmer",
#       google_domain: "google.com",
#       gl: "in"
#     }

#     search = GoogleSearch.new(params)
#     hash_results = search.get_hash

#     # Process the search results or store them in an instance variable for use in the view
#     @search_results = hash_results['organic_results']

#     # You can also handle errors or exceptions here if the API request fails
#     # For example: rescue GoogleSearchResults::RequestError => e
#   end
# end
