class EMarketsController < ApplicationController
  before_action :set_e_market, only: [:show, :edit, :update, :destroy]

  # GET /e_markets
  # GET /e_markets.json
  def index
    @e_markets = EMarket.all
  end

  # GET /e_markets/1
  # GET /e_markets/1.json
  def show
  end

  # GET /e_markets/new
  def new
    @e_market = EMarket.new
  end

  # GET /e_markets/1/edit
  def edit
  end
  def deleteproduct
    id = params[:id]
    data = EMarket.where(id: id).first
    data.destroy
    redirect_to '/'
  end


  # POST /e_markets
  # POST /e_markets.json
  def create
    @e_market = EMarket.new(e_market_params)

    respond_to do |format|
      if @e_market.save
        format.html { redirect_to @e_market, notice: 'E market was successfully created.' }
        format.json { render :show, status: :created, location: @e_market }
      else
        format.html { render :new }
        format.json { render json: @e_market.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /e_markets/1
  # PATCH/PUT /e_markets/1.json
  def update
    respond_to do |format|
      if @e_market.update(e_market_params)
        format.html { redirect_to @e_market, notice: 'E market was successfully updated.' }
        format.json { render :show, status: :ok, location: @e_market }
      else
        format.html { render :edit }
        format.json { render json: @e_market.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /e_markets/1
  # DELETE /e_markets/1.json
  def destroy
    @e_market.destroy
    respond_to do |format|
      format.html { redirect_to e_markets_url, notice: 'E market was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_e_market
      @e_market = EMarket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def e_market_params
      params.require(:e_market).permit(:protect_name, :protect_id, :specification, :price,:image,:category)
    end
end
