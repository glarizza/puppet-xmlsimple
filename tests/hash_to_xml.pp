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
