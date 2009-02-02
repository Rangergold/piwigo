<?php
// +-----------------------------------------------------------------------+
// | Piwigo - a PHP based picture gallery                                  |
// +-----------------------------------------------------------------------+
// | Copyright(C) 2008-2009 Piwigo Team                  http://piwigo.org |
// | Copyright(C) 2003-2008 PhpWebGallery Team    http://phpwebgallery.net |
// | Copyright(C) 2002-2003 Pierrick LE GALL   http://le-gall.net/pierrick |
// +-----------------------------------------------------------------------+
// | This program is free software; you can redistribute it and/or modify  |
// | it under the terms of the GNU General Public License as published by  |
// | the Free Software Foundation                                          |
// |                                                                       |
// | This program is distributed in the hope that it will be useful, but   |
// | WITHOUT ANY WARRANTY; without even the implied warranty of            |
// | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU      |
// | General Public License for more details.                              |
// |                                                                       |
// | You should have received a copy of the GNU General Public License     |
// | along with this program; if not, write to the Free Software           |
// | Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, |
// | USA.                                                                  |
// +-----------------------------------------------------------------------+

$lang['Installation'] = 'Ugradba';
$lang['Initial_config'] = 'Osnovna postava';
$lang['Default_lang'] = 'Pretpostavljeni jezik galerije';
$lang['step1_title'] = 'Postava baze podataka';
$lang['step2_title'] = 'Upravna postava';
$lang['Start_Install'] = 'Pokreni ugradbu';
$lang['reg_err_mail_address'] = 'e-mail adresa mora biti kao xxx@yyy.eee (example : jere@stranica.org)';

$lang['install_webmaster'] = 'Webmaster-ova prijava';
$lang['install_webmaster_info'] = 'Biti �e prikazano posjetiteljima. Potrebno je za upravljanje web mjestom';

$lang['step1_confirmation'] = 'Postavke su ispravne';
$lang['step1_err_db'] = 'Povezivanje sa poslu�iteljem uspje�no, ali je nemogu�e povezivanje sa bazom podataka';
$lang['step1_err_server'] = 'Ne mogu se povezati sa poslu�iteljem';
$lang['step1_err_copy_2'] = 'Slijede�i korak ugradbe je omogu�en';
$lang['step1_err_copy_next'] = 'slijede�i korak';
$lang['step1_err_copy'] = 'Kopirajte ru�i�asti tekst izme�u crtica i prebacite ga u "include/mysql.inc.php"(Pozor : mysql.inc.php mora sadr�avati samo ru�i�asti tekst, bez znakova novog reda ili razmaka)';

$lang['step1_host'] = 'MySQL poslu�itelj';
$lang['step1_host_info'] = 'localhost, sql.multimania.com, toto.freesurf.fr';
$lang['step1_user'] = 'Korisnik';
$lang['step1_user_info'] = 'korisni�ko ime dobiveno od davatelja usluge smje�taja';
$lang['step1_pass'] = 'Zaporka';
$lang['step1_pass_info'] = 'korisni�ka zaporka dobivena od davatelja usluge smje�taja';
$lang['step1_database'] = 'Naziv baze podataka';
$lang['step1_database_info'] = 'tako�er dobivena od davatelja usluge smje�taja';
$lang['step1_prefix'] = 'Predznak tabela baze podataka';
$lang['step1_prefix_info'] = 'nazivi tabela baze podataka �e biti predzna�eni sa time (omogu�ava vam bolje upravljanje tabelama)';
$lang['step2_err_login1'] = 'upi�ite korisni�ko ime za webmaster-a';
$lang['step2_err_login3'] = 'webmaster-ovo korisni�ko ime ne mo�e sadr�avati znakove \' ili "';
$lang['step2_err_pass'] = 'molimo upi�ite zaporku ponovo';
$lang['install_end_title'] = 'Ugradba zavr�ena';
$lang['step2_pwd'] = 'Webmaster-ova zaporka';
$lang['step2_pwd_info'] = '�uvajte je na sigurnom mjestu, ona omogu�ava pristup upravnoj plo�i';
$lang['step2_pwd_conf'] = 'Zaporka [potvrdi]';
$lang['step2_pwd_conf_info'] = 'ovjera';
$lang['install_help'] = 'Trebate pomo�? Pitajte na <a href="%s">Piwigo message board</a>.';
$lang['install_end_message'] = 'Postava Piwigo-a je zavr�ena, slijede�i korak je<br /><br />
* idite na prijavnicu i koristite korisni�ko ime/zaporku danu za webmaster-a<br />
* ova prijava �e vam omogu�iti pristup upravnoj plo�i i uputama za pohranu slika u mape';
$lang['conf_mail_webmaster'] = 'Webmaster-ova e-mail adresa';
$lang['conf_mail_webmaster_info'] = 'Posjetitelji �e mo�i pisati upravitelju galerije preko ove adrese';
?>