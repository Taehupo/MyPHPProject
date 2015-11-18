<?php
	require_once('./application/libraries/smarty-3.1.27/libs/Smarty.class.php');
	$smarty = new Smarty();
	$smarty->caching = true;
	$smarty->cache_lifetime = 120;
	include('config.inc.php');
	$data=array();
	if(isset($_GET['page']))
	{
		$current_page = $_GET['page'];
		if(!isset($_PAGES[$current_page]))
			header('Location: https://thebest404pageever.com/');
	}
	else
		$current_page = '';
	$smarty->assign('data',$data);
	include('./application/modules/'.$_PAGES[$current_page].'.php');
	$smarty->display('application/views/layout.tpl');
?>