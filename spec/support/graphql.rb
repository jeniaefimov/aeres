# frozen_string_literal: true

module GraphQLHelpers
  def execute_graphql(query, **args)
    AeresSchema.execute(
      query,
      **args
    )
  end
end
