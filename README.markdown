## XmlSimple Puppet Functions

These Puppet functions will convert a hash into an XML string that can be
saved as the contents of a file.  There is also a function that will accept
an argument of a path to an XML document and return a native Hash. Hopefully
these are useful to some people out there.  Check out the `tests/` directory
for Puppet manifests demonstrating their usage:

## NOTE - REQUIRES 'xml-simple' GEM!

Do note, you need to install the 'xml-simple' gem with the following command:

    gem install xml-simple


### Converting an XML document to a Hash

    $xml = '/tmp/sample.xml'
    $hash_data = xml_to_hash($xml)

### Converting a Hash to an XML document

    $hash = {
      'logdir'        => '/var/log/foo/',
        'debugfile'     => '/tmp/foo.debug',
        'server'        => {
          'sahara'        => {
            'osversion'     => '2.6',
            'osname'        => 'solaris',
            'address'       => [ '10.0.0.101', '10.0.1.101' ]
          },
          'gobi'          => {
            'osversion'     => '6.5',
            'osname'        => 'irix',
            'address'       => [ '10.0.0.102' ]
          },
          'kalahari'      => {
            'osversion'     => '2.0.34',
            'osname'        => 'linux',
            'address'       => [ '10.0.0.103', '10.0.1.103' ]
          }
        }
    }

    $xml_data = hash_to_xml($hash)

    file { '/tmp/sample.xml':
      ensure  => file,
      content => $xml_data
    }

### The resultant output XML file:

    <opt logdir="/var/log/foo/" debugfile="/tmp/foo.debug">
      <server>
        <sahara osversion="2.6" osname="solaris">
          <address>10.0.0.101</address>
          <address>10.0.1.101</address>
        </sahara>
        <gobi osversion="6.5" osname="irix">
          <address>10.0.0.102</address>
        </gobi>
        <kalahari osversion="2.0.34" osname="linux">
          <address>10.0.0.103</address>
          <address>10.0.1.103</address>
        </kalahari>
      </server>
    </opt>
