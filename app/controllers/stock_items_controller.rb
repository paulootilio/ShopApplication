class StockItemsController < ApplicationController
  # before_action :set_stock_item, only: %i[ show edit update destroy ]

  # GET /stock_items or /stock_items.json
  def index
    @stock_items = StockItem.all
  end

  # GET /stock_items/1 or /stock_items/1.json
  def show
    @stock_product = StockItem.joins(:store, :product).where(:store_id => params[:store], :product_id => params[:product]).first
    @stock_item = params[:stock_item]
  end

  # GET /stock_items/new
  def new
    @store = Store.where(:id => params[:store]).first
    @stock_item = StockItem.new
  end

  # GET /stock_items/1/edit
  def edit
  end

  def remove_product
    @stock_item = StockItem.where(:store_id => params[:stock_store], :product_id => params[:stock_product]).first
  end

  def show_remove
    @stock_item = StockItem.where(:store_id => params[:store], :product_id => params[:product]).first
    @stock_remove = params[:stock_remove]
  end  
  
  
  # POST /stock_items or /stock_items.json
  def create
    @stock_exist = StockItem.where(:product_id => stock_item_params["product_id"], :store_id => stock_item_params["store_id"]).first
    if @stock_exist.present?
      @stock_product = stock_item_params["stock"].to_i + @stock_exist.stock.to_i
      @stock_exist.update(:stock => @stock_product)
    else
      @stock_item = StockItem.new(stock_item_params)       
    end  
    respond_to do |format|
      if @stock_exist.present?
        format.html { redirect_to stock_item_path(@stock_exist, :product => @stock_exist.product_id, :store => @stock_exist.store_id, :stock_item => stock_item_params["stock"].to_i), notice: "Estoque de Produto Adicionado com sucesso!" }
        format.json { render :show, status: :created, location: @stock_item }
      else
        if @stock_item.save
          format.html { redirect_to stock_item_path(@stock_item, :product => @stock_item.product_id, :store => @stock_item.store), notice: "Estoque de Produto Adicionado com sucesso!" }
          format.json { render :show, status: :created, location: @stock_item }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @stock_item.errors, status: :unprocessable_entity }
        end
      end    
    end 
  end

  # PATCH/PUT /stock_items/1 or /stock_items/1.json
  def update
    respond_to do |format|
      if params[:remove_product].present?
        @stock_exist = StockItem.where(:product_id => params[:remove_product][:product_id], :store_id => params[:remove_product][:store_id]).first
        @stock_exist.update(:stock => (@stock_exist.stock - params[:remove_product][:stock_remove].to_i))
        format.html { redirect_to show_remove_stock_items_path(:product => @stock_exist.product_id, :store => @stock_exist.store_id, :stock_remove => params[:remove_product][:stock_remove].to_i), notice: "Estoque de Produto removido com sucesso!" }
        format.json { render :show, status: :ok, location: @stock_item }
      else
        if @stock_item.update(stock_item_params)
          format.html { redirect_to @stock_item, notice: "Estoque de Produto atualizado com sucesso!" }
          format.json { render :show, status: :ok, location: @stock_item }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @stock_item.errors, status: :unprocessable_entity }
        end
      end    
    end
  end

  # DELETE /stock_items/1 or /stock_items/1.json
  def destroy
    @stock_item.destroy
    respond_to do |format|
      format.html { redirect_to stock_items_url, notice: "Estoque de Produto deletado com sucesso!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_item
      @stock_item = StockItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stock_item_params
      if params[:remove_product].present?
        params.require(:remove_product).permit(:store_id, :product_id, :stock_remove)
      else
        params.require(:stock_item).permit(:store_id, :product_id, :stock, :stock_remove)
      end    
    end
end
