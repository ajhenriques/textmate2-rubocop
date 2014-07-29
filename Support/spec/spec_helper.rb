$LOAD_PATH << '../lib'

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end

def tm_selected_files(*files)
  ENV['TM_SELECTED_FILES'] = files.each.map do |f|
    "'#{File.absolute_path(f)}'"
  end.join(' ')
end

# Stubs for TextMate env
ENV['TM_PROJECT_DIRECTORY'] ||= File.dirname('.')
ENV['TM_BUNDLE_SUPPORT']    ||= File.dirname('..')
ENV['TM_SELECTED_FILES']    ||= tm_selected_files(__FILE__)
ENV['TM_FILEPATH']          ||= __FILE__
ENV['TM_FULLNAME']          ||= 'John Doe'

require 'mate/runner'
