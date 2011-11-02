require 'spec_helper'

describe 'routing to pages' do
  it "routes /pages/:title to profile#show for title" do
    { :get => '/pages/hello' }.should route_to :controller => 'pages',
                                               :action => 'show',
                                               :id => 'hello'
  end

  it "redirects / to /pages" do
    { :get => '/' }.should route_to :controller => 'pages',
                                    :action => 'index'
  end
end
