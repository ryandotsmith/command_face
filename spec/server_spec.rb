require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "creating a new server" do
  it "should have a wall"do
    @server = Server.new
    @server.wall.should_not be_nil
  end
end

describe "interacting with the wall" do
  before(:each) do
    @server = Server.new
    @server.wall.messages.size.should eql( 0 )
  end
  
  it "should let us write on the wall" do
    @server.wall.write "horny toad frogs are neat!"
    @server.wall.messages.count.should eql( 1 ) 
  end

  it "should let us read the the wall" do
    @server.wall.write "horny toad frogs are neat!"
    @server.wall.read(:first).should eql( "horny toad frogs are neat!" )
  end
  it "should get the latest message" do
    @server.wall.write "horny toad frogs are neat!"
    @server.wall.write "this is the last message!"
    @server.wall.read(:last).should eql( "this is the last message!" )
  end
  it "should get all messages" do
    results = ["horny toad frogs are neat!", "this is the last message!"]
    @server.wall.write "horny toad frogs are neat!"
    @server.wall.write "this is the last message!"
    @server.wall.read(:all).should eql(results)
  end

end
describe "delegating methods to the wall" do
  
  before(:each) do
    @server = Server.new
    @server.wall.messages.size.should eql( 0 )
  end
  it "should delegate wall methods to the wall object"do
    @server.wall.should_receive(:read).with(:first).once
    @server.read_wall(:first)
  end
  it "should delegate pass write metthods to the wall" do
    @server.wall.should_receive(:write).with("wanker").once
    @server.write_wall("wanker")
  end
end
