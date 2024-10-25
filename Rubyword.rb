# RubyWord - Text editor functionality

class RubyWord
  def initialize(filename)
    @filename = filename
    @content = File.read(@filename) if File.exist?(@filename)
    @lines = @content.split("\n") if @content
    edit_file
  end

  def edit_file
    puts "Editing #{@filename}. Type ':wq' to save and exit."
    @lines.each_with_index { |line, index| puts "#{index + 1}: #{line}" }
    loop do
      print ">> "
      input = gets.chomp
      break if input == ':wq'
      @lines << input unless input.empty?
    end
    save_file
  end

  def save_file
    File.write(@filename, @lines.join("\n"))
    puts "File saved: #{@filename}"
  end
end
