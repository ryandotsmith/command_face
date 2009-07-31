require 'server/wall'

class Server
  attr_accessor :wall
  def initialize
    @wall = Wall.new
  end
  def read_wall( which_one )
    @wall.read( which_one )
  end
  def write_wall( msg )
    @wall.write msg
  end
end
