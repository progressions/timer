# Timer

Simple timer to display elapsed time of a block.

## Usage

1. Instantiate timer with optional Growl message timer.

    timer = Timer.new(:title => "My Timer")

2. Call the timer with a block and optional message to output.

    timer.time("The block has finished executing!") do
      # some code in here
    end

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2018 Isaac Priestley. See LICENSE for details.
