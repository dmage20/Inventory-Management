class OrderProductsController < ApplicationController
    def new
        @order_product = OrderProduct.new
    end
    def create
      @order_product = OrderProduct.new(order_product_params)
      @order = Order.find(params["order_id"])
      @product = Product.find(params["order_product"]["product_id"])
      @order_product.product = @product
      @order_product.order = @order
      if @order_product.save
        respond_to do |format|
          format.html {redirect_to orders_path(@order)}
          format.js
        end
      else
        respond_to do |format|
        format.html { render 'orders/show' }
        format.js  # <-- idem
        end
      end

    end
    def destroy
        @order_product = OrderProduct.find(params["id"])
        @order_product.destroy!
        redirect_to order_path(Order.find(params["order_id"]))
    end
    private
    def order_product_params
        params.require(:order_product).permit(:quantity, :product_id, :order_id)
    end
end

