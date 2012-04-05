require "spec_helper"

describe "Using the shopping cart" do
  context "when I'm on a product page" do
    let(:product) { Fabricate(:product) }
    before(:each) { visit product_path(product) }

    context "and I click 'add to cart'" do
      before(:each) { click_link_or_button "add to cart" }

      it "takes me to the cart page" do
        page.should have_content("Your Cart")
      end

      it "shows the product in my cart" do
        within("#cart") do
          page.should have_content(product.title)
        end
      end

      it "shows the cart quantity"
      it "shows the cart total"
    end

    context "when I add multiple items to the cart" do
      it "shows each item in the cart"
    end
  end

end