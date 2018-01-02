require "timecop"

RSpec.describe Timer do
  before do
    allow($stdout).to receive(:puts)
  end

  it "should put a message" do
    expect($stdout).to receive(:puts).with(/hello/)
    Timer.new.time("hello") do
      x = 1
    end
  end

  describe "title" do
    it "should set the title" do
      expect(Timer.new(:title => "YO").title).to eq"YO"
    end

    it "should reset the title" do
      @timer = Timer.new(:title => "YO")
      @timer.title = "HEY"
      expect(@timer.title).to eq"HEY"
    end
  end

  describe "raising exceptions" do
    before(:each) do
      @timer = Timer.new
    end

    it "should re-raise an exception" do
      expect {
        @timer.time("hello") do
          raise "Exception"
        end
      }.to raise_error("Exception")
    end

    it "should growl a message" do
      expect {
        @timer.time("hello") do
          raise "Exception"
        end
      }.to raise_error("Exception")
    end

    it "should growl a title" do
      expect {
        Timer.new(:title => "word").time("hello") do
          raise "Exception"
        end
      }.to raise_error("Exception")
    end

    it "should put the exception" do
      expect($stdout).to receive(:puts).with(/Exception/)
      expect {
        @timer.time("hello") do
          raise "Exception"
        end
      }.to raise_error("Exception")
    end

    it "should report elapsed time" do
      Timecop.return
      expect {
        @timer.time("hello") do
          Timecop.freeze(Time.now + 120)
          raise "Exception"
        end
      }.to raise_error("Exception")
      Timecop.return
    end
  end

  describe "timing the action" do
    before(:each) do
      Timecop.return
      @timer = Timer.new
    end

    it "should report seconds" do
      @timer.time("hello") do
        Timecop.freeze(Time.now + 3)
      end
    end

    it "should report only minutes when it's even" do
      @timer.time("hello") do
        Timecop.freeze(Time.now + 120)
      end
    end

    it "should report minutes and seconds" do
      @timer.time("hello") do
        Timecop.freeze(Time.now + 74)
      end
    end
  end
end
