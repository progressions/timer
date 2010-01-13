require 'rubygems'
require 'g'
require 'natural_time'

class Timer
  attr_accessor :title, :growl
  
  DEFAULT_OPTIONS = { :growl => true }
  
  def initialize(options={})
    options = DEFAULT_OPTIONS.merge(options)
    @title = options[:title]
    @growl = options[:growl]
  end
  
  def time(message="", options={})
    current_title = options[:title] || title
    
    start_time = Time.now
    begin
      yield
    rescue StandardError => e
    end
    put_elapsed_time(start_time, Time.now, message, current_title)
    raise e if e
  end
  
  def growl?
    @growl
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
    growl(e, current_title)
  end
  
  def format_time(duration)
    NaturalTime.new(duration).to_sentence
  end
  
  def growl(message, current_title)
    if growl?
      if title
        g(message, :title => current_title)
      else
        g(message)
      end
    end
  rescue StandardError => e
    # growl isn't turned on, fail silently
    unless e.message =~ /Connection refused/
      raise e
    end    
  end
end