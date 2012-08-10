ENV['LOG'] = 'not to my console, pls'
load '/Users/ralph/_code/core/local_config/irbrc'

load File.dirname(__FILE__) + '/.railsrc' if $0 == 'irb' && ENV['RAILS_ENV']

IRB.conf[:BACK_TRACE_LIMIT] = 100

def copy(str)
  IO.popen('pbcopy', 'w') { |f| f << str.to_s }
end

def paste
  `pbpaste`
end
