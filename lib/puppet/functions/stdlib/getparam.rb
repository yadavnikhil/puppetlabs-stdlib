# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
# Test whether a given class or definition is defined
require 'puppet/parser/functions'

# ---- original file header ----
#
# @summary
#   Takes a resource reference and name of the parameter and
#returns value of resource's parameter.
#
#*Examples:*
#
#    define example_resource($param) {
#    }
#
#    example_resource { "example_resource_instance":
#        param => "param_value"
#    }
#
#    getparam(Example_resource["example_resource_instance"], "param")
#
#Would return: param_value
#
#
Puppet::Functions.create_function(:'stdlib::getparam') do
  # @param vals
  #   The original array of arguments. Port this to individually managed params
  #   to get the full benefit of the modern function API.
  #
  # @return [Data type]
  #   Describe what the function returns here
  #
  dispatch :default_impl do
    # Call the method named 'default_impl' when this is matched
    # Port this to match individual params for better type safety
    repeated_param 'Any', :vals
  end


  def default_impl(*vals)
    
  reference, param = vals
  raise(ArgumentError, 'Must specify a reference') unless reference
  raise(ArgumentError, 'Must specify name of a parameter') unless param and param.instance_of? String

  return '' if param.empty?

  if resource = findresource(reference.to_s)
    return resource[param] if resource[param]
  end

  return ''

  end
end
