require 'pry'
class Headphones::CLI

    def call
      list_types
    end

    def list_types

        puts "Welcome to headphone guide"
        puts "please choose headphone type. To quit type exit"
        puts "1. In-ear"
        puts "2. Over-ear"
        puts "3. On-ear"

        input = nil

        while input != "exit" || !input.to_i.between?(1,3)
          input = gets.strip
          case input
          when "1"
              puts "more details on in-ear headphones"
            when "2"
              puts "more details on over-ear headphone "
            when "3"
              puts "more details on on-ear headphone "
            when "exit"
              puts "goodby"
              exit
            else
              puts "Please choose valid number"
              puts "1. In-ear"
              puts "2. Over-ear"
              puts "3. On-ear"
          end
        end
    end

    

end
