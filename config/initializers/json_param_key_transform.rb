# See http://stackoverflow.com/questions/17240106/what-is-the-best-way-to-convert-all-controller-params-from-camelcase-to-snake-ca
# And parameter_parsers doc

# Transform JSON request param keys from JSON-conventional camelCase to
# Rails-conventional snake_case:
ActionDispatch::Request.parameter_parsers[:json] = lambda do |raw_post|
  # Modified from action_dispatch/http/parameters.rb
  data = ActiveSupport::JSON.decode(raw_post)

  data.is_a?(Hash) ? data.deep_transform_keys!(&:underscore) : { _json: data }
end
