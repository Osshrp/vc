require 'rails_helper'
require 'trello_board'

describe 'Trello wrapper' do
  let!(:board) { TrelloBoard.new(boardid: '123') }

  it 'returns http code 200' do
    expect(board.instance_variable_get(:@board).code).to eq(200)
  end

  it 'creates card' do
    response = board.create_card!(title: 'sometitle',
                                  description: 'somedescription',
                                  list_id: '222')
    expect(response.code).to eq(200)
  end
end
