require 'rails_helper'

describe "User register warehouse " do
  it "from the home page" do
    # Arrange

    # Act
    visit root_path
    click_on 'Cadastrar Galpão'

    # Assert
    expect(page).to have_field('Nome')
    expect(page).to have_field('Descrição')
    expect(page).to have_field('Código')
    expect(page).to have_field('Endereço')
    expect(page).to have_field('Cidade')
    expect(page).to have_field('CEP')
    expect(page).to have_field('Área')
  end

  it "registered successfully" do
    # Arrange

    # Act
    visit root_path
    click_on "Cadastrar Galpão"
    fill_in "Nome",	with: "Porto Rio Sergipe" 
    fill_in "Descrição",	with: "Galpão responsavel pelo litoral Nordestino." 
    fill_in "Código",	with: "SGP" 
    fill_in "Endereço",	with: "Rua da frente, 3241" 
    fill_in "Cidade",	with: "Aracaju" 
    fill_in "CEP",	with: "45123-000" 
    fill_in "Área",	with: "45000"
    click_on "Salvar"

    # Assert
    expect(current_path).to eq root_path 
    expect(page).to have_content "Galpão cadastrado com sucesso"
    expect(page).to have_content "Porto Rio Sergipe"
    expect(page).to have_content "SGP"
    expect(page).to have_content "Aracaju"
    expect(page).to have_content "45000 m2"

  end
  
end
