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

    puts(<<~EOT)
      The Good
      --------
      #{doc.css(".theGood").text.split("The Good")[1]}

      The Bad
      _______
      #{doc.css(".theBad").text.split("The Bad")[1]}

      The Bottom bottom_line
      ______________________
      #{doc.css(".theBottomLine").text}

    EOT
  puts "For full review : #{url}".colorize(:blue)
  puts " "
  end

end
