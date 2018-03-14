require 'pry'
class Headphones::CLI

    def call
      greeting
      find_headphone
      goodby
    end

    def greeting
      puts "Welcome to headphone guide"
      puts "please choose headphone type. To quit type exit"
      puts "1. In-ear"
      puts "2. Over-ear"
      puts "3. On-ear"
    end


    def find_headphone
      in_ear_array = Headphones::Scraper.list("https://www.cnet.com/topics/headphones/best-headphones/earbuds/")
      over_ear_array = Headphones::Scraper.list("https://www.cnet.com/topics/headphones/best-headphones/over-the-ear/")
      on_ear_array = Headphones::Scraper.list("https://www.cnet.com/topics/headphones/best-headphones/on-ear/")

      input = nil

      while input != "exit" || !input.to_i.between?(1,3)
        input = gets.strip
        case input
          when "1"
            generate_list(in_ear_array)
          when "2"
            puts "more details on over-ear headphone "
          when "3"
            puts "more details on on-ear headphone "
          when "exit"
            goodby
          else
            puts "Please choose valid number"
            puts "1. In-ear"
            puts "2. Over-ear"
            puts "3. On-ear"
        end
      end
    end


    def generate_list(array)
      # binding.pry
      puts "Here are the top In-ear headphones:"
      array.each.with_index {|h, i| puts "#{i + 1}. #{array[i][:name]} #{array[i][:price]} \n #{array[i][:description]}"}
      puts "Type headphone number for more info or type exit"
      input = nil

      while input != "exit" || !input.to_i.between?(1,array.length)
      input = gets.strip
        if input.to_i.between?(1, array.length)
          Headphones::Scraper.more_info(array[input.to_i - 1][:url])
          again
        elsif input.downcase == "exit"
          exit
        else
          puts "Please choose valid number"
          array.each.with_index {|h, i| puts "#{i + 1}. #{array[i][:name]} #{array[i][:price]} \n #{array[i][:description]}"}
        end
      end
    end

    def again
      puts "Do you want to search again? y/n"

      input = nil
      while input != "n"
      input = gets.strip
        if input == "y"
          call
        else
          puts "Do you want to search again? y/n"
        end
      end
      goodby
    end



    def goodby
      puts "Goodby and good luck finding the perfect hedphones!"
      exit
    end

end
