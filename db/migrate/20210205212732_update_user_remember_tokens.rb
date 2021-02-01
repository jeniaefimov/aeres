class UpdateUserRememberTokens < ActiveRecord::Migration[6.1]
  User = Class.new(ActiveRecord::Base)
  def change
    users = User.where(remember_token: nil)

    users.find_each |user| do
      user.update(remember_token: Clearance::Token.new)
    end
  end
end
