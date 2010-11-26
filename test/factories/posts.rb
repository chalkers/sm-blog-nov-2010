Factory.define :post do |p|
  p.title "Default Title"
  p.body "Default Body"
  p.published true
end

Factory.define :draft, :parent => :post do |p|
  p.published false
end