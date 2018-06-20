require_relative 'server.rb'
class User
        def print_details(*args)
            server = Array.new()
            
          case args.size
          when 1
            "Hey My Name is #{args[0]}"
          when 2
            server.print_map(args[0],args[1])
          when 4
            "Hey My Name is #{args[0]}"
          end
        end
 end
user = User.new()
puts user.print_details(5,5)