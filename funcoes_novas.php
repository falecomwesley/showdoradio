<?php

	function convert_data($data,$tipo='')
	{
		if($tipo=='pt')
		{
			//2011-07-27
			$dia=substr($data,8,2);
			$mes=substr($data,5,2);
			$ano=substr($data,0,4);
			return $dia."/".$mes."/".$ano;
		}
		else
		{
			//27/07/2011
			$dia=substr($data,0,2);
			$mes=substr($data,3,2);
			$ano=substr($data,6,4);
			return $ano."-".$mes."-".$dia;
		}
	
	}
	
	function convert_datat($data)
	{
 
			//2011-07-27
			$dia=substr($data,8,2);
			$mes=substr($data,5,2);
			$ano=substr($data,0,4);
			return $dia."/".$mes."/".$ano.substr($data,10);
		 
	}

?>