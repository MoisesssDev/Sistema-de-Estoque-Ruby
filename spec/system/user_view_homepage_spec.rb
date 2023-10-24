require 'rails_helper'

describe 'User visit home page' do
  it 'and see name app' do
    # Arrange

    # Act
    visit('/')

    # Assert
    expect(page).to have_content('Galpões & Estoque')
  end
end