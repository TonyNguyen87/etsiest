require "etsiest/version"
require "sinatra/base"
require "etsy"
require "pry"
require "json"

Etsy.api_key = ENV["ETSY_KEY"]
# j1ecit4cj6k6qmxih2c3rqcp


module Etsiest
	class App < Sinatra::Application

		get "/search" do
			query = params["q"]	
			 response = Etsy::Request.get('/listings/active', 
			 	:includes => ['Images', 'Shop'], 
			 	:keywords => query)
			erb :index, locals:{results: response.result}  
		end																			#erb var, rb var

		run! if app_file == $0
	end
end




# binding.pry
		## localhost:4567/search?q=whiskey
			 	#binding.pry  #response.code, response.body, response.class, response.methods, JSON.parse(response.body), response.to_hash
#{items: data}
# {"count" => 3245,
# 	"result" => []}
#response.result

# get the response from etsy and when your passing something
# than make variable data = response.result

# <ul class= "search=results">
# <% items.each do |item| %>
# 	<li class= "etsy - item">
# 		<%= item.price? %>

# 		</li>
# 		<%end%>
# 		</ul>

# 		get the data out of response search result and than call a method on it specifically response.results