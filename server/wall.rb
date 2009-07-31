class Wall
  attr_reader :messages

  def initialize
    @messages = Array.new
  end

  def write( msg )
    @messages << msg
  end

  def read( which_one )
    case which_one
    when :first
      @messages.first
    when :last
      @messages.last
    when :all
      @messages
    end
  end
end
