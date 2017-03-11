class User < ActiveRecord::Base
  # Remember to create a migration!
# include BCrypt

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
  	valid_user = User.find_by(email: email)
  	valid_user.password == password ? valid_user : nil
  end

end
