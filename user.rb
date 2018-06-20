require_relative 'server.rb'
class User
        def print_details(*args)
            server = Array.new()
            
          case args.size
          when 0
            server.print_map(20,20)
          when 1
            params =[]
            File.open(args[0], "r") do |f|
                f.each_line do |line|
                  params << line
                end
            server.print_map_file(params[0],params[1],params[2],params[3])
              end
          when 3
            server.print_map(args[0],args[1],args[2])
          end
        end
 end
user = User.new()
#puts user.print_details()
#puts user.print_details(10,9,8)
puts user.print_details("/Users/650655/Go_CLI/text.txt")
