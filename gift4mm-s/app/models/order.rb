class Order < ApplicationRecord
    
   belongs_to :user
   has_many :order_items, dependent: :destroy
   validates :user_id, presence: true

   default_scope -> { order(created_at: :desc) }

   before_save :update_totalprice

   def subtotal
     order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unitprice) 
: 0 }.sum
   end
private
   def set_order_status
     self.order_status_id = 1
   end

   def update_totalprice
     self[:totalprice] = totalprice
   end
  
end
