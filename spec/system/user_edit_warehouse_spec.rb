require 'rails_helper'

describe "User edit warehouse" do
  it "from the details page" do
    # Arrange
    Warehouse.create!(name: 'Aeroporto Guarulhos', code: 'GRU', city: 'Guarulhos', area: 100_000,
                     address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                     description: 'Galpão destinado para cargas internacionais.')

    # Act
    visit root_path
    click_on "Aeroporto Guarulhos"
    click_on "Editar"

    # Assert
    expect(page).to have_content 'Editar Galpão'  
    expect(page).to have_field 'Nome', with: "Aeroporto Guarulhos"
    expect(page).to have_field 'Descrição', with: "Galpão destinado para cargas internacionais."
    expect(page).to have_field 'Código', with: "GRU"
    expect(page).to have_field 'Endereço', with: "Avenida do Aeroporto, 1000"
    expect(page).to have_field 'Cidade', with: "Guarulhos"
    expect(page).to have_field 'CEP', with: "15000-000"
    expect(page).to have_field 'Área', with: "100000"
  end

  it "successfully edited" do
    # Arrange
    Warehouse.create!(name: 'Aeroporto Guarulhos', code: 'GRU', city: 'Guarulhos', area: 100_000,
                      address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                      description: 'Galpão destinado para cargas internacionais.')

    # Act
    visit root_path
    click_on "Aeroporto Guarulhos"
    click_on "Editar"
    fill_in "Nome",	with: "Galpão internacional" 
    fill_in "CEP",	with: "49100-000" 
    fill_in "Endereço",	with: "Avenida Aeroporto, 491" 
    fill_in "Área",	with: "75000"
    click_on "Salvar" 

    # Assert
    expect(page).to have_content "Galpão editado com sucesso"
    expect(page).to have_content "Galpão internacional"
    expect(page).to have_content "49100-000"
    expect(page).to have_content "Avenida Aeroporto, 491"
    expect(page).to have_content "75000"

  end

  it "and keep the required fields" do
    # Arrange
    Warehouse.create!(name: 'Aeroporto Guarulhos', code: 'GRU', city: 'Guarulhos', area: 100_000,
                      address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                      description: 'Galpão destinado para cargas internacionais.')

    # Act
    visit root_path
    click_on "Aeroporto Guarulhos"
    click_on "Editar"
    fill_in "Nome",	with: "" 
    fill_in "CEP",	with: "" 
    fill_in "Endereço",	with: "" 
    fill_in "Área",	with: ""
    click_on "Salvar" 

    # Assert
    expect(page).to have_content "Não foi possivel atualizar o Galpão"

  end
  
  
end
