# Correct the WordPress include that causes Apache to return HTTP 500.
exec { 'fix-wordpress':
  command => "/bin/sed -i 's/class-wp-locale[.]phpp/class-wp-locale.php/' /var/www/html/wp-settings.php",
  onlyif  => "/bin/grep -qF 'class-wp-locale.phpp' /var/www/html/wp-settings.php",
}
