<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', 'root' );

/** MySQL hostname */
define( 'DB_HOST', 'wordpress-mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '*#WvMsXkj]|<5#3}<Wk}2]@U4R3|kX|094-a.p|4i&N-7Bm$h8w8<9Y$8(kmJtw!');
define('SECURE_AUTH_KEY',  'I3C:+*:?R&15hvBT{Ni[Ie};NqfNHRU5=-;MQ%:<_I4@+2Hr|37O/A/EJ&KwVd y');
define('LOGGED_IN_KEY',    'mysql_alpineL3w#|{0$k=wuT*.&<gD4P)7|MM<+tI$,z3WNf))6{]oKyeg8Ll+vo0*<P!.7I]=R');
define('NONCE_KEY',        'n |++y9L`rt6#TEgdl+h#GZ/9%8U0UgA5j|NP{M4^-2]gJ(${GD]U?E|}W/3TM`i');
define('AUTH_SALT',        '=>#h;:MWp[G=p$Yfc#9Z{j,oFakPAw&7-4:Ic7Wah#*>FdvH)*+kV^5vuIjgGoR#');
define('SECURE_AUTH_SALT', '2 qjJdbE~~QJ+a$1U!`Y@8iYXWm_f-Rm4#gwj>tlYX-r-rFr%.$P3[?nh3~dAcC5');
define('LOGGED_IN_SALT',   ':CDOfR2c65Y(lZN/nw6[,X7O>l&K^N(bHFP|yv.ebt^S%a?HqDxSkA.My@v.Da9d');
define('NONCE_SALT',       '>eZlbrD}|VL}5r:,<x]tBc5t|-~J1^? rAh5:#bcAc.:[}2F4#a{s/UoRktD>O,|');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
