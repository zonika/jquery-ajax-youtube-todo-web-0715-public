require 'spec_helper'

describe "Index" do

  let(:iframe) { '<iframe id="ytplayer" type="text/html" width="640" height="390" src="http://www.youtube.com/' }

  before(:each) do
    visit "/"
  end

  it "adds video to 'search-results' div on click" do
    fill_in('text-field', with: 'adorn')
    find("#user-submit").click
    expect(page).to have_selector('iframe')
  end

  it "can search for a second video after loading the first" do
    fill_in('text-field', with: 'drunk in love')
    find("#user-submit").click
    adorn_src = page.find("#ytplayer")['src']
    fill_in('text-field', with: 'jason derulo')
    find("#user-submit").click
    expect(page.find("#ytplayer")['src']).to_not eq(adorn_src)
  end

  it "deletes the first video before replacing it with a second when using click" do
    fill_in('text-field', with: 'kelly clarkson')
    find("#user-submit").click
    fill_in('text-field', with: 'beyonce')
    find("#user-submit").click
    expect(page).to match_exactly(1, "iframe")
  end

end
