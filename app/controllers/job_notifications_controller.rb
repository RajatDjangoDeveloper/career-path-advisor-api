class JobNotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    # @user = current_user
    @last_skill = current_user.assesments.last&.skills
    search = GoogleSearch.new(q: @last_skill.to_s, engine: 'google_jobs', gl: 'in',
                              serp_api_key: '81aea3e5d36bbe050c9e79a1a4a433718191c63f9a7fa2d817a69f1067e3f8c9')
    @hash_results = search.get_hash
    # debugger
    @jobs_notification = { top_results: @hash_results[:jobs_results].first(5) }
    
    render json: @jobs_notification
  end
end
