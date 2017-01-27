require_relative 'trello_board/load_keys'

class TrelloBoard
  def initialize(boardid:)
    @keys = LoadKeys.keys
    @board = RestClient.get("https://api.trello.com/1/boards/#{boardid}/lists",
      {params: {key: @keys['developer_public_key'],
                token: @keys['member_token']}})
  end

  def lists
    @board.body
  end

  def create_card!(title:, description:, list_id:)
    RestClient.post('https://api.trello.com/1/cards',
      { key: @keys['developer_public_key'],
        token: @keys['member_token'],
        idList: list_id,
        name: title,
        desc: description })
  end
end
