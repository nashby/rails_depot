Factory.define :line_item do |f|
  f.association :product
  f.association :cart
end
