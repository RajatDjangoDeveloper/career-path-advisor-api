# frozen_string_literal: true

require 'google_search_results'

class CareerNotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @last_intrest = current_user.assesments.last&.intrest

    search = GoogleSearch.new(q: "suggest me some online cources for #{@last_intrest}", engine: 'google_Shopping',
                              gl: 'in', serp_api_key: '81aea3e5d36bbe050c9e79a1a4a433718191c63f9a7fa2d817a69f1067e3f8c9')
    @last_intrest = search.get_hash
    @cources_hash = { top_results: @last_intrest[:shopping_results].first(5) }

    render json: @cources_hash
  end
end
