require 'xmlsimple'

Puppet::Parser::Functions.newfunction(:xml_to_hash, :type => :rvalue, :doc =>
  "Function to convert an xml file into a hash") do |args|

  if args.length < 1 or args.length > 2
    raise Puppet::Error, "#xml_to_hash accepts only one(1) or two(2) arguments, you passed #{args.length}"
  end

  if args[0].class != String
    raise Puppet::Error, "#xml_to_hash accepts a String first argument (path to a file to parse), you passed a #{args[0].class}"
  end
  if args.length > 1 and args[1].class != Hash
    raise Puppet::Error, "#xml_to_hash accepts a hash second argument (options), you passed a #{args[0].class}"
  end

  unless (File.file?(args[0]) or File.readable?(args[0]))
    raise Puppet::Error, "#xml_to_hash cannot read the file #{args[0]}"
  end

  if args.length == 1
    XmlSimple.xml_in(args[0])
  else
    XmlSimple.xml_in(args[0], args[1])
  end
end
