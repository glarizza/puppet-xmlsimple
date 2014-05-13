require 'xmlsimple'

Puppet::Parser::Functions.newfunction(:hash_to_xml, :type => :rvalue, :doc =>
  "Function that converts a hash to an XML string") do |args|
  if args.length < 1 or args.length > 2
    raise Puppet::Error, "#hash_to_xml accepts only one (1) or two (2) arguments, you passed #{args.length}"
  end

  args.each do |arg|
    if arg.class != Hash
      raise Puppet::Error, "#hash_to_xml requires a hash for argument, you passed a #{arg.class}"
    end
  end

  if args.length == 1
    XmlSimple.xml_out(args[0])
  else
    XmlSimple.xml_out(args[0],args[1])
  end
end
