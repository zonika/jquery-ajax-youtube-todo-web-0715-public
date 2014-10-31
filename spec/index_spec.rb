require 'spec_helper'

describe "Index" do

  let(:iframe) { '<iframe id="ytplayer" type="text/html" width="640" height="390" src="http://www.youtube.com/' }
  
  before(:each) do
    visit "/"
  end

  it "adds video to 'search-results' div on click" do
    fill_in('text-field', with: 'adorn')
    find("#user-submit").click
    expect(page).to have_content(iframe)
  end

  it "can search for a second video after loading the first using click" do
    fill_in('text-field', with: 'adorn')
    find("#user-submit").click
    first_iframe = page.find("#ytplayer")
    fill_in('text-field', with: 'jason derulo')
    find("#user-submit").click
    expect(page).to_not eq(first_iframe)
  end

  it "deletes the first video before replacing it with a second when using click" do
    fill_in('text-field', with: 'adorn')
    find("#user-submit").click
    fill_in('text-field', with: 'jason derulo')
    find("#user-submit").click
    expect(page).to match_exactly(1, "iframe")
  end

end