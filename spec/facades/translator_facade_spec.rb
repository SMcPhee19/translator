require 'rails_helper'

RSpec.describe TranslatorFacade do
  describe 'get_translation' do
    it 'returns a translation object' do
      stub_request(:get, "https://api.funtranslations.com/translate/pirate.json?text=Hello%20World")
      .to_return(status: 200, body: File.read('./spec/fixtures/translation_service.json'))
      text = 'Hello World'
      lang = 'pirate'
      translation = TranslatorFacade.new.get_translation(text, lang)

      expect(translation).to be_a(Translation)
      expect(translation.text).to eq(text)
      expect(translation.translation).to eq(lang)
    end
  end
end