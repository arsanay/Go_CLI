class Array
    $driver1 = 0
    $driver2 = 0
    $driver3 = 0
    $driver4 = 0
    $driver5 = 0
    $penumpang = 0
    $jarak_driver1 = []
  def print_map(panjang,lebar)
      new_array = Array.new(panjang) {Array.new(lebar,"[ ]")}
  
      for i in 1..5 do
          row_random = rand(lebar)
          col_random = rand(panjang)
          new_array[row_random][col_random] = "[D]"
      end
   
      for i in 1..1 do
          row_random = rand(lebar)
          col_random = rand(panjang)
          new_array[row_random][col_random] = "[X]"
      end
    
     peta_lokasi = new_array
     for i in 0..peta_lokasi.length - 1 do
      puts peta_lokasi[i].join(" ")
     end

    peta_lokasi.lokasi_driver '[D]'
    peta_lokasi.lokasi_penumpang '[X]'
  
  end
  
  def lokasi_driver test
      lokasi_driver = []
      each_index do |i|
        row, j0 = self[i], 0
        while row.include? test
          if j = (row.index test)
            lokasi_driver << [i, j0 + j]
            j  += 1
            j0 += j
            row = row.drop j
          end
        end
      end
  
      #p r
      $driver1 = lokasi_driver[0]
      $driver2 = lokasi_driver[1]
      $driver3 = lokasi_driver[2]
      $driver4 = lokasi_driver[3]
      $driver5 = lokasi_driver[4]
     print "Driver 1 : " ,$driver1,"\n","Driver 2 : ",$driver2,"\n","Driver 3 : ",$driver3,"\n","Driver 4 : " ,$driver4,"\n","Driver 5 : ",$driver5,"\n"
    end
  
    def lokasi_penumpang test
      lokasi_penumpang = []
      each_index do |i|
        row, j0 = self[i], 0
        while row.include? test
          if j = (row.index test)
            lokasi_penumpang << [i, j0 + j]
            j  += 1
            j0 += j
            row = row.drop j
          end
        end
      end
  
      lokasi_penumpang
      $penumpang = lokasi_penumpang[0]
     
     print "Penumpang : " ,$penumpang,"\n"
     driver_terdekat($penumpang,$driver1,$driver2,$driver3,$driver4,$driver5)
    end
  
    def driver_terdekat(penumpang,driver1,driver2,driver3,driver4,driver5)
      jarak_driver1 = [driver1[0]-penumpang[0], driver1[1]-penumpang[1]]
      jarak_driver2 = [driver2[0]-penumpang[0], driver2[1]-penumpang[1]]
      jarak_driver3 = [driver3[0]-penumpang[0], driver3[1]-penumpang[1]]
      jarak_driver4 = [driver4[0]-penumpang[0], driver4[1]-penumpang[1]]
      jarak_driver5 = [driver5[0]-penumpang[0], driver5[1]-penumpang[1]]
=begin
      print "[",jarak_driver1[0].abs,",",jarak_driver1[1].abs,"]\n"
      print "[",jarak_driver2[0].abs,",",jarak_driver2[1].abs,"]\n"
      print "[",jarak_driver3[0].abs,",",jarak_driver3[1].abs,"]\n"
      print "[",jarak_driver4[0].abs,",",jarak_driver4[1].abs,"]\n"
      print "[",jarak_driver5[0].abs,",",jarak_driver5[1].abs,"]\n"
      
      print "[",jarak_driver1[0].abs+jarak_driver1[1].abs,"]\n"
      print "[",jarak_driver2[0].abs+jarak_driver2[1].abs,"]\n"
      print "[",jarak_driver3[0].abs+jarak_driver3[1].abs,"]\n"
      print "[",jarak_driver4[0].abs+jarak_driver4[1].abs,"]\n"
      print "[",jarak_driver5[0].abs+jarak_driver5[1].abs,"]\n"
=end
       int_driver1 = jarak_driver1[0].abs+jarak_driver1[1].abs
       int_driver2 = jarak_driver2[0].abs+jarak_driver2[1].abs
       int_driver3 = jarak_driver3[0].abs+jarak_driver3[1].abs
       int_driver4 = jarak_driver4[0].abs+jarak_driver4[1].abs
       int_driver5 = jarak_driver5[0].abs+jarak_driver5[1].abs
  
      array_int_driver = [int_driver1,int_driver2,int_driver3,int_driver4,int_driver5]
      indexarray = array_int_driver.each_with_index.min[1]
  
  
      if indexarray+1 ==1
        p "Anda akan dijemput oleh Driver 1",
            "Lokasi Driver 1 berada pada",$driver1 
      elsif indexarray+1 ==2
        p "Anda akan dijemput oleh Driver 2",
            "Lokasi Driver 2 berada pada",$driver2 
      elsif indexarray+1 ==3
        p "Anda akan dijemput oleh Driver 3",
            "Lokasi Driver 3 berada pada",$driver3
       elsif indexarray+1 ==4
         p "Anda akan dijemput oleh Driver 4",
            "Lokasi Driver 4 berada pada",$driver4 
        elsif indexarray+1 ==5
         p "Anda akan dijemput oleh Driver 5",
            "Lokasi Driver 5 berada pada",$driver5 
        end
  
      tujuan($penumpang,9,9)
    end
  
  
    def tujuan(a,b,c)
      asal = a
      tujuan =[b,c]
      p "Lokasi Anda Berada Pada Titik",a
      p "Menuju Lokasi Pada Titik",tujuan
  
      tarif(tujuan,asal)
    end
  
    def tarif(a,b)
      jarak = (a[0]-b[0]+a[1]-b[1])
      print "Tarif perjalanan tiap block sebesar Rp.500\n"
      print "Perjalanan anda menempuh ",jarak.abs," block\n"
      print "Total tagihan Go-Ride anda Sebesar ",jarak.abs*500," rupiah\n"
  
    end
  end
  
  testcase = Array.new
  testcase.print_map(10,10)
  
  
  