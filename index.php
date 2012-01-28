<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<style type="text/css">
body
{
margin:0;
padding:0;
background:#f1f1f1;
text-align:center;
}
</style>
<html lang="en"><head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title><?php
	/*
	 * Print the <title> tag based on what is being viewed.
	 */
	global $page, $paged;

	wp_title( '|', true, 'right' );

	// Add the blog name.
	bloginfo( 'name' );

	// Add the blog description for the home/front page.
	$site_description = get_bloginfo( 'description', 'display' );
	if ( $site_description && ( is_home() || is_front_page() ) )
		echo " | $site_description";

	// Add a page number if necessary:
	if ( $paged >= 2 || $page >= 2 )
		echo ' | ' . sprintf( __( 'Page %s', 'twentyten' ), max( $paged, $page ) );

	?></title>
	<link rel="profile" href="http://gmpg.org/xfn/11" />
<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>" />
    <meta name="author" content="Mozart Petter">
    <script src="<?php bloginfo("template_url"); ?>/bin/js/swfobject.js" type="text/javascript"></script>
    <script src="<?php bloginfo("template_url"); ?>/bin/js/swfaddress.js" type="text/javascript"></script>
</head>
<body>
	
	<div id="flashContent"></div>
	
	<script type="text/javascript">
	    swfobject.embedSWF("<?php bloginfo("template_url"); ?>/bin/index.swf", "flashContent", "960", "1400", "9.0.0");
    </script>
	
</body>
</html>
