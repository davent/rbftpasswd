module Rbftpasswd
  VERSION = '0.0.1'

  @file

  def Rbftpasswd.generate_password( passwd )

    o =  [('a'..'z'),('A'..'Z'),(0...9)].map{|i| i.to_a}.flatten;
    salt  =  '$1$' + (0..8).map{ o[rand(o.length)]  }.join;

    return passwd.crypt( salt )
  end

  def Rbftpasswd.new_user( file, username, passwd, uid, gid, home, shell )

    sanatize_username( username )

    @file = file

    hash = generate_password( passwd )
    line = "#{username}:#{hash}:#{uid}:#{gid}::#{home}:#{shell}"

    unless File.exists?( file )
	raise "File does not exist: #{file}"
    end

    if user_exists?( username )
      raise "User already exists"
    end

    File.open(file, 'a') do |f|
      f.puts line
    end

  end

  def Rbftpasswd.user_exists?( username )
    File.open(@file, 'r') do |f|
      f.each do |line|
        if line =~ /^#{username}\:/
          return true
        end
      end
    end

    return false
  end

  def Rbftpasswd.sanatize_username( username )
    if username =~ /[^a-z@\.\_]/i
      raise "Invalid username"
    end
  end

end
