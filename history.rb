class History
    def initialize ()
       
    end

    def save_to_history(invoice)
        File.open("history.txt", 'a+') { |file| file.puts(invoice) }
    end

    def read_history()
        File.open("history.txt", "r") do |f|
            f.each_line do |line|
              puts line
            end
          end
        end
end