class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
    def current_cart
      unless @current_cart
        @current_cart = Cart.find_by_id(session[:cart_id])
        unless @current_cart
          @current_cart = Cart.create
          session[:cart_id] = @current_cart.id
        end
      end
      @current_cart
    end
end
