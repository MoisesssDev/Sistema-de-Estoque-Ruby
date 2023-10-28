require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe "#valid?" do
    context "presence" do
      it "false when name is empty" do
        # Arrange
        warehouse = Warehouse.new(name: '', code: 'ALG', address: 'Rua josé peixoto, 175',
                                  cep: '56590-040', city: 'Maceio', area: 25000, description: 'Galpão em Alagoas')
        # Act
        result = warehouse.valid?
  
        # Assert
        expect(result).to eq false 
      end
  
      it "false when code is empty" do
        # Arrange
        warehouse = Warehouse.new(name: 'Alagoas', code: '', address: 'Rua josé peixoto, 175',
                                  cep: '56590-040', city: 'Maceio', area: 25000, description: 'Galpão em Alagoas')
        # Act
        result = warehouse.valid?
  
        # Assert
        expect(result).to eq false 
      end
      
      it "false when address is empty" do
        # Arrange
        warehouse = Warehouse.new(name: 'Alagoas', code: 'ALG', address: '',
                                  cep: '56590-040', city: 'Maceio', area: 25000, description: 'Galpão em Alagoas')
        # Act
        result = warehouse.valid?
  
        # Assert
        expect(result).to eq false 
      end
  
      it "false when cep is empty" do
        # Arrange
        warehouse = Warehouse.new(name: 'Alagoas', code: 'ALG', address: 'Rua josé peixoto, 175',
                                  cep: '', city: 'Maceio', area: 25000, description: 'Galpão em Alagoas')
        # Act
        result = warehouse.valid?
  
        # Assert
        expect(result).to eq false 
      end
  
      it "false when city is empty" do
        # Arrange
        warehouse = Warehouse.new(name: 'Alagoas', code: 'ALG', address: 'Rua josé peixoto, 175',
                                  cep: '56590-040', city: '', area: 25000, description: 'Galpão em Alagoas')
        # Act
        result = warehouse.valid?
  
        # Assert
        expect(result).to eq false 
      end
  
      it "false when area is empty" do
        # Arrange
        warehouse = Warehouse.new(name: 'Alagoas', code: 'ALG', address: 'Rua josé peixoto, 175',
                                  cep: '56590-040', city: 'Maceio', area: '', description: 'Galpão em Alagoas')
        # Act
        result = warehouse.valid?
  
        # Assert
        expect(result).to eq false 
      end
  
      it "false when description is empty" do
        # Arrange
        warehouse = Warehouse.new(name: 'Alagoas', code: 'ALG', address: 'Rua josé peixoto, 175',
                                  cep: '56590-040', city: 'Maceio', area: 25000, description: '')
        # Act
        result = warehouse.valid?
  
        # Assert
        expect(result).to eq false 
      end
  
    end
  
    context "uniqueness" do
      it "false when code is already in use" do
        # Arrange
        warehouse = Warehouse.create(name: 'Alagoas', code: 'ALG', address: 'Rua josé peixoto, 175',
                                              cep: '56590-040', city: 'Maceio', area: 25000, description: 'Galpão em Alagoas')
        second_warehouse = Warehouse.new(name: 'Pernambuco', code: 'ALG', address: 'Rua Luís Cardoso, 61',
                                              cep: '21790-240', city: 'São Brás', area: 20000, description: 'Galpão em Pernambuco')
        # Act
        result = second_warehouse.valid?

        # Assert
        expect(result).to eq false  
      end
      
    end
    
  end
    
end
