module DeviseJwtTestHelpers
  module RevocationStrategies
    module Whitelist
      def jwt_for(user)
        Warden::JWTAuth::UserEncoder.new.call(user, nil, nil).first
      end

      def jwt_for!(user)
        params = { email:    user.email,
                   password: user.password }.to_json
        headers = { "Content-Type" => "application/json" }
        post user_session_path, params: params, headers: headers
        response.headers["Authorization"].split(' ')[1]
      end

      def auth_headers(jwt)
        headers = { "Content-Type" => "application/json" }
        headers.merge("Authorization" => "Bearer #{jwt}")
      end

      def auth_headers!(user)
        headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
        jwt = jwt_for!(user)
        headers.merge("Authorization" => "Bearer #{jwt}")
      end

      def revoke_jwt(jwt)
        Warden::JWTAuth::TokenRevoker.new.call(jwt)
      end
    end
  end
end
