require 'rubygems'
require 'g'

class Timer
  attr_accessor :title, :growl
  
  def initialize(options={})
    @title = options[:title]
    @growl = true
    if options.has_key?(:growl)
      @growl = options[:growl]
    end
  end
  
  def time(message="", options={})
    current_title = options[:title] || title
    
    start_time = Time.now
    yield
    end_time = Time.now
    put_elapsed_time(start_time, end_time, message, current_title)
  end
  
  def growl?
    @growl
  end
  
  private

  def put_elapsed_time(start_time, end_time, message="", current_title=nil)
    elapsed_time = format_time(start_time, end_time)

    e = ""
    if message.to_s.strip != ""
      message += ". "
    end
    e = message + e
    e += "Elapsed time: #{elapsed_time}"
    $stdout.puts "\n" + e
    growl(e, current_title)
  end
  
  def format_time(start_time, end_time=nil)
    end_time ||= Time.now
    seconds = end_time - start_time
    if seconds > 59
      minutes = seconds / 60.0
      seconds = (minutes - minutes.to_i) * 60
      m = minutes.to_i
      s = seconds.to_i

      minutes_msg = m != 1 ? "minutes" : "minute"
      elapsed_time = "#{m} #{minutes_msg}"
      if s > 0
        seconds_msg = s != 1 ? "seconds" : "second"
        elapsed_time += ", #{s} #{seconds_msg}"
      end
    else
      s = seconds.to_i != 1 ? "seconds" : "second"
      elapsed_time = "#{seconds.to_i} #{s}"
    end
    elapsed_time
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