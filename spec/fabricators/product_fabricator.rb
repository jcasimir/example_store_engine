Fabricator(:product) do
  title { "Product #{sequence}" }
  description { "blah blah blah #{sequence}"}
  price { BigDecimal.new("1.99") }
end
