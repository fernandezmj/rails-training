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