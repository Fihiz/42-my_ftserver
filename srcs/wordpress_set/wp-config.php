<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d’installation. Vous n’avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en « wp-config.php » et remplir les
 * valeurs.
 *
 * Ce fichier contient les réglages de configuration suivants :
 *
 * Réglages MySQL
 * Préfixe de table
 * Clés secrètes
 * Langue utilisée
 * ABSPATH
 *
 * @link https://fr.wordpress.org/support/article/editing-wp-config-php/.
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME', 'wordpress' );

/** Utilisateur de la base de données MySQL. */
define( 'DB_USER', 'wordpress' );

/** Mot de passe de la base de données MySQL. */
define( 'DB_PASSWORD', 'mon_password' );

/** Adresse de l’hébergement MySQL. */
define( 'DB_HOST', 'localhost' );

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/**
 * Type de collation de la base de données.
 * N’y touchez que si vous savez ce que vous faites.
 */
define( 'DB_COLLATE', '' );

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clés secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n’importe quel moment, afin d’invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         ':WD~6dq(@Rz.>(,s!WKVs{g(J-U(Lk=aUc_7/EVRgT0,d7}RVLfB%bt3Fu/RW#)v' );
define( 'SECURE_AUTH_KEY',  '#%lBV^hS%!9WD-^%X1g*JKt+j+#&Ztr|A}Clw/pGN3yKyR~yX92p.&C*l{~ORd5;' );
define( 'LOGGED_IN_KEY',    '@nopqD&Z@@ofQbCJJJn/ Ok}H:[n{)g Xo10+CoAhM]TV^6R??~-o.jlCS~t0`sx' );
define( 'NONCE_KEY',        '4:r&Hky7Nh(`~qF/0-]hx53pZX$8fh nXy]UF@{7 iCmbSZ(jP937Tr||+>tnvcl' );
define( 'AUTH_SALT',        'J|+f&v_g0W_.VQIfake3z2Zx`e! r6oa&-@=}W$f] pL~rjr8g4oZ#2<!Rc:;%ya' );
define( 'SECURE_AUTH_SALT', 'a5V.Y0y.-5y_YCndM*R|OYq(L:UNO13FL4NFyW&B~w85v>KV?L6$/8tkgWi ]vV7' );
define( 'LOGGED_IN_SALT',   '$!WsYHt{;XTy^>r|MoSDt68E+0-n6<j)^>dnVk:/~NUIG` ONmH[uP}+RZP.Fb/)' );
define( 'NONCE_SALT',       'HJ5shzY<xI7o^ShH$/sGmMj=,-ae<oYzRCKo.:HCzX&ay;.|hi73O!.G9T8+.R}y' );
/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix = 'wp_';

/**
 * Pour les développeurs : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l’affichage des
 * notifications d’erreurs pendant vos essais.
 * Il est fortemment recommandé que les développeurs d’extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour plus d’information sur les autres constantes qui peuvent être utilisées
 * pour le déboguage, rendez-vous sur le Codex.
 *
 * @link https://fr.wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* C’est tout, ne touchez pas à ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( ! defined( 'ABSPATH' ) )
  define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once( ABSPATH . 'wp-settings.php' );