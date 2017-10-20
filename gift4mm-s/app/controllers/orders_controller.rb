class OrdersController < ApplicationController
   
      before_action :logged_in_user, only: [:create, :edit]

    def new
       @order = current_user.orders.new
    end


     def create
       @order = current_user.orders.new(params[:order])
       @order.totalprice = session[:cart_total]

       @cart = session[:cart]
       @cart.each do | id, quantity |
         @item = Item.find_by_id(id)
         @orderitem = @order.order_items.new((params[:order_item]))
         @orderitem.title = @item.title
         @orderitem.description = @item.description
         @orderitem.quantity = quantity
         @orderitem.unitprice = @item.price
         @orderitem.image = @item.image
         @orderitem.totalprice = @item.price * quantity
       end

       if @order.save
         flash[:success] = "Order created, thank you!"
         clear_cart
       redirect_to '/cart'
       else
         render '/cart'
       end
     end

   def eit
   end

   def show
     @user = current_user
     @orders = @user.orders.paginate(page: params[:page])
   end

   def showOrderItems
    @currentOrder = Order.find(params[:id])
   end

   private

     def order_params

       params.require(:order).permit(:totalprice)
     end

    
end
