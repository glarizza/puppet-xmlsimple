require 'xmlsimple'

Puppet::Parser::Functions.newfunction(:hash_to_xml, :type => :rvalue, :doc =>
  "Function that converts a hash to an XML string") do |args|
  if args.length != 1
    raise Puppet::Error, "#hash_to_xml accepts only one argument, you passed #{args.length}"
  end

  if args[0].class != Hash
    raise Puppet::Error, "#hash_to_xml accepts a hash argument, you passed a #{args[0].class}"
  end

  XmlSimple.xml_out(args[0])
end
