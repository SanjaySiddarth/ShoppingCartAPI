class ShoppingCartController < ApplicationController
    before_action :get_user_cart
    before_action :set_cart_options, only: [:add_items_to_cart, :delete_item_from_cart]

    def get_items_in_cart
        if @cart != 0 and @user != 0
            render :json => @cart.to_json(:include => [:cart_items])
        else
            render json: "User does not exist", status: :unprocessable_entity
        end
    end

    def add_items_to_cart
        if @cart != 0
            change_cart_quantity(@cart, 'increase')
            render json: @cart, status: :created
        else
            render json: "User does not exist", status: :unprocessable_entity
        end
    end

    def delete_item_from_cart
        if !@cart.cart_items.empty?
            change_cart_quantity(@cart, 'decrease')
            render json: @cart, status: :created
        else
            render json: "No items in cart!", status: :created
        end

    end


    private

        def cart_params
            params.permit(:user_id, :addons, :variations, :menu_item)
        end

        def get_user_cart
            @user = User.find_by_id(cart_params[:user_id])
            if @user.nil?
                @user = 0
            else
                @cart = @user.cart
                if @cart.nil?
                    @cart = Cart.create(user: @user)
                end
            end
        end

        def update_gross_amount(cart)
            cart.gross_amount = cart.cart_items.sum(:total_price)
            cart.save
        end

        def set_cart_options
            menu_item, addon_param, variation_param = cart_params[:menu_item], cart_params[:addons], cart_params[:variations]
            menu = Menu.find(menu_item)
            addon = menu.addons.find_by_id(addon_param) 
            variation = menu.variations.find_by_id(variation_param)
            @menu_id, @menu_price = menu.id, menu.item_price
            @addon_id, @addon_price, @variation_id,  @variation_price = 0, 0, 0, 0
            if !addon.nil?
                @addon_id, @addon_price,  = addon.id, addon.price.to_f
            end
            if !variation.nil?
                @variation_id, @variation_price = variation.id, variation.price.to_f
            end
        end

        def change_cart_quantity(cart, action)
            @cart_item = @cart.cart_items.where(menu_item: @menu_id, addons: @addon_id, variations: @variation_id)
            base_price = @menu_price + @addon_price + @variation_price
            if action == 'increase'
                if @cart_item.empty?
                    CartItem.create(quantity: 1, base_price: base_price, total_price: base_price, menu_item: @menu_id, addons: @addon_id, variations: @variation_id, cart: @cart)
                else
                    @cart_item[0].quantity += 1
                    @cart_item[0].total_price =  @cart_item[0].base_price * @cart_item[0].quantity
                    @cart_item[0].save
                end

            elsif action == 'decrease'
                if @cart_item[0].quantity > 1
                    @cart_item[0].quantity -= 1
                    @cart_item[0].total_price =  @cart_item[0].base_price * @cart_item[0].quantity
                    @cart_item[0].save
                else
                    @cart_item[0].destroy
                end
            end
            update_gross_amount(@cart)
        end

end
