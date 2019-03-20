class OrdersController < ApplicationController
    def index
        @orders = Order.where(user: current_user)
    end
    
    def show
        @order = Order.find(params["id"])
        @order_product = OrderProduct.new
        @products = Product.where(user: current_user)
        @order_products = OrderProduct.where(order_id: @order.id)
    end

    def new
        @order = Order.new
        @user = current_user
        @customers = Customer.where(user: current_user)
    end
    def create
        @order = Order.new(order_params)
        @order.user_id = current_user.id
        if @order.save
            redirect_to orders_path
        else
            render 'orders/new'
        end
    end
    private 
    def order_params
        params.require(:order).permit(:delivery_date, :customer_id)
    end
end
