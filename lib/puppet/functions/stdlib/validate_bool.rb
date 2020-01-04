# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----

# ---- original file header ----
#
# @summary
#       Validate that all passed values are either true or false. Abort catalog
#    compilation if any value fails this check.
#
#    The following values will pass:
#
#        $iamtrue = true
#        validate_bool(true)
#        validate_bool(true, true, false, $iamtrue)
#
#    The following values will fail, causing compilation to abort:
#
#        $some_array = [ true ]
#        validate_bool("false")
#        validate_bool("true")
#        validate_bool($some_array)
#
#
#
Puppet::Functions.create_function(:'stdlib::validate_bool') do
  # @param args
  #   The original array of arguments. Port this to individually managed params
  #   to get the full benefit of the modern function API.
  #
  # @return [Data type]
  #   Describe what the function returns here
  #
  dispatch :default_impl do
    # Call the method named 'default_impl' when this is matched
    # Port this to match individual params for better type safety
    repeated_param 'Any', :args
  end


  def default_impl(*args)
    

    unless args.length > 0 then
      raise Puppet::ParseError, ("validate_bool(): wrong number of arguments (#{args.length}; must be > 0)")
    end

    args.each do |arg|
      unless function_is_bool([arg])
        raise Puppet::ParseError, ("#{arg.inspect} is not a boolean.  It looks to be a #{arg.class}")
      end
    end

  
  end
end
