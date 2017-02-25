class WordReader

  def read_from_file(file_name)

    begin
    # if File.exist?(file_name)
      f = File.new(file_name, 'r')
      lines = f.readlines
      f.close
      return lines.sample.chomp

    # else
    #   return nil
    # end

    rescue SystemCallError => e
      puts "Cant find Word file!"
      puts e.message
      end

  end

end