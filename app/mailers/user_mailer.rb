class UserMailer < Devise::Mailer
  default from: 'andre@andre.srv.br'

  def reset_password_instructions(record, token, opts={})
    super
  end
end
