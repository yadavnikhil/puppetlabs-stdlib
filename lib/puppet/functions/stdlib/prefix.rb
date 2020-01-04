# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
#
# prefix.rb
#

# ---- original file header ----
#
# @summary
#   This function applies a prefix to all elements in an array or a hash.
#
#*Examples:*
#
#    prefix(['a','b','c'], 'p')
#
#Will return: ['pa','pb','pc']
#
#
Puppet::Functions.create_function(:'stdlib::prefix') do
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
    

    # Technically we support two arguments but only first is mandatory ...
    raise(Puppet::ParseError, "prefix(): Wrong number of arguments " +
      "given (#{arguments.size} for 1)") if arguments.size < 1

    enumerable = arguments[0]

    unless enumerable.is_a?(Array) or enumerable.is_a?(Hash)
      raise Puppet::ParseError, "prefix(): expected first argument to be an Array or a Hash, got #{enumerable.inspect}"
    end

    prefix = arguments[1] if arguments[1]

    if prefix
      unless prefix.is_a?(String)
        raise Puppet::ParseError, "prefix(): expected second argument to be a String, got #{prefix.inspect}"
      end
    end

    if enumerable.is_a?(Array)
      # Turn everything into string same as join would do ...
      result = enumerable.collect do |i|
        i = i.to_s
        prefix ? prefix + i : i
      end
    else
      result = Hash[enumerable.map do |k,v|
        k = k.to_s
        [ prefix ? prefix + k : k, v ]
      end]
    end

    return result
  
  end
end
