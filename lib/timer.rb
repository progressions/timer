require 'rubygems'
require 'g'

class Timer
  attr_accessor :timer_title, :growl
  
  def initialize(options={})
    @timer_title = options[:title]
    if options[:growl] == nil
      options[:growl] = true
    end
    @growl = options[:growl]
  end
  
  def time(message="", options={})
    title = options[:title] || timer_title
    
    start_time = Time.now
    yield
    end_time = Time.now
    put_elapsed_time(start_time, end_time, message, title)
  end
  
  private
  
  def growl?
    @growl
  end

  def put_elapsed_time(start_time, end_time, message="", title=nil)
    elapsed_time = format_time(start_time, end_time)

    puts
    e = ""
    if message.to_s.strip != ""
      message += ". "
    end
    e = message + e
    e += "Elapsed time: #{elapsed_time}"
    puts e
    growl(e, title)
  end
  
  def format_time(start_time, end_time=nil)
    end_time ||= Time.now
    seconds = end_time - start_time
    if seconds > 59
      minutes = seconds / 60.0
      seconds = (minutes - minutes.to_i) * 60

      m = minutes.to_i > 1 ? "minutes" : "minute"
      elapsed_time = "#{minutes.to_i} #{m}"
      if seconds > 0
        s = seconds.to_i > 1 ? "seconds" : "minutes"
        elapsed_time += ", #{seconds.to_i} #{s}"
      end
    else
      s = seconds.to_i > 1 ? "seconds" : "minutes"
      elapsed_time = "#{seconds.to_i} #{s}"
    end    
  end
  
  def growl(message, title)
    if growl?
      if title
        g(message, :title => title)
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