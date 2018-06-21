require_relative 'server.rb'
require 'json'
class User
        def print_menu
          puts "Selamat Datang di Program GO_CLI",
          "Masukan Pilihan Anda",
          "1. Tampilkan Peta",
          "2. Order GO-Ride",
          "3. Exit"
        end

        def print_details(*args)
            server = Array.new()
          case args.size      
          when 0
            loop do
              print_menu()
              pilihan = gets
               if pilihan.to_i == 1
               server.print_map_tanpa_parameter(20,20)
               elsif pilihan.to_i == 2
                server.driver_terdekat($penumpang,$driver1,$driver2,$driver3,$driver4,$driver5)
               elsif pilihan.to_i ==3
                break

            end
            end
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

                loop do
                  print_menu()
                  pilihan = gets
                   if pilihan.to_i == 1
                server.print_map_file(ukuran,kordinat_X_user,kordinat_Y_user,jumlahdriver,driver1_x,driver1_y,
                driver2_x,driver2_y,driver3_x,driver3_y,driver4_x,driver4_y,driver5_x,driver5_y)
              elsif pilihan.to_i == 2
                server.driver_terdekat($penumpang,$driver1,$driver2,$driver3,$driver4,$driver5)
               elsif pilihan.to_i ==3
                break

            end
            end
          when 3
            loop do
              print_menu()
              pilihan = gets
               if pilihan.to_i == 1
            server.print_map(args[0],args[1],args[2])
          elsif pilihan.to_i == 2
            server.driver_terdekat($penumpang,$driver1,$driver2,$driver3,$driver4,$driver5)
           elsif pilihan.to_i ==3
            break

        end
        end
          end
         
        end
 end
user = User.new()
#puts user.print_details()
puts user.print_details(10,9,8)
#puts user.print_details("/Users/650655/Go_CLI/file.json")
