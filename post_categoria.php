<?php
global $post;
$tmp_post = $post;
if(!isset($_GET["id"]))
$categoria=9;
else
$categoria=$_GET["id"];
$args = array( 'numberposts' => 5, 'offset'=> 1, 'category' => $categoria,'orderby'=> 'post_date','order'=> 'ASC' );
$myposts = get_posts( $args );

//$xml_output = "<xml version='1.0' encoding='UTF-8'>";
$xml_output= "<post>";

foreach( $myposts as $post ) :	setup_postdata($post); 
		$imagem=wp_get_attachment_image_src( get_post_thumbnail_id($page->ID, 'thumbnail'));
		$xml_output.="<section  fotoprincipal=\"".$imagem[0]."\">";
		$xml_output.="<label><![CDATA[".$post->post_title."]]></label>";
		$xml_output.="<descricao><![CDATA[".$post->post_excerpt."]]></descricao>";
		$xml_output.="</section>";
		//print_r($cat);
endforeach; 
$xml_output.= "</post>";

echo $xml_output;
?>

