Factory.sequence :title do |n|
  "Programming Ruby 1.9 #{n}"
end

Factory.define :product do |f|
  f.title { Factory.next(:title) }
  f.description  'Ruby is the fastest growing and most exciting dynamic
                  language out there. If you need to get working programs
                  delivered fast, you should add Ruby to your toolbox.'
  f.price 49.50
  f.image 'ruby.png'
end
