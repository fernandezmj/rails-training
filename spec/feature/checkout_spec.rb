require 'rails_helper'

describe 'Checkout Process', type: :feature do
  describe 'Cart Page' do
    context 'when there is one product in the store' do
      let!(:product) {FactoryGirl.create(:product, title: 'TicketBase generic ticket')}
      before do
        visit '/'
        click_button 'Add Cart'  
      end
      it 'displays the product in the cart' do
        expect(page).to have_content 'TicketBase generic ticket' 
      end

      it 'dislplays the quantity of the product' do
        expect(page).to have_content '1 x'
      end

      it 'displays the total of the cart' do
        expect(page).to have_content 'P200.00'
      end

      # context 'and the user presses the Empty Cart button' do
      #   before do
      #     click_button 'Empty cart'
      #     page.driver.accept_js_confirms!
      #   end

      #   it 'empties the cart', js: true do
      #     expect(page).to have_content 'Cart was successfully emptied.'
      #   end
      # end
    end

    context 'when there are products in the store' do
      let!(:product) {FactoryGirl.create(:product, title: 'TicketBase generic ticket')}
      let!(:product2) {FactoryGirl.create(:product, id:123, title: 'TicketBase unique ticket')}
      before do
        visit '/'
        find_button(id: 'product123').click 
      end
      it 'displays the product in the cart' do
        expect(page).to have_content 'TicketBase unique ticket' 
      end       
    end
  end
end