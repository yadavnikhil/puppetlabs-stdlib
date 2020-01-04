# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
#
# dig.rb
#

# ---- original file header ----
#
# @summary
#   Looks up into a complex structure of arrays and hashes and returns nil
#or the default value if nothing was found.
#
#Path is an array of keys to be looked up in data argument. The function
#will go down the structure and try to extract the required value.
#
#$data = {
#  'a' => {
#    'b' => [
#      'b1',
#      'b2',
#      'b3' ]}}
#
#$value = dig($data, ['a', 'b', '2'], 'not_found')
#=> $value = 'b3'
#
#a -> first hash key
#b -> second hash key
#2 -> array index starting with 0
#
#not_found -> (optional) will be returned if there is no value or the path
#did not match. Defaults to nil.
#
#In addition to the required "path" argument, "dig" accepts default
#argument. It will be returned if no value was found or a path component is
#missing. And the fourth argument can set a variable path separator.
#
#
Puppet::Functions.create_function(:'stdlib::dig') do
  # @param arguments
  #   The original array of arguments. Port this to individually managed params
  #   to get the full benefit of the modern function API.
  #
  # @return [Data type]
  #   Describe what the function returns here
  #
  dispatch :default_impl do
    # Call the method named 'default_impl' when this is matched
    # Port this to match individual params for better type safety
    repeated_param 'Any', :arguments
  end


  def default_impl(*arguments)
    
    # Two arguments are required
    raise(Puppet::ParseError, "dig(): Wrong number of arguments " +
                              "given (#{arguments.size} for at least 2)") if arguments.size < 2

    data, path, default = *arguments

    if !(data.is_a?(Hash) || data.is_a?(Array))
      raise(Puppet::ParseError, "dig(): first argument must be a hash or an array, " <<
                                "given #{data.class.name}")
    end

    unless path.is_a? Array
      raise(Puppet::ParseError, "dig(): second argument must be an array, " <<
                                "given #{path.class.name}")
    end

    value = path.reduce(data) { |h, k| (h.is_a?(Hash) || h.is_a?(Array)) ? h[k] : break }
    value.nil? ? default : value
  
  end
end
