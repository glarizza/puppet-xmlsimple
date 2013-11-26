require 'xmlsimple'

Puppet::Parser::Functions.newfunction(:xml_to_hash, :type => :rvalue, :doc =>
  "Function to convert an xml file into a hash") do |args|

  if args.length != 1
    raise Puppet::Error, "#xml_to_hash accepts only one argument, you passed #{args.length}"
  end

  if args[0].class != String
    raise Puppet::Error, "#xml_to_hash accepts a String argument (path to a file to parse), you passed a #{args[0].class}"
  end

  unless (File.file?(args[0]) or File.readable?(args[0]))
    raise Puppet::Error, "#xml_to_hash cannot read the file #{args[0]}"
  end

  XmlSimple.xml_in(args[0])
end
