require 'rest-client'

class Authorization
  def initialize
    @developer_public_key = kyes['developer_public_key']
    @member_token         = kyes['member_token']
  end

  def authorize
    RestClient.get 'https://trello.com/1/authorize',
      {params: {key: @developer_public_key, scope: 'read,write'}}
  end

  private

  def kyes
    YAML.load_file "#{ENV['HOME']}/.trellorc"
  end
end
