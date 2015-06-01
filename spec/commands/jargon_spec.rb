require 'spec_helper'

describe 'Jargon' do
  describe 'perform' do
    it 'performs the command' do
      response = Jargon.perform
      expect(response).to be_truthy
    end

    it 'returns a response' do
      response = Jargon.perform
      expect(response).to be_a Hash
      expect(response).not_to be_empty
    end

    it 'returns a string of jargon' do
      body = Jargon.perform[:body]
      text = ActiveSupport::JSON.decode(body)['text']

      expect(text).to be_a String
      expect(text).not_to be_empty
    end
  end
end
