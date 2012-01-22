require 'rubygems'
require 'json'
require 'net/http'

def item_search(query)
   base_url = "http://open.api.ebay.com/shopping?callname=FindPopularItems&responseencoding=JSON&appid=RogerPcf8-b67b-4ef0-9268-4d164ded513&siteid=0&MaxEntries=99&QueryKeywords=#{URI.encode(query)}&version=745"
   resp = Net::HTTP.get_response(URI.parse(base_url))
   data = resp.body

   # we convert the returned JSON data to native Ruby
   # data structure - a hash
   result = JSON.parse(data)

   # if the hash has 'Error' as a key, we raise an error
   if result.has_key? 'Error'
      raise "web service error"
   end   
   
   result['ItemArray']['Item'].each do |result|
		if result['ListingType'].include? 'Fixed'
			itemId = result['ItemID']
	   
			# puts itemId
	   
			item_url = "http://open.api.ebay.com/shopping?callname=GetSingleItem&responseencoding=JSON&appid=RogerPcf8-b67b-4ef0-9268-4d164ded513&siteid=0&ItemID=#{URI.encode(itemId)}&IncludeSelector=Description,ItemSpecifics&version=745"
			
			# puts item_url
			
			item_full = JSON.parse((Net::HTTP.get_response(URI.parse(item_url))).body)["Item"]
			
			puts item_full['Title']
			
			if (Float(item_full['ConvertedCurrentPrice']['Value']).round > 25)
			
				Item.create!(:title => item_full['Title'], :price => Float(item_full['ConvertedCurrentPrice']['Value']).round, :description => item_full['PrimaryCategoryName'], :picture => item_full['PictureURL'][0])
			end
		end
   end
end


namespace :filldb do
	task :fill => :environment do	
		item_search 'the'
		item_search 'a'
		item_search 'new'
		item_search 'usa'
	end
end

# rake filldb:fill