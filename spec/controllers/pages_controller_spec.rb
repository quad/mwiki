require 'spec_helper'

describe PagesController do
  it "should redirect #index to 'Welcome'" do
    get :index
    response.should redirect_to :action => 'show', :id => 'Welcome'
  end
end
