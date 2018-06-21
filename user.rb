require_relative 'server.rb'
require 'json'
class User
        def print_menu
          puts ""
          puts "Welcome to GO_CLI",
          "------Menu-------",
          "",
          "1. Show Map",
          "2. Order Go-Ride",
          "3. Show history",
          "4. Exit",
          "Insert your choice (1-4) : "
        end

        def confirms
          puts "Confirmation to order Go-Ride"
          puts "Insert Y if you agree or insert N if you dont"
        end

        def print_details(*args)
            server = Array.new()
          case args.size      
          when 0
            loop do
              print_menu()
              choice = gets
              if choice.to_i == 1
               server.print_map_tanpa_parameter(20,20)
               elsif choice.to_i == 2
                server.nearest_driver($passenger,$driver1,$driver2,$driver3,$driver4,$driver5)
               elsif choice.to_i ==3
                server.read_history()
               elsif choice.to_i ==4
                break
              end
            end
          when 1
                params =  File.read(args[0])
                data_hash = JSON.parse(params)
                size =  data_hash['size']
                coordinat_X_user = data_hash['coordinat_user'][0]
                coordinat_Y_user = data_hash['coordinat_user'][1]
                totaldriver = data_hash['total']
                driver1_x =  data_hash['drivers'][0]['coordinat'][0]
                driver1_y = data_hash['drivers'][0]['coordinat'][1]
                driver2_x = data_hash['drivers'][1]['coordinat'][0]
                driver2_y = data_hash['drivers'][1]['coordinat'][1]
                driver3_x = data_hash['drivers'][2]['coordinat'][0]
                driver3_y = data_hash['drivers'][2]['coordinat'][1]
                driver4_x = data_hash['drivers'][3]['coordinat'][0]
                driver4_y = data_hash['drivers'][3]['coordinat'][1]
                driver5_x = data_hash['drivers'][4]['coordinat'][0]
                driver5_y = data_hash['drivers'][4]['coordinat'][1]

                loop do
                  print_menu()
                  choice = gets
                  if choice.to_i == 1
                      server.print_map_file(size,coordinat_X_user,coordinat_Y_user,totaldriver,driver1_x,driver1_y,
                       driver2_x,driver2_y,driver3_x,driver3_y,driver4_x,driver4_y,driver5_x,driver5_y)
                  elsif choice.to_i == 2
                      server.nearest_driver($passenger,$driver1,$driver2,$driver3,$driver4,$driver5)
                  elsif choice.to_i ==3
                       server.read_history()
                   elsif choice.to_i ==4
                      break
                    end
                  end

          when 3
            loop do
              print_menu()
              choice = gets
              if choice.to_i == 1
                server.print_map(args[0],args[1],args[2])
              elsif choice.to_i == 2
                server.nearest_driver($passenger,$driver1,$driver2,$driver3,$driver4,$driver5)
              elsif choice.to_i ==3
                server.read_history()
              elsif choice.to_i ==4
                break
                end
              end
            end
        end
 end
user = User.new()
#puts user.print_details()
puts user.print_details(10,9,8)
#puts user.print_details("file.json")
