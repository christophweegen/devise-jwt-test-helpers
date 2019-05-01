module DeviseJwtTestHelpers
  module RequestHelpers
    def jwt_for(user)
      Warden::JWTAuth::UserEncoder.new.call(user, nil, nil).first
    end

    def jwt_for!(user)
      params = { email: user.email,
                 password: user.password }.to_json
      headers = { "Content-Type" => "application/json" }
      post user_session_path, params: params, headers: headers
      response.headers["Authorization"].split(" ")[1]
    end

    def auth_headers(jwt)
      json_headers.merge("Authorization" => "Bearer #{jwt}")
    end

    def auth_headers!(user)
      jwt = jwt_for!(user)
      auth_headers(jwt)
    end

    def revoke_jwt(jwt)
      Warden::JWTAuth::TokenRevoker.new.call(jwt)
    end

    def auth_get(user, path, **options)
      opt = authenticated_options(user, options)
      get(path, opt)
    end

    def auth_post(user, path, **options)
      opt = authenticated_options(user, options)
      post(path, opt)
    end

    private

    def json_headers
      { "Accept" => "application/json", "Content-Type" => "application/json" }
    end

    def authenticated_options(user, **options)
      authenticated_headers = options[:jwt] ? auth_headers(options[:jwt]) : auth_headers!(user)
      options[:headers].merge(authenticated_headers)
    end
  end
end
