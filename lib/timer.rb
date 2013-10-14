require 'rubygems'
require 'natural_time'

class Timer
  attr_accessor :title

  def initialize(options={})
    options ||= options
    @title = options[:title]
  end

  def time(message="", options={})
    current_title = options[:title] || title

    start_time = Time.now
    begin
      yield
    rescue StandardError => e
      put_elapsed_time(start_time, Time.now, e.message, current_title)
    end
    put_elapsed_time(start_time, Time.now, message, current_title)
    raise e if e
  end

  private

  def put_elapsed_time(start_time, end_time, message="", current_title=nil)
    elapsed_time = format_time(end_time - start_time)

    e = ""
    if message.to_s.strip != ""
      message += ". "
    end
    e = message + e
    e += "Elapsed time: #{elapsed_time}"
    $stdout.puts "\n" + e
  end

  def format_time(duration)
    NaturalTime.new(duration).to_sentence
  end
end
