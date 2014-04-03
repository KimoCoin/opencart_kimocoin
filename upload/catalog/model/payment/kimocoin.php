<?php 
/*
Copyright (c) 2013 John Atkinson (jga)
*/

class ModelPaymentKimoCoin extends Model {
  	public function getMethod($address) {
		$this->load->language('payment/kimocoin');
		
		if ($this->config->get('kimocoin_status')) {
        	$status = TRUE;
		} else {
			$status = FALSE;
		}
		
		$method_data = array();
	
		if ($status) {  
      		$method_data = array( 
        		'code'         	=> 'kimocoin',
        		'title'      	=> $this->language->get('text_title'),
				'sort_order' 	=> $this->config->get('kimocoin_sort_order'),
      		);
    	}
   
    	return $method_data;
  	}
}
?>
