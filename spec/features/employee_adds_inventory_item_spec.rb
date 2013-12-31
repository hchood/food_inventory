require 'spec_helper'

feature 'Adds inventory item' do

  # As a food service employee
  # I want to * add * inventory
  # So that it can be recorded that we have food items

  # Acceptance Criteria:

  # I must specify a title, description, and quantity of the food item
  # If I do not specify the required information, I am prompted to fix errors and to resubmit
  # If I specify the required information, my inventory entry is recorded.

  it 'creates a valid inventory item' do
    item = FactoryGirl.build(:inventory)

    visit '/inventories/new'

    fill_in 'Title', with: item.title
    fill_in 'Description', with: item.description
    fill_in 'Quantity', with: item.quantity
    click_on 'Submit'

    expect(Inventory.all.count).to eq 1
    expect(page).to have_content 'Inventory successfully submitted.'
  end

  it 'prompts user to fix errors if enters invalid item' do
    visit '/inventories/new'
    click_on 'Submit'

    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Description can't be blank"
    expect(page).to have_content "Quantity can't be blank"
  end

end
