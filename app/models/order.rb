class Order < ActiveRecord::Base
	enum order_status: {En_Proceso:1, Activa:2, Entregada:3, Cancelada:4}

	has_many :order_items
	before_create :set_order_status
	before_save :update_subtotal

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

	private
  def set_order_status
    self.order_status = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
