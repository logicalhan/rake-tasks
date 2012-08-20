require 'thor/actions'
class Assets < Thor  
  include Thor::Actions
  desc "clean", "remove assets folder and increment the application assets version number" 
  method_options :force => :boolean  
  def clean
    `rake assets:clean`

    gsub_file 'config/application.rb', /\'(\d)\.(\d)\'/ do |match|
      blah = match.scan(/\d\.\d/).first
      "\'#{(blah.to_f + 0.1).round(1)}\'"
    end
  end  
end  