require 'rails_helper'

RSpec.describe TranslatorService do
  describe 'get_translation' do
    it 'returns a hash' do
      lang = 'pirate'
      text = 'Hello World'

      response = TranslatorService.new.get_translation(text, lang)

      expect(response).to be_a(Hash)
      expect(response).to have_key(:contents)
      expect(response[:contents]).to have_key(:translated)
      expect(response[:contents][:translated]).to be_a(String)
      expect(response[:contents]).to have_key(:text)
      expect(response[:contents][:text]).to be_a(String)
      expect(response[:contents]).to have_key(:translation)
      expect(response[:contents][:translation]).to be_a(String)
    end
  end
end