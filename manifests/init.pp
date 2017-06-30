define share_data (
  String $label,
  $data = $title,
) {
  @@notify { "${title}":
    message  => $data,
    loglevel => 'debug',
    tag      => $label,
  }
}
