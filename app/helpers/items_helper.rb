module ItemsHelper
  class BreweryDB
    include HTTParty
    base_uri 'http://api.brewerydb.com/v2'

    def initialize
      @beer_key = '283db9c15918747640eb81252e2aa424'
    end

    def beers_search(search_term)
      beer_results = self.class.get('/search?q=' + search_term + '&type=beer&key=' + @beer_key)
      parsed_results = JSON.parse(beer_results.body)['data']
    end
  end

  class WineDB
    include HTTParty
    base_uri 'http://services.wine.com/api/beta2/service.svc/json'

    def initialize
      @wine_key = '6c3e78bd851428fd73256663f378041d'
    end

    def wines_search(search_term)
      wine_results = self.class.get('/catalog?search=' + search_term + '&apikey=' + @wine_key)
      parsed_results = JSON.parse(wine_results.body)['Products']['List']
      p parsed_results
    end
  end
end