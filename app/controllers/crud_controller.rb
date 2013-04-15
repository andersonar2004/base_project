class CrudController < ApplicationController
  inherit_resources
  respond_to :html
#  actions :index, :show, :new, :create

  def create
    create! do |success, failure|
      success.html { redirect_to collection_path, :notice => t("notice.save_object") }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to collection_path, :notice => t("notice.update_object") }
    end    
  end
  
  def destroy
    destroy!(:notice => t("notice.destroy_object")) { collection_path }
  end

  protected

  def set_title(title, i18n = true)
    if i18n
      @title_form = t("views.title.#{title}")
    else
      @title_form = title
    end    
  end

  def set_form(partial)
    @partial_form = partial
  end

  def set_action_button(action_button)
    @action_button = action_button
  end
end
