class Product < ActiveRecord::Base
  default_scope :order => 'title'
  has_many :line_items, :dependent => :destroy
  
  before_destroy :ensure_not_referenced_by_any_line_item
  
  def ensure_not_referenced_by_any_line_item
    if line_items.count.zero?
      true
    else
      errors[:base] << "Line Items present"
      false
    end
  end
  
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :length => {:minimum => 10, :message => 'OMG! Title is too short'}, :uniqueness => true
  validates :image_url, :format => {
    :with => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPG or PNG image.'
  }
end
