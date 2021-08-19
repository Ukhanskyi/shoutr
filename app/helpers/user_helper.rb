# frozen_string_literal: true

# User Helper module
module UserHelper
  def follow_button(user)
    if current_user.following?(user)
      button_to 'Unfollow', unfollow_user_path(user), method: :delete
    else
      button_to 'Follow', follow_user_path(user)
    end
  end

  def user_signed_in?
    if current_user.email.empty?
      link_to('Sign In', sign_in_path, class: 'nav-link active lead text-dark fw-normal') +
        link_to('Sign Up', sign_up_path, class: 'nav-link active lead text-dark fw-normal')
    else
      link_to('Sign Out', sign_out_path, method: :delete, class: 'nav-link active lead text-dark fw-normal')
    end
  end
end
