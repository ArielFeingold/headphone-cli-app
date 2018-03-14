require 'pry'
class Headphones::CLI

    def call
      greeting
      start
      goodby
    end

    def greeting
      puts(<<~EOT)

      Welcome to the Headphone Buyer's Guide
      ---------------------------
      To begin choose a headphone type, to quit type exit"
      1. In-ear
      2. Over-ear
      3. On-ear
      EOT
    end


    def start
      in_ear_array = Headphones::Scraper.list("https://www.cnet.com/topics/headphones/best-headphones/earbuds/")
      over_ear_array = Headphones::Scraper.list("https://www.cnet.com/topics/headphones/best-headphones/over-the-ear/")
      on_ear_array = Headphones::Scraper.list("https://www.cnet.com/topics/headphones/best-headphones/on-ear/")

      input = nil

      while input != "exit" || !input.to_i.between?(1,3)
        input = gets.strip
        case input
          when "1"
            select_headphone(in_ear_array)
          when "2"
            select_headphone(over_ear_array)
          when "3"
            select_headphone(on_ear_array)
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


    def select_headphone(array)

      puts "Here are the top headphones in the catagory:"
      generate_list(array)
      puts "Type headphone number for more info or type exit."
      input = nil

      while input != "exit" || !input.to_i.between?(1,array.length)
      input = gets.strip
        if input.to_i.between?(1, array.length)
          more_info(input, array)
          again
        elsif input.downcase == "exit"
          exit
        else
          puts "Please choose valid number or type exit"
        end
      end
    end

    def generate_list(array)
      array.each.with_index do |h, i|
        puts "#{i + 1}. #{array[i][:name].colorize(:green)} #{array[i][:price]} \n #{array[i][:description]}"
        puts "#{array[i][:rating]}"
        puts " "
      end
    end

    def more_info(input, array)
      Headphones::Scraper.more_info(array[input.to_i - 1][:url])
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
