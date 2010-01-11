require 'rubygems'
require 'g'

module Timer
  def time(message="", options={})
    title = options[:title] || ""
    
    start_time = Time.now
    yield
    end_time = Time.now
    put_elapsed_time(start_time, end_time, message, title)
  end

  def put_elapsed_time(start_time, end_time, message="", title=nil)
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

    puts
    e = ""
    if message.strip != ""
      message += ". "
    end
    e = message + e
    e += "Elapsed time: #{elapsed_time}"
    puts e
    if title
      g(e, :title => title)
    else
      g(e)
    end
  rescue StandardError => e
    # growl isn't turned on, fail silently
    unless e.message =~ /Connection refused/
      raise e
    end
  end
end