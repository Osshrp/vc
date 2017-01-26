require_relative 'trello_board/authorization'

class TrelloBoard
  def initialize(option = {})
    @developer_public_key = kyes['developer_public_key']
    @member_token         = kyes['member_token']
    @boardid = option[:boardid]
    client
  end

  private

  def kyes
    YAML.load_file "#{ENV['HOME']}/.trellorc"
  end

  def client
    @board = RestClient.get("https://api.trello.com/1/boards/#{@boardid}",
      {params: {key: @developer_public_key, token: @member_token}})
  end
end
