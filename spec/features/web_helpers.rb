def sign_in_and_play
  visit('/')
  fill_in 'p1_name', with: 'Mark'
  fill_in 'p2_name', with: 'The Beast'
  click_on 'submit'
end
