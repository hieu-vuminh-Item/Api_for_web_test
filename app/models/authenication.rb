require 'bcrypt'

class Authenication

  $secret_key = Rails.application.secret_key_base
  $alg = 'HS256'

  def gen_token (user, pass)
    payload = { user: user, pass: pass }
    token = JWT.encode payload, $secret_key, $alg
    token
  end

  def authorized (token)
    decoed_token = JWT.decode token, $secret_key, true, { algorithm: $alg }
    data = decoed_token[0]
    a = Account.where(username: data["user"], password: data["pass"]).first
    a
  end
end