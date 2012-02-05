require 'spec_helper'
describe "Static pages" do
  describe "Home page" do
    it "should have the content 'Home'" do
      visit '/'
      page.should have_content('Home')
    end
  end
end

#describe "Pages" do

#  subject { page }
  
#  shared_examples_for "all static pages" do
#    it { should have_selector('h1',     text: heading) }
#    it { should have_selector('title',  text: full_title(page_title)) }
#  end

#  describe "Home page" do
#    before { visit root_path }
#    let(:heading)       { 'Home' }
#    let(:page_title)    { 'Home' }

#    it_should_behave_like "all static pages"
#  end
#end
