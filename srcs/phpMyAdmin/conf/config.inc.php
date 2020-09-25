<?php
/* vim: set expandtab sw=4 ts=4 sts=4: */
/**
 * phpMyAdmin sample configuration, you can use it as base for
 * manual configuration. For easier setup you can use setup/
 *
 * All directives are explained in documentation in the doc/ folder
 * or at <http://docs.phpmyadmin.net/>.
 *
 * @package PhpMyAdmin
 */

/*
 * This is needed for cookie based authentication to encrypt password in
 * cookie
 */
$cfg['blowfish_secret'] = 'ycpofszZQUhItfrlk5dg,RsQMdgDmg2V'; /* YOU MUST FILL IN THIS FOR COOKIE AUTH! */

/*
 * Servers configuration
 */
// $i = 0;

/*
 * First server
 */
// $i++;
/* Authentication type */
//$cfg['Servers'][$i]['verbose'] = 'mysql wampserver';
//$cfg['Servers'][$i]['auth_type'] = 'cookie';
//$cfg['Servers'][$i]['auth_type'] = 'config';
$cfg['Servers'][$i]['user'] = 'wp_admin';
$cfg['Servers'][$i]['password'] = '1234';
/* Server parameters */
$cfg['Servers'][$i]['host'] = 'wordpress-mysql';
//$cfg['Servers'][$i]['connect_type'] = 'tcp';
$cfg['Servers'][$i]['compress'] = false;
/* Select mysql if your server does not have mysqli */
//$cfg['Servers'][$i]['extension'] = 'mysqli';
$cfg['Servers'][$i]['AllowNoPassword'] = false;



/*
 * phpMyAdmin configuration storage settings.
 */
 
// No warning on  pmadb tables
$cfg['PmaNoRelation_DisableWarning'] = true;


?>