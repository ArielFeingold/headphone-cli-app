class Headphones::Scraper

    def self.list(url)
      doc = Nokogiri::HTML(open(url)).css("#rbContent div.bestListing ul li div.itemWrap")

      headphones_array =[]

      doc.each do |headphone|
        h_name = headphone.css("h5").text
        h_price = headphone.css(".price").text
        h_url = "https://www.cnet.com#{doc.css(".review").attribute("href").value}"
        h_rating = headphone.css(".subRatings")[0].attribute("aria-label").value
        h_description = headphone.css(".dek").text

        headphones_array << {name: h_name, price: h_price, url: h_url, rating: h_rating, description: h_description}
      end
      headphones_array
    end

    def self.more_info(url)
      doc = Nokogiri::HTML(open(url)).css(".quickInfo")
      the_good = doc.css(".theGood").text
      the_bad = doc.css(".theBad").text
      bottom_line = doc.css(".theBottomLine").text
      more_info = {good: the_good, bad: the_bad, bottom: bottom_line}
      puts "#{more_info[:good]}"
      puts ""
      puts "#{more_info[:bad]}"
      puts ""
      puts "#{more_info[:bottom]}"

    end

  end
