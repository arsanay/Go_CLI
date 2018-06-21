require_relative 'history.rb'
class Array
    $driver1 = 0
    $driver2 = 0
    $driver3 = 0
    $driver4 = 0
    $driver5 = 0
    $passenger = 0
    $driver_name = ""

  def print_map_tanpa_parameter(length,width)
    puts "------------------MAP------------------"
      new_array = Array.new(length) {Array.new(width,"[ ]")}
      for i in 1..5 do
          row_random = rand(width)
          col_random = rand(length)
          new_array[row_random][col_random] = "[D]"
      end
      for i in 1..1 do
          row_random = rand(width)
          col_random = rand(length)
          new_array[row_random][col_random] = "[X]"
      end
     map_location = new_array
     for i in 0..map_location.length - 1 do
          puts map_location[i].join(" ")
     end
     map_location.driver_location '[D]'
     map_location.passenger_location'[X]'
  end

  def print_map_file(size,coordinat_X_user,coordinat_Y_user,totaldriver,driver1_x,driver1_y,
    driver2_x,driver2_y,driver3_x,driver3_y,driver4_x,driver4_y,driver5_x,driver5_y)
    puts "------------------MAP------------------"
    totaldriver_int = totaldriver.to_i
    new_array = Array.new(size.to_i) {Array.new(size.to_i,"[ ]")}
        new_array[driver1_x.to_i][driver1_y.to_i] = "[D]"
        new_array[driver1_x.to_i][driver1_y.to_i] = "[D]"
        new_array[driver2_x.to_i][driver2_y.to_i] = "[D]"
        new_array[driver2_x.to_i][driver2_y.to_i] = "[D]"
        new_array[driver3_x.to_i][driver3_y.to_i] = "[D]"
        new_array[driver3_x.to_i][driver3_y.to_i] = "[D]"
        new_array[driver4_x.to_i][driver4_y.to_i] = "[D]"
        new_array[driver4_x.to_i][driver4_y.to_i] = "[D]"
        new_array[driver5_x.to_i][driver5_y.to_i] = "[D]"
        new_array[driver5_x.to_i][driver5_y.to_i] = "[D]"
        new_array[coordinat_X_user.to_i][coordinat_Y_user.to_i] = "[X]"
    map_location = new_array
    for i in 0..map_location.length - 1 do
        puts map_location[i].join(" ")
    end
    map_location.driver_location'[D]'
    map_location.passenger_location'[X]'
  end

  def print_map(size,coordinat_X_user,coordinat_Y_user)
    puts "------------------MAP------------------"
    new_array = Array.new(size) {Array.new(size,"[ ]")}
    for i in 1..5 do
        row_random = rand(size)
        col_random = rand(size)
        new_array[row_random][col_random] = "[D]"
    end
    new_array[coordinat_X_user][coordinat_Y_user] = "[X]"
    map_location= new_array
    for i in 0..map_location.length - 1 do
        puts map_location[i].join(" ")
    end
    map_location.driver_location'[D]'
    map_location.passenger_location'[X]'
  end

  def driver_location test
    driver_location = []
      each_index do |i|
        row, j0 = self[i], 0
        while row.include? test
          if j = (row.index test)
            driver_location << [i, j0 + j]
            j  += 1
            j0 += j
            row = row.drop j
          end
        end
      end
      $driver1 = driver_location[0]
      $driver2 = driver_location[1]
      $driver3 = driver_location[2]
      $driver4 = driver_location[3]
      $driver5 = driver_location[4]
      puts ""
     print "Driver 1 Location : " ,$driver1,"\n","Driver 2 Location : ",$driver2,"\n","Driver 3 Location : ",$driver3,"\n","Driver 4 Location : " ,$driver4,"\n","Driver 5 Location : ",$driver5,"\n"
  end
  
  def passenger_location test
      passenger_location = []
      each_index do |i|
        row, j0 = self[i], 0
        while row.include? test
          if j = (row.index test)
            passenger_location << [i, j0 + j]
            j  += 1
            j0 += j
            row = row.drop j
          end
        end
      end
  
      passenger_location
      $passenger = passenger_location[0]
      puts ""
      print "Your Location : " ,$passenger,"\n"
      puts ""
  end
  
  def nearest_driver(passenger,driver1,driver2,driver3,driver4,driver5)
      puts "Insert your destination coordinate X"
      destination_x = gets
      puts "Insert your destination coordinate Y"
      destination_y = gets
      distance_driver1 = [driver1[0]-passenger[0], driver1[1]-passenger[1]]
      distance_driver2 = [driver2[0]-passenger[0], driver2[1]-passenger[1]]
      distance_driver3 = [driver3[0]-passenger[0], driver3[1]-passenger[1]]
      distance_driver4 = [driver4[0]-passenger[0], driver4[1]-passenger[1]]
      distance_driver5 = [driver5[0]-passenger[0], driver5[1]-passenger[1]]
      int_driver1 = distance_driver1[0].abs+distance_driver1[1].abs
      int_driver2 = distance_driver2[0].abs+distance_driver2[1].abs
      int_driver3 = distance_driver3[0].abs+distance_driver3[1].abs
      int_driver4 = distance_driver4[0].abs+distance_driver4[1].abs
      int_driver5 = distance_driver5[0].abs+distance_driver5[1].abs
      array_int_driver = [int_driver1,int_driver2,int_driver3,int_driver4,int_driver5]
      indexarray = array_int_driver.each_with_index.min[1]
  
      if indexarray+1 ==1
        puts "You will picked up by Driver 1",
            "Driver 1 location is on coordinate #{$driver1}"
            $driver_name = "Driver 1"
      elsif indexarray+1 ==2
        puts "You will picked up by Driver 2",
            "Driver 2 location is on coordinate #{$driver2}"
            $driver_name = "Driver 2"
      elsif indexarray+1 ==3
        puts "You will picked up by Driver 3",
            "Driver 3 location is on coordinate#{$driver3}"
            $driver_name = "Driver 3"
      elsif indexarray+1 ==4
         puts "You will picked up by Driver 4",
            "Driver 4 location is on coordinate #{$driver4}"
            $driver_name = "Driver 4"
      elsif indexarray+1 ==5
         puts "You will picked up by Driver 5",
            "Driver 5 location is on coordinate#{$driver5}"
            $driver_name = "Driver 5"
        end
  
      destination($passenger,destination_x.to_i,destination_y.to_i)
  end
 
  def destination(origin,destination_x,destination_y)
      driver_name = driver_name
      pickup_coordinate = origin
      destination =[destination_x,destination_y]
      puts "You right now on coordinate #{pickup_coordinate}"
      puts "Heading to destination on coordinate #{destination}"
      fare(destination,pickup_coordinate)
  end
  
  def fare(destination,pickup_coordinate)
    history = History.new()
    distance_a = destination[0]-pickup_coordinate[0]
    distance_b = destination[1]-pickup_coordinate[1]
      distance = distance_a.abs + distance_b.abs
      print "Trip fare each block is Rp.500\n"
      print "Your trip will through ",distance.abs," block\n"
      print "It will cost Rp.",distance.abs*500,"\n"
      puts "Confirmation to order Go-Ride"
      puts "Insert '1' if you agree or insert '2' if you dont"
      choice = gets
      if choice.to_i== 1
        time_order = Time.now
        invoice = "Trip recorded on #{time_order.ctime} heading to coordinate [#{destination[0]},#{destination[1]}] from pick up coordinate on [#{pickup_coordinate[0]},#{pickup_coordinate[1]}] with driver named #{$driver_name} costs #{distance.abs*500}"
        history.save_to_history(invoice)
        puts "Have fun with your trip"
        puts "This trip record saved on history"
        puts ""
      elsif choice.to_i== 2
        puts "Order canceled"
      end  
  end

  def read_history()
    history = History.new()
      history.read_history()
  end 
  end

  
  
  