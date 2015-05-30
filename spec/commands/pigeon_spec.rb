require 'spec_helper'

describe 'Pigeon' do
  it 'performs the command' do
    response = Pigeon.perform

    expect(response).to be_truthy
  end

  it 'returns a string that should be a sandwich' do
    response = Pigeon.perform

    body = ActiveSupport::JSON.decode(response[:body]).symbolize_keys
    text = body[:text]

    expect(text).to include('with')
    expect(text).to include('on')
  end
end
