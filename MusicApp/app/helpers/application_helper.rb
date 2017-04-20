module ApplicationHelper

  def auth_token
    '<input type="hidden"
      name="authenticity_token"
      value="#{form_authencitity_token}">'.html_safe
  end

  def email_password
    '<label for="email">Email: </label>
    <input id="email" type="text" name="user[email]">
    <label for="password">Password</label>
    <input id="password" type="password" name="user[password]">'.html_safe
  end

end
