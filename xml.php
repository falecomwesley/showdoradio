<?php
$args = array(
	'type'                     => 'post',
	'child_of'                 => 0,
	'parent'                   => '',
	'orderby'                  => 'id',
	'order'                    => 'ASC',
	'hide_empty'               => 0,
	'hierarchical'             => 1,
	'number'                   => '');

$categorias=get_categories($args);
//print_r($categorias);
//$xml_output = "<xml version='1.0' encoding='UTF-8'>";
$xml_output= "<sections>";

foreach ($categorias as $cat) {
		if ($cat->parent > 0) { continue; }
		//$xml_output.="<section label=\"".$cat->name."\" tag=\"".$cat->slug."\" file=\"wp-content\\themes\\showdoradio\\bin\\".$cat->slug.".swf\"/>";

		$xml_output.="<section label=\"".$cat->name."\" tag=\"".$cat->slug."\" file=\"".$cat->slug.".swf\"/>";
		//print_r($cat);
	}
$xml_output.= "</sections>";

echo $xml_output;
?>

