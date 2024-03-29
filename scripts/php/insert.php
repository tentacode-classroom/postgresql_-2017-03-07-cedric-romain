<?php

$connection = new \PDO(
    'pgsql:host=localhost;port=5432;dbname=gitevents',
    'super_admin',
    '12345'
);

$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

function addJsons(array $buffer)
{
    global $connection;

    $values = implode('), (', array_fill(0, count($buffer), '?'));

    $sql = "INSERT INTO events_raw(data_json) VALUES (".$values.")";

    $statement = $connection->prepare($sql);
    $statement->execute($buffer);
}

$jsonFilePath = sprintf('%s/../../data.json', __DIR__);

$handle = fopen($jsonFilePath, 'r');

$maxLinePerBatch = 10000;
$buffer = [];
while (false !== $line = fgets($handle)) {
    $buffer[] = $line;
    if (count($buffer) >= $maxLinePerBatch) {
        addJsons($buffer);
        $buffer = [];
    }
}

if (!empty($buffer)) {
    addJsons($buffer);
}

$sql = "select data_json->'type' from events_raw limit 10;";
$i=1;
foreach ($connection->query($sql) as $row) {
	print $i . ") ";
	print $row[0] . "\n";
	$i++;
}
