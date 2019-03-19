class ProductsController < ApplicationController
    def index
        @products = Product.where(user: current_user)
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_parmas)
        @product.user_id = current_user.id
        if @product.save
            redirect_to products_path
        else
            render 'products/new'
        end
    end
    private
    def product_parmas
        params.require(:product).permit(:name, :desciption, :quantity, :cost, :pice)
    end
end
