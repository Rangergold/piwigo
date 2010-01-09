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

define('PHPWG_ROOT_PATH', '../');
include_once( PHPWG_ROOT_PATH.'include/common.inc.php' );

$languages = array_keys(get_languages());

$page['ref_compare'] = 'en_UK';
$page['ref_default_values'] = 'en_UK';

$file_list = array('common', 'admin', 'install', 'upgrade');

$metalang = array();

// preload reference languages
$metalang[ $page['ref_compare'] ] = load_metalang($page['ref_compare'], $file_list);
$metalang[ $page['ref_default_values'] ] = load_metalang($page['ref_default_values'], $file_list);

foreach ($languages as $language)
{
  if (in_array($language, array($page['ref_compare'], $page['ref_default_values'])))
  {
    continue;
  }
  echo '<h2>'.$language.'</h2>';
  $metalang[$language] = load_metalang($language, $file_list);

  foreach ($file_list as $file)
  {
    $missing_keys = array_diff(
      array_keys($metalang[ $page['ref_compare'] ][$file]),
      array_keys($metalang[ $language ][$file])
      );

    $output = '';
    foreach ($missing_keys as $key)
    {
      $print_key = str_replace("'", '\\\'', $key);
      $print_value = str_replace("'", '\\\'', $metalang[ $page['ref_default_values'] ][$file][$key]);
      $output.= '$'."lang['".$print_key."'] = '".$print_value."';\n";
    }

    if ('' != $output)
    {
      echo '<h3>'.$file.'.lang.php</h3>';
      echo '<textarea style="width:100%;height:150px;">'.$output.'</textarea>';
    }
  }
}

function load_metalang($language, $file_list)
{
  global $lang;
  
  $metalang = array();
  foreach ($file_list as $file)
  {
    $lang = array();
    load_language($file.'.lang', '', array('language'=>$language));
    $metalang[$file] = $lang;
  }
  return $metalang;
}
?>