#!/bin/bash
HOME_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/..
source "$HOME_DIR"/CONSTANTS.sh

docker exec "$WORDPRESS_CONTAINER" sh -c "sed -i '/WP_HOME/d' wp-config.php"
docker exec "$WORDPRESS_CONTAINER" sh -c "sed -i '/WP_SITEURL/d' wp-config.php"

read -erp "Expose Url: " expose_url
if [[ -z "$expose_url" ]]; then
      echo "No url set. Defaulting to localhost..."
      expose_url=http://localhost:8000
fi

docker exec "$WORDPRESS_CONTAINER" sh -c "echo \"define( 'WP_HOME', '$expose_url' );\" >> wp-config.php"
docker exec "$WORDPRESS_CONTAINER" sh -c "echo \"define( 'WP_SITEURL', '$expose_url' );\" >> wp-config.php"

if [[ $IS_INITIALIZING -ne 1 ]]; then
      docker exec -i "$DB_CONTAINER" mysql -u "$DB_USER" --password="$DB_PASSWORD" "$DB_NAME" -e "UPDATE wp_options SET option_value = '$expose_url' WHERE option_name = 'siteurl' OR option_name = 'home'"
fi
