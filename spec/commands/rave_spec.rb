require 'spec_helper'

describe 'Rave' do
  describe 'perform' do
    it 'performs the command' do
      response = Rave.perform
      expect(response).to be_truthy
    end

    it 'returns a response' do
      response = Rave.perform
      expect(response).to be_a Hash
      expect(response).not_to be_empty
    end

    it 'returns a the url of the Rave image' do
      body = Rave.perform[:body]
      text = ActiveSupport::JSON.decode(body)['text']

      expect(text).to be_a String
      expect(text).not_to be_empty
      expect(text).to eq 'http://i.imgur.com/ZT8S42H.png'
    end
  end
end
