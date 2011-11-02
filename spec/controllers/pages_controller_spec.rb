require 'spec_helper'

describe PagesController do
  it "should redirect #index to 'Welcome'" do
    get :index

    should redirect_to :action => 'show', :id => 'Welcome'
  end

  it "should render a page even if it hasn't existed previously" do
    expected_title = 'Woopa'

    get :show, :id => expected_title

    assigns(:page).should be_a Page
    assigns(:page).title.should == expected_title
  end

  context "with a wiki page" do
    let(:page) { FactoryGirl.build :page }
    let(:expected_body) { 'Sup dogg' }

    before { Page.should_receive(:find_by_title).with(page.title).and_return page }

    it "should show it" do
      get :show, :id => page.title

      assigns(:page).should == page
      response.should render_template 'show'
    end

    it "should offer an edit view" do
      get :edit, :id => page.title

      assigns(:page).should == page
      response.should render_template 'show'
    end

    it "should accept edits" do
      expected_title = page.title

      put :update, :id => page.title, :page => {:body => expected_body}

      assigns(:page).should == page
      assigns(:page).body.should == expected_body
      response.should redirect_to :action => 'show', :id => expected_title
    end

    it "should let someone re-edit bad edits" do
      page.should_receive(:update_attributes).and_return false

      put :update, :id => page.title

      assigns(:page).should == page
      response.should render_template 'edit'
    end
  end
end
