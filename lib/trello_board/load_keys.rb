require 'rest-client'
require 'yaml'

class LoadKeys
  def self.keys
    if Rails.env.test?
      { 'developer_public_key' => '111', 'member_token' => '11111' }
    elsif
      YAML.load_file "#{ENV['HOME']}/.trellorc"
    end
  end
end
