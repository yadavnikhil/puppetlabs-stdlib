# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
#
# flatten.rb
#

# ---- original file header ----
#
# @summary
#   This function flattens any deeply nested arrays and returns a single flat array
#as a result.
#
#*Examples:*
#
#    flatten(['a', ['b', ['c']]])
#
#Would return: ['a','b','c']
#
#
Puppet::Functions.create_function(:'stdlib::flatten') do
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
    

    raise(Puppet::ParseError, "flatten(): Wrong number of arguments " +
      "given (#{arguments.size} for 1)") if arguments.size != 1

    array = arguments[0]

    unless array.is_a?(Array)
      raise(Puppet::ParseError, 'flatten(): Requires array to work with')
    end

    result = array.flatten

    return result
  
  end
end
