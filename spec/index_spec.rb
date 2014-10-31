require 'spec_helper'

describe "Index" do

  let(:iframe) { '<iframe id="ytplayer" type="text/html" width="640" height="390" src="http://www.youtube.com/' }
  
  before(:each) do
    visit "/"
  end

  it "adds video to 'search-results' div on click" do
    fill_in('#text-field', with: 'adorn')
    click_on "Search"
    expect(page).to have_content(iframe)
  end

  it "adds video to 'search-results' div on enter" do
    fill_in('#text-field', with: 'adorn')
    find('#text-field').native.send_keys(:return)
    expect(page).to have_content(iframe)
  end

  it "can search for a second video after loading the first" do
    fill_in('#text-field', with: 'adorn')
    click_on "Search"
    first_search = page
    fill_in('#text-field', with: 'jason derulo')
    click_on "Search"
    expect(page).to_not eq(first_search)
  end

  it "deletes the first video before replacing it with a second" do
    fill_in('#text-field', with: 'adorn')
    click_on "Search"
    fill_in('#text-field', with: 'jason derulo')
    click_on "Search"
    expect(page).to match_exactly(1, "iframe")
  end

end