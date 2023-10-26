require 'rails_helper'

describe 'User visit home page' do
  it 'and see name app' do
    # Arrange

    # Act
    visit(root_path)

    # Assert
    expect(page).to have_content('Galpões & Estoque')
  end

  it "and see registered warehouses" do
    # Arrange
    Warehouse.create(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60_000)
    Warehouse.create(name: 'Maceio', code: 'MCZ', city: 'Maceio', area: 50_000)

    # Act
    visit(root_path)

    # Assert
    expect(page).not_to have_content('Não existem galpões cadastrados.')
    expect(page).to have_content('Rio')
    expect(page).to have_content('Código: SDU')
    expect(page).to have_content('Cidade: Rio de Janeiro')
    expect(page).to have_content('60000 m2')


    # Assert
    expect(page).to have_content('Maceio')
    expect(page).to have_content('Código: MCZ')
    expect(page).to have_content('Cidade: Maceio')
    expect(page).to have_content('50000 m2')

  end
  
  it 'and no registered warehouses' do
    # Arrange

    #Act
    visit(root_path)

    #Assert
    expect(page).to have_content('Não existem galpões cadastrados.')
  end

end