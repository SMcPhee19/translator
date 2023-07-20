class TranslatorService
  def get_translation(text, lang)
    get_url("/translate/#{lang}.json?text=#{text}")
  end

  private

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.funtranslations.com')
  end
end