class Headphones::Scraper

  attr_accessor :name, :price, :availability, :url

    def self.list(url)
      doc = Nokogiri::HTML(open(url)).css("#rbContent div.bestListing ul li div.itemWrap")

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

    def self.more_info(url)
      doc = Nokogiri::HTML(open(url)).css(".quickInfo")
      the_good = doc.css(".theGood").text
      the_bad = doc.css(".theBad").text
      bottom_line = doc.css(".theBottomLine").text
      more_info = {good: the_good, bad: the_bad, bottom: bottom_line}
      more_info
      # binding.pry

    end

  end
