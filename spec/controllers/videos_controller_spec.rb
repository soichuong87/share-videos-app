require 'rails_helper'

RSpec.describe VideosController, type: :controller do

  describe "GET index with no login" do
    let(:user) { create(:user) }
    let(:video) { create(:video, user: user) }
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end

describe "Signing Up", :type => :feature do
  it "allows a user to sign up" do
    visit root_path
    within("form#login_or_new") do
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "passwordA1"
    end
    click_button "Register"
    expect(page).to have_content "Welcome user@example.com"
  end
end

describe "Sign In", :type => :feature do
  let!(:user) { create(:user) }
  it "allows a user to sign in" do
    visit root_path
    within("form#login_or_new") do
      fill_in "Email", with: user.email
      fill_in "Password", with: "passwordA1"
    end
    click_button "Register"
    expect(page).to have_content "Welcome #{user.email}"
  end
end

describe "Share a movice", :type => :feature do
  it "allows a user to sign in" do
    visit root_path
    within("form#login_or_new") do
      fill_in "Email", with: "user1@gmail.com"
      fill_in "Password", with: "passwordA1"
    end
    click_button "Register"
    expect(page).to have_content "Welcome user1@gmail.com"
    click_on "Share a movie"
    expect(page).to have_content "Share a Youtube movie"
    within("form#share_movie") do
      fill_in "video[link]", with: "https://www.youtube.com/watch?v=ylHt7bhgZnw"
    end
    click_button "Share"
    new_movie = Video.where(uid: "ylHt7bhgZnw").first
    expect(page).to have_content new_movie&.title
  end
end