require 'rails_helper'

feature 'Create post', %q{
 In order to get answer from community
 As an authenticated user
 I want to be able to ask questions as posts
} do

  scenario 'Authenticated user is trying to create post' do
    User.create!(email: 'user@test.com', password: '12345678')

    visit new_user_session_path
    fill_in 'Email', with: 'user@test.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'

    visit posts_path
    click_on 'Create new post'
    fill_in 'Title', with: 'Rspec post title'
    fill_in 'Content', with: 'Rspec post content'
    click_on 'Create Post'

    expect(page).to have_content 'New awesome post was successfully created by user@test.com.'
  end

  scenario 'Non-authenticated user is trying to create post' do
    visit posts_path

    if page.has_link?('Create Post')
      click_on 'Create Post'
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end
  end
end