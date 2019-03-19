class OrderProductsController < ApplicationController
    def new
        @order_product = OrderProduct.new
    end
end
