require 'rails_helper'

RSpec.describe 'translation' do
  before :each do
    stub_request(:get, "https://api.funtranslations.com/translate/pirate.json?text=Hello%20World")
      .to_return(status: 200, body: File.read('./spec/fixtures/translation_service.json'))
      
    @text = 'Hello World'
    @lang = 'pirate'
    @translation = TranslatorFacade.new.get_translation(@text, @lang)
  end

  it 'exists with attributes' do
    expect(@translation).to be_a(Translation)
    expect(@translation.translated).to be_a(String)
    expect(@translation.translated).to eq('Ahoy World')
    expect(@translation.text).to be_a(String)
    expect(@translation.text).to eq(@text)
    expect(@translation.translation).to be_a(String)
    expect(@translation.translation).to eq(@lang)
  end
end