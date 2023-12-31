class WarehousesController < ApplicationController
  def show
    @warehouse = Warehouse.find(
    params[:id]
    )
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)

    if @warehouse.save
      redirect_to root_path, notice: "Galpão cadastrado com sucesso"
    else
      flash.now[:notice] = "Galpão não cadastrado"
      render 'new'
    end
  end
  
  def edit
    @warehouse = Warehouse.find(params[:id])
  end

  def update
    @warehouse = Warehouse.find(params[:id])

    if @warehouse.update(warehouse_params)
      redirect_to warehouse_path(@warehouse), notice: "Galpão editado com sucesso"
    else
      flash.now[:notice] = "Não foi possivel atualizar o Galpão"
      render "edit"
    end
  end

  private

  def warehouse_params
    params.require(:warehouse).permit(:name, :code, :city, :description, :address, :cep, :area)
  end
end
