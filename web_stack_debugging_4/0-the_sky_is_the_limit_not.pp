# Raise the Nginx file-descriptor limit and restart the lab service.
exec { 'raise-nginx-open-file-limit':
  command => '/bin/sed -i \'s/^[[:space:]]*ULIMIT="-n 15"[[:space:]]*$/ULIMIT="-n 4096"/\' /etc/default/nginx',
  onlyif  => '/bin/grep -qE \'^[[:space:]]*ULIMIT="-n 15"[[:space:]]*$\' /etc/default/nginx',
  notify  => Exec['restart-nginx'],
}

exec { 'restart-nginx':
  command     => '/usr/sbin/service nginx restart',
  refreshonly => true,
}
