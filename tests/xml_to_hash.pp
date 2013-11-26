$xml = '/tmp/sample.xml'

$hash_data = xml_to_hash($xml)

notify {"Hash: ${hash_data}": }
