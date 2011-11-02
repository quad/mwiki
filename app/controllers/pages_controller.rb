class PagesController < ApplicationController
  def index
    redirect_to :action => :show, :id => 'Welcome'
  end
end
