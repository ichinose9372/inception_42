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
define( 'AUTH_KEY',          '/~@8FPtK/=ucdMK5s}8L_~qC,9H!RgUR3e!!ggscI2:bi8?#@fzKXm;mEV0RRw5|' );
define( 'SECURE_AUTH_KEY',   ']}?A}pu.%o0e3Il:G/!2K$KGe}0%>vg5m>2yEWK&:#4VrSK@FiVUQ}[g?KmH|LXF' );
define( 'LOGGED_IN_KEY',     'uejmJF}k$EmNnPoy#FjE1giRLSUhRY_xnp&tO7Z*_TCwgW-zJ[e:ZKGs$a@7)vXi' );
define( 'NONCE_KEY',         'zf=x0u;s[iM1c 3>D55~8{c~oTO<ppU]dutZN`&%,0eBl0UX0QF.K:hA}xWWagx]' );
define( 'AUTH_SALT',         ',GL;nu.]Uv{3S(:h~wkT:3+d!TjZz,m4LV.*n3[@`3+e#!(>ShmbcGo[pIsIzcIj' );
define( 'SECURE_AUTH_SALT',  'O&0iEi3vepMW&pt!$0_u,yuiq&1jb|.C`f(Zc>;WOe|W*T|A52i~+Orx5FWb^#+v' );
define( 'LOGGED_IN_SALT',    '/E_3X@?Me*+$gIN_68pQhTR@(R!dSgno;}j6# r#aI&L .A$@[i/R-+0NYCxiz<2' );
define( 'NONCE_SALT',        'N<m+lU_Q&vCC~(*o0-vhhr!gMng%cR4<J!K7xN*+}p>,rAyl7UPS8 PXv^6TnV7$' );
define( 'WP_CACHE_KEY_SALT', '*w4+,-WT#Bd@?ui8;{ 9kL)l[#RMEL>Gh{tcklFXM3B0cw&GS,iedm?U:(^#3& /' );


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
