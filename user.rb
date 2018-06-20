require_relative 'server.rb'
require 'json'
class User
        def print_details(*args)
            server = Array.new()
            
          case args.size
          when 0
            server.print_map(20,20)
            when 1
               params =  File.read(args[0])
               data_hash = JSON.parse(params)
                ukuran =  data_hash['ukuran']
                kordinat_X_user = data_hash['kordinat_user'][0]
                kordinat_Y_user = data_hash['kordinat_user'][1]
                jumlahdriver = data_hash['jumlah']
                driver1_x =  data_hash['drivers'][0]['koordinat'][0]
                driver1_y = data_hash['drivers'][0]['koordinat'][1]
                driver2_x = data_hash['drivers'][1]['koordinat'][0]
                driver2_y = data_hash['drivers'][1]['koordinat'][1]
                driver3_x = data_hash['drivers'][2]['koordinat'][0]
                driver3_y = data_hash['drivers'][2]['koordinat'][1]
                driver4_x = data_hash['drivers'][3]['koordinat'][0]
                driver4_y = data_hash['drivers'][3]['koordinat'][1]
                driver5_x = data_hash['drivers'][4]['koordinat'][0]
                driver5_y = data_hash['drivers'][4]['koordinat'][1]
                server.print_map_file(ukuran,kordinat_X_user,kordinat_Y_user,jumlahdriver,driver1_x,driver1_y,
                driver2_x,driver2_y,driver3_x,driver3_y,driver4_x,driver4_y,driver5_x,driver5_y)


          when 3
            server.print_map(args[0],args[1],args[2])
          end
        end
 end
user = User.new()
#puts user.print_details()
#puts user.print_details(10,9,8)
puts user.print_details("/Users/650655/Go_CLI/file.json")
