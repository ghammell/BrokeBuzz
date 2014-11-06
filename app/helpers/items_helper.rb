module ItemsHelper
  class BreweryDB
    include HTTParty
    base_uri 'http://api.brewerydb.com/v2'

    def initialize
      @beer_key = '283db9c15918747640eb81252e2aa424'
    end

    def beers_search(search_term)
      beer_results = self.class.get('/search?q=' + search_term.gsub(" ", "%20") + '&type=beer&key=' + @beer_key)
      parsed_results = JSON.parse(beer_results.body)['data']
    end
  end
end