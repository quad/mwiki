class PagesController < ApplicationController
  before_filter :load_page, :except => 'index'

  def index
    redirect_to :action => 'show', :id => 'Welcome'
  end

  def show
  end

  def edit
  end

  def update
    if @page.update_attributes params
      redirect_to :action => 'show', :id => @page.title
    else
      render :edit
    end
  end

  private

  def load_page
    @page = Page.find_by_title params[:id]
    @page = Page.new(:title => params[:id]) unless @page || params[:id].empty?
  end
end
