require 'rest-client'

class LoadKeys
  def self.keys
    YAML.load_file "#{ENV['HOME']}/.trellorc"
  end
end
