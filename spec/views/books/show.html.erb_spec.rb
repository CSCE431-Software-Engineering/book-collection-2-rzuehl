require 'rails_helper'

RSpec.describe "books/show", type: :view do
  before(:each) do
    assign(:book, Book.create!(title: "Test"))
  end

  it "renders attributes in <p>" do
    render
  end
end
