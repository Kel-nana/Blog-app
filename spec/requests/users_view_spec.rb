require 'rails_helper'

RSpec.describe "users/index", type: :view do
  it "displays 'Users list' heading" do
    assign(:users, [User.new(name: 'user1'), User.new(name: 'user2')]) 
    render
    expect(rendered).to have_selector('h1', text: 'Users list')
  end
end
