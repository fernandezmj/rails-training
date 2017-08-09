FactoryGirl.define do
  factory :product do
    sequence(:title) { |n| "Product #{n + 1}" }
    description 'This is a good shirt'
    image_url 'http://test.com/image.jpg'
    price 200.00
  end  
end