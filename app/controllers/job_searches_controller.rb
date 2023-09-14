require 'google_search_results'
class JobSearchesController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @user = current_user
    @last_skill = @user.assesments.last&.skills
    search = GoogleSearch.new(q: "#{@last_skill}", engine: 'google_jobs', gl: 'in',
                              serp_api_key: '81aea3e5d36bbe050c9e79a1a4a433718191c63f9a7fa2d817a69f1067e3f8c9')
    @hash_results = search.get_hash
    @jobs_hash = { google_links: @hash_results[:search_metadata], top_results: @hash_results[:jobs_results] }

    render json: @jobs_hash
  end
end
