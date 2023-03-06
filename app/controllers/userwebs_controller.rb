class UserwebsController < ApplicationController
  before_action :set_userweb, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @e_markets = EMarket.all
    
    @userwebs = Userweb.all
    respond_with(@userwebs)
  end

  def show
    @e_markets = EMarket.all

    respond_with(@userweb)
  end

  def new
    @userweb = Userweb.new
    respond_with(@userweb)
  end

  def edit


  end


  def addcart
    product_id = params[:id]
    names = params[:Protect_name]
    product = params[:Protect]
    specification = params[:Specification]
    price = params[:Price]
    image = params[:image]
    
    das6 = Cart.where(user_id: current_user.id,product_id:product_id).first
    p das6.present?.to_s
    if das6.present?
      puts das6.quentity.class.inspect+"ggggggggggggggggggggggggggg"
      brr = das6.quentity.to_i+1
      das6.update_attribute(:quentity, brr.to_s)
       var  = das6.total_cost.to_i+price.to_i
      das6.update_attribute(:total_cost, var )     
    else
      saveCart = Cart.create(user_id: current_user.id,quentity: "1",product_id: product_id,product_names:names,product:product,specification:specification,real_price:price,image: image,total_cost: price)
    end
    redirect_to request.referrer
  end

  def cart
    obj = []
    user = current_user.id
    puts  user.inspect+"hhhhhhhhhhhhhhhhhhhhhhh"
    datae = Cart.where(user_id: user)
    if datae.present?
      datae.each do |s|
        datas = Cart.where(user_id: user,product_id: s.product_id).first
        obj.push(datas)
      end
      @e_mars = obj
       puts  @e_mars.inspect+"hhhhhhhhhhhhhhhhhhhhhhhhh"
    else
      @e_mars = ''
    end
  end

  def delete
    user = current_user.id
    product_id = params[:product_id]
    data = Cart.where(user_id: user,product_id: product_id).first
    data.destroy
    redirect_to request.referrer
    #redirect_to 'userwebs/cart'
  end

  def editcartpage
    @name = params[:product_names]
    @quantity =params[:quantity]
    @image = params[:image]
    @product_id = params[:product_id]

  end



  def shoe
    dress = EMarket.where(category: "shoe")
    @e_markets = dress

  end

  def edit_cart
    
    quantity = params[:edit_cart_path]["quantity"]

    product_id = params[:edit_cart_path]["product_id"]


    data = Cart.where(user_id: current_user.id, product_id: product_id).first
    puts quantity.inspect+"hhhhhhhhhhhhhiiiojukgfudfj"
    total = data.real_price.to_i * quantity.to_i
    puts total.inspect+"hhhhhhhhhhhhhiiiojukgfudfj"
    data.update_attribute(:quentity, quantity )
    data.update_attribute(:total_cost, total)
    redirect_to '/'

  end


  def Glossary
    dress = EMarket.where(category: "glossary")
    @e_markets = dress

  end

  def dress
    dress = EMarket.where(category: "dress")
    @e_markets = dress

  end
  
  def Mobiles
    dress = EMarket.where(category: "mobiles")
    @e_markets = dress

  end


  def profile
    @user = User.where(id: current_user.id).first
    @userse = @user.email.to_s
    @username = @user.user_name.to_s
  end



  def profilecreate
    names = params[:profilecreate_path]["cart"]
    image = params[:profilecreate_path]["avatar"].filename
    puts image.inspect+"jjjjjjjjj326435875696790878-07jjjjwgdweg"
    username = User.where(id: current_user.id).first
    username.update_attribute(:user_name, names)
    username.update_attribute(:image, image)

    



    redirect_to '/'
  end




  def form

    puts "jjjjjjjjjjjjjwgdweg"

  end

  def create
    @userweb = Userweb.new(userweb_params)
    @userweb.save
    respond_with(@userweb)
  end

  def update
    @userweb.update(userweb_params)
    respond_with(@userweb)
  end

  def destroy
    @userweb.destroy
    respond_with(@userweb)
  end

  private
    def set_userweb
      @userweb = Userweb.find(params[:id])
    end

    def userweb_params
      params.require(:userweb).permit(:cart, :user_id, :quantity)
    end
end
