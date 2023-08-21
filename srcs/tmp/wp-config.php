<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'yichinos' );

/** Database password */
define( 'DB_PASSWORD', 'user42' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'W&_U00@iBm]sDX4C0CD39%]}Z0/8Al.]:j^*3jh~||~}JWi_>c:6?j%$HmsM)_cq' );
define( 'SECURE_AUTH_KEY',   '#K74<DAD:h~|5mn@LvaNh$Jk$+]Ny$w9PWH+W*XUsw1(t{(mgL|AjU~ysPH|YHro' );
define( 'LOGGED_IN_KEY',     'SM?oDPgyn(O(d_C7|$Iv4 %0]s_vUY[[gplN82R#PJ)2.8H>*Q%|L_t_py7Gw2VU' );
define( 'NONCE_KEY',         ' Pg{{P[d-[5Cb/nM+7L+Pg~|5u4jua9HdDNr;Oi)q]./A4?P83)((ua~83/eG;4|' );
define( 'AUTH_SALT',         '1FE<<}y$/>V,=7~]0a^D?<=~vn)yQ;l{X%7oBi:Vi29<gXnon#UtCGS)YLke}elU' );
define( 'SECURE_AUTH_SALT',  '*C#<n!o7AjfGA-6?HpW{l_Tj}l7CWeXQ)|V{%DOflj&z{W@8(%FL%xm_4urk/_{y' );
define( 'LOGGED_IN_SALT',    'eo.Oe#q9AmUF|~}Hy66J`X]d.Y6563|f1j7@^=TOD|.Gh2.&4n%nO~c#L=APaD~/' );
define( 'NONCE_SALT',        '}sl#C(Wz2cHn[*=#MRwG_Cm{[u.]q`=k^9Pd=#NX~c}r85*S?L Nf};v%!&[pFsN' );
define( 'WP_CACHE_KEY_SALT', 'b>K3-/h**g0s4?m/WP*yK;.cZ`gn1N3jzsb?}?%llyU0(WgRYmWO2hm~1fn?6x:Q' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



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
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
