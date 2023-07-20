class TranslationController < ApplicationController
  def index; end
  
  def show
    @translation = TranslatorFacade.new.get_translation(params["message"], params["language"])
  end
end