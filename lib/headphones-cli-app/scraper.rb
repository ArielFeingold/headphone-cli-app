class Headphones::Scraper

  attr_accessor :name, :price, :availability, :url

    def self.scrape_in_ear
      doc = Nokogiri::HTML(open("https://www.cnet.com/topics/headphones/best-headphones/earbuds/")).css("#rbContent div.bestListing ul li div.itemWrap")

      in_ear_array =[]

      doc.each do |headphone|
        h_name = headphone.css("h5").text
        h_price = headphone.css(".price").text
        h_url = "https://www.cnet.com#{doc.css(".review").attribute("href").value}"
        h_rating = headphone.css(".subRatings")[0].attribute("aria-label").value
        h_description = headphone.css(".dek").text

        in_ear_array << {name: h_name, price: h_price, url: h_url, rating: h_rating, description: h_description}
      end
      in_ear_array
    end
  end
