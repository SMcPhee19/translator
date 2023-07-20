require 'rails_helper'

RSpec.describe 'landing page' do
  describe 'As a user' do
    it 'I see a welcome message' do
      visit '/'

      expect(page).to have_content('Let us get this translation started!')
    end

    it 'has a form to select language and fill out a message' do
      stub_request(:get, "https://api.funtranslations.com/translate/pirate.json?text=Hello%20World")
      .to_return(status: 200, body: File.read('./spec/fixtures/translation_service.json'))
      visit '/'

      expect(page).to have_field("language")
      expect(page).to have_field("message")

      select 'pirate', from: 'language'
      fill_in 'message', with: 'Hello World'
      click_on 'Translate'

      expect(current_path).to eq('/')
    end
  end
end