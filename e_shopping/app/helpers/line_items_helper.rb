module LineItemsHelper
  def create_line_items(product_id, cart_id)
    product = Product.find(product_id)
    item_total = calculate_total(product.price.to_i, product.discount.to_i)
    # create a new cart item
    LineItem.create(user_id: current_user.id, cart_id: cart_id,
                    product_id: product_id, quantity: 1, item_price: product.price, item_total: item_total, discount: product.discount)
  end

  def calculate_total(price, discount)
    if discount.zero?
      price
    else
      price - (price * (discount / 100.0))
    end
  end

  def view_line_items(user_id)
    @cart_items = LineItem.select('line_items.*, products.*, carts.id, carts.status,  SUM(line_items.quantity) as tot_items').left_outer_joins(
      :user, :cart, :product, :order
    ).group(:product_id).where('line_items.user_id = :user_id and carts.status = :status', { user_id: user_id, status: true})
  end

  def count_active_line_items(user_id)
    @cart_items = LineItem.select('line_items.id, carts.id, carts.status').left_outer_joins(:cart).where('line_items.user_id = :user_id and carts.status = :status', { user_id: user_id, status: true})

    @cart_items.to_a.count
  end

end
