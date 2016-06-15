require 'pry'

class Banner
  attr_reader :message
  attr_accessor :box_width, :length

  def initialize(message)
    @message = message
    @box_width = set_width
    @length = @box_width > 0 ? @box_width : message.length
  end

  def set_width
    width = nil

    loop do
      system 'clear'
      puts "set width (optional):"
      width = gets.chomp
      break if width 
    end

    width.to_i
  end

  def to_s
      [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+#{'-'*(length + 2)}+"
  end

  def empty_line
    "|#{' '*(length + 2)}|"
  end

  def set_length
    self.length = self.box_width
  end

  def message_line
    if box_width > 0 && box_width <= length
      lines = message.scan(/.{1,#{box_width}}/)
      multi_line = []
      
      lines.each do |line|
        extra_spaces = ' ' * (length - line.length) 
        multi_line << "| #{line + extra_spaces} |"
      end

      set_length
      multi_line.join("\n")
    else
      "| #{@message} |"
    end
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
