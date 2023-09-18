# frozen_string_literal: true

require 'google_search_results'

class JobSearchApi
  @skills = @last_skill
  params = {
    api_key: '81aea3e5d36bbe050c9e79a1a4a433718191c63f9a7fa2d817a69f1067e3f8c9',
    engine: 'google_jobs',
    q: 'programmer',
    google_domain: 'google.com',
    gl: 'in'
  }

  search = GoogleSearch.new(params)
  search.get_hash
end
