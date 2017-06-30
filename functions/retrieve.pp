function share_data::retrieve (
  String $label,
) >> Array {
  $retrieve_query = [ "from", "resources",
    [ "and",
      [ "=", "type", "Notify" ],
      [ "=", "exported", true ],
      [ "=", [ "parameter", "tag" ], $label ],
    ],
  ]
  $retrieve_resources = puppetdb_query($retrieve_query).map |$value| {
    $value['parameters']['message']
  }
  $retrieve_resources
}
