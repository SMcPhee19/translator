class Translation
  attr_reader :translated, :text, :translation

  def initialize(translated, text, translation)
    @translated = translated
    @text = text
    @translation = translation
  end
end