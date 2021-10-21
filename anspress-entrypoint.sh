#!/bin/bash
if ! wp core is-installed; then
	# wp config set DB_NAME $WORDPRESS_DB_NAME
	# wp config set DB_USER $WORDPRESS_DB_USER
	# wp config set DB_PASSWORD $WORDPRESS_DB_PASSWORD
	# wp config set DB_HOST $WORDPRESS_DB_HOST

	wp core install --url="${ANSPRESS_SITE_URL}" --title="${ANSPRESS_SITE_TITLE}" --admin_user="${ANSPRESS_DEFAULT_USER_EMAIL}" --admin_password="${ANSPRESS_DEFAULT_USER_PASSWORD}" --admin_email="${ANSPRESS_DEFAULT_USER_EMAIL}"

	wp plugin install anspress-question-answer --activate
fi

exec "$@"