$xml = '/tmp/sample.xml'

$opts = { 'keeproot' => true,}

$hash_data = xml_to_hash($xml)
$hash_data2 = xml_to_hash($xml,$opts)

notify {"Hash: ${hash_data}": }
notify {"Hash with opts: ${hash_data2}": }
