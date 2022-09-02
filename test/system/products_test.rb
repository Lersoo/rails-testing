require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    # setup

    # exercise
    visit root_url # "/"

    # verify
    assert_selector "h1", text: "Cool Products"
    assert_selector ".card-product", count: Product.count
  end

  test "lets a signed in user create a new product and is redirected to the index" do
    # setup
    login_as users(:george)

    visit "/products/new"

    fill_in "product_name", with: "Le Wagon"
    fill_in "product_tagline", with: "Change your life: Learn to code"

    click_on "Create Product"

    assert_text "Change your life: Learn to code"
  end
end
