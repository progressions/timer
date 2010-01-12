$:.unshift File.dirname(__FILE__) + '/../lib'
require 'rubygems'
require 'timecop'
require 'timer'

describe "Timer" do
  before do
    $stdout.stub!(:puts).as_null_object
    @g = Object.new
    Growl.stub(:new).and_return(@g)
    @g.stub(:notify).as_null_object
  end
  
  describe "growl" do
    
    it "should growl a message" do
      @g.should_receive(:notify).with(anything, anything, /hello/, anything, anything)
      Timer.new.time("hello") do
        x = 1
      end
    end
  
    it "should growl a title" do
      @g.should_receive(:notify).with(anything, /word/, anything, anything, anything)
      Timer.new(:title => "word").time("hello") do
        x = 1
      end
    end
  
    it "should turn off growl" do
      @timer = Timer.new(:growl => false)
      @timer.growl?.should be_false
    end
  
    it "shouldn't growl a message" do
      Growl.should_not_receive(:new)
      Timer.new(:growl => false).time("hello") do
        x = 1
      end
    end
    
    it "should fail gracefully if growl is off" do
      @g.should_receive(:notify).and_raise("Connection refused: send(2)")
      lambda {
        Timer.new.time("hello") do
          x = 1
        end
      }.should_not raise_error
    end
    
    it "should raise other exceptions" do
      @g.should_receive(:notify).and_raise("Something else")
      lambda {
        Timer.new.time("hello") do
          x = 1
        end
      }.should raise_error("Something else")
    end
  end
  
  it "should put a message" do
    $stdout.should_receive(:puts).with(/hello/)
    Timer.new.time("hello") do
      x = 1
    end
  end
  
  describe "title" do
    it "should set the title" do
      Timer.new(:title => "YO").title.should == "YO"
    end
  
    it "shuld reset the title" do
      @timer = Timer.new(:title => "YO")
      @timer.title = "HEY"
      @timer.title.should == "HEY"
    end
  
    it "should override the title" do
      @g.should_receive(:notify).with(anything, /YEAH/, anything, anything, anything)
      @timer = Timer.new(:title => "word")
      @timer.time("hello", :title => "YEAH") do
        x = 1
      end
    end
  end
  
  describe "raising exceptions" do
    before(:each) do
      @timer = Timer.new
    end
    
    it "should re-raise an exception" do
      lambda {
        @timer.time("hello") do
          raise "Exception"
        end
      }.should raise_error("Exception")
    end
    
    it "should growl a message" do
      @g.should_receive(:notify).with(anything, anything, /hello/, anything, anything)
      lambda {
        @timer.time("hello") do
          raise "Exception"
        end
      }.should raise_error("Exception")
    end
    
    it "should growl a title" do
      @g.should_receive(:notify).with(anything, /word/, anything, anything, anything)
      lambda {
        Timer.new(:title => "word").time("hello") do
          raise "Exception"
        end
      }.should raise_error("Exception")
    end
    
    it "should put a message" do
      $stdout.should_receive(:puts).with(/hello/)
      lambda {
        @timer.time("hello") do
          raise "Exception"
        end
      }.should raise_error("Exception")
    end
  end
  
  describe "timing the action" do
    before(:each) do
      Timecop.return
      @timer = Timer.new
    end
    
    it "should report seconds" do
      @g.should_receive(:notify).with(anything, anything, /Elapsed time: 3 seconds\"\n$/, anything, anything)
      @timer.time("hello") do
        Timecop.freeze(Time.now + 3)
      end
    end
    
    it "should report only minutes when it's even" do
      @g.should_receive(:notify).with(anything, anything, /Elapsed time: 2 minutes\"\n$/, anything, anything)
      @timer.time("hello") do
        Timecop.freeze(Time.now + 120)
      end
    end
    
    it "should report minutes and seconds" do
      @g.should_receive(:notify).with(anything, anything, /Elapsed time: 1 minute, 14 seconds\"\n$/, anything, anything)
      @timer.time("hello") do
        Timecop.freeze(Time.now + 74)
      end
    end
  end
end
