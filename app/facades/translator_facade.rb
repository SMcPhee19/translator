class TranslatorFacade
  def get_translation(text, lang)
    translation = translator_service.get_translation(text, lang)

    Translation.new(translation[:contents][:translated], translation[:contents][:text], translation[:contents][:translation])
  end

  def translator_service
    @_translator_service ||= TranslatorService.new
  end
end