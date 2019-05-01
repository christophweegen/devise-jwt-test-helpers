module DeviseJwtTestHelpers
  module GraphqlHelpers
    def gql(**options)
      post DeviseJwtTestHelpers::Constants::GRAPHQL_ENDPOINT, options
    end

    def auth_gql(user, **options)
      auth_post user, graphql_endpoint, options
    end

    def graphql_endpoint
      DeviseJwtTestHelpers::Constants::GRAPHQL_ENDPOINT
    end
  end
end
