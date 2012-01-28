<?php
include('funcoes_novas.php');
$args = array(
	'status' => 'approve',
	'number' => '1',
	//'post_id' => 1, // use post_id, not post_ID
);
$comments = get_comments($args);

//$xml_output = "<xml version='1.0' encoding='UTF-8'>";
$xml_output= "<comentarios>";

foreach($comments as $comment) :
		$xml_output.="<section autor=\"".$comment->comment_author."\"  data=\"".convert_datat($comment->comment_date) ."\" >";
		$xml_output.="<conteudo>";
		$xml_output.="<![CDATA[".$comment->comment_content."]]>";
		$xml_output.="</conteudo>";
		$xml_output.="</section>";
		
endforeach;
$xml_output.= "</comentarios>";

echo $xml_output;
?>

