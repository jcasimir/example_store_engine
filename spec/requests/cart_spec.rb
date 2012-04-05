describe "Using the shopping cart", :focus => true do
  context "when I'm on a product page" do
    let(:product) { create_product }
    before(:each) { visit product_path(product) }

    context "and I click 'add to cart'" do
      before(:each) { click_link_or_button "add to cart" }

      it "shows the product in my cart" do
        within("#cart") do
          page.should have_content(product.title)
        end
      end

      it "shows the cart quanity"
      it "shows the cart total"
    end
  end
end