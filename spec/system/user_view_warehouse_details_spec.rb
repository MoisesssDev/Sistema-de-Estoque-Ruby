require 'rails_helper'

describe "user visit warehouse details" do
  it "and see additional information" do
    # Arrange
    Warehouse.create(name: 'Aeroporto Guarulhos', code: 'GRU', city: 'Guarulhos', area: 100_000,
                     address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                     description: 'Galpão destinado para cargas internacionais.')

    # Act
    visit(root_path)
    click_on('Aeroporto Guarulhos')

    #Assert
    expect(page).to have_content('Galpão GRU')
    expect(page).to have_content('Nome: Aeroporto Guarulhos')
    expect(page).to have_content('Cidade: Guarulhos')
    expect(page).to have_content('Endereço: Avenida do Aeroporto, 1000')
    expect(page).to have_content('CEP: 15000-000')
    expect(page).to have_content('Descrição: Galpão destinado para cargas internacionais.')
  end

  it 'and back to home page' do
    # Arrange
    Warehouse.create(name: 'Aeroporto Guarulhos', code: 'GRU', city: 'Guarulhos', area: 100_000,
                     address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                     description: 'Galpão destinado para cargas internacionais.')

    # Act
    visit(root_path)
    click_on('Aeroporto Guarulhos')
    click_on('Voltar')

    # Assert
    expect(current_path).to eq('/')
  end
end
