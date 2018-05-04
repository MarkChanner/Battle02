feature 'display results' do
  scenario 'winner and loser displayed when HP reaches zero' do
    sign_in_and_play
    18.times { one_turn }
    click_on 'Attack'
    expect(page).to have_content('Mark Wins!')
  end
end
