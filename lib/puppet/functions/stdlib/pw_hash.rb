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
#   Hashes a password using the crypt function. Provides a hash
#  usable on most POSIX systems.
#
#  The first argument to this function is the password to hash. If it is
#  undef or an empty string, this function returns undef.
#
#  The second argument to this function is which type of hash to use. It
#  will be converted into the appropriate crypt(3) hash specifier. Valid
#  hash types are:
#
#  |Hash type            |Specifier|
#  |---------------------|---------|
#  |MD5                  |1        |
#  |SHA-256              |5        |
#  |SHA-512 (recommended)|6        |
#
#  The third argument to this function is the salt to use.
#
#  Note: this uses the Puppet Master's implementation of crypt(3). If your
#  environment contains several different operating systems, ensure that they
#  are compatible before using this function.
#
Puppet::Functions.create_function(:'stdlib::pw_hash') do
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
    
    raise ArgumentError, "pw_hash(): wrong number of arguments (#{args.size} for 3)" if args.size != 3
    raise ArgumentError, "pw_hash(): first argument must be a string" unless args[0].is_a? String or args[0].nil?
    raise ArgumentError, "pw_hash(): second argument must be a string" unless args[1].is_a? String
    hashes = { 'md5'     => '1',
               'sha-256' => '5',
               'sha-512' => '6' }
    hash_type = hashes[args[1].downcase]
    raise ArgumentError, "pw_hash(): #{args[1]} is not a valid hash type" if hash_type.nil?
    raise ArgumentError, "pw_hash(): third argument must be a string" unless args[2].is_a? String
    raise ArgumentError, "pw_hash(): third argument must not be empty" if args[2].empty?
    raise ArgumentError, "pw_hash(): characters in salt must be in the set [a-zA-Z0-9./]" unless args[2].match(/\A[a-zA-Z0-9.\/]+\z/)

    password = args[0]
    return nil if password.nil? or password.empty?

    salt = "$#{hash_type}$#{args[2]}"

    # handle weak implementations of String#crypt
    if 'test'.crypt('$1$1') != '$1$1$Bp8CU9Oujr9SSEw53WV6G.'
      # JRuby < 1.7.17
      if RUBY_PLATFORM == 'java'
        # puppetserver bundles Apache Commons Codec
        org.apache.commons.codec.digest.Crypt.crypt(password.to_java_bytes, salt)
      else
        # MS Windows and other systems that don't support enhanced salts
        raise Puppet::ParseError, 'system does not support enhanced salts'
      end
    else
      password.crypt(salt)
    end

  end
end
