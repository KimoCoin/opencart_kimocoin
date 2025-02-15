<!--
Copyright (c) 2013 John Atkinson (jga)
*/
-->

<?php if(!$error) { ?>
	<div class="buttons">
		<div class="right"><a id="button-pay" class="button"><span><?php echo $button_kimocoin_pay; ?></span></a></div>
	</div>
<?php } else { ?>
	<div class="warning">
		<?php echo $error_msg; ?>
	</div>
<?php } ?>
<script type="text/javascript"><!--
if (typeof colorbox == 'undefined') {
	var e = document.createElement('script');
	e.src = 'catalog/view/javascript/jquery/colorbox/jquery.colorbox.js';
	e.type = "text/javascript";
	document.getElementsByTagName("head")[0].appendChild(e);
	e = document.createElement('link');
	e.rel = "stylesheet";
	e.type = "text/css";
	e.href = "catalog/view/javascript/jquery/colorbox/colorbox.css";
	e.media = "screen"
	document.getElementsByTagName("head")[0].appendChild(e);
}
var countdown;
clearInterval(countdown);
countdown = 0;

var timeleft = <?php echo $kimocoin_countdown_timer; ?>;
var checker = 0;
var expired_countdown_content = '<div style="font-size:16px; padding:6px; text-align:center;"><?php echo $text_countdown_expired ?></div>';
function timer () {			
	timeleft = timeleft -1;
	if(timeleft <= 0)
	{
		clearInterval(countdown);
		countdown = 0;
		document.getElementById("cboxLoadedContent").innerHTML = expired_countdown_content;
		clearInterval(checker);
		checker = 0;
	}
	var minutes = Math.floor(timeleft/60);
	var seconds = timeleft%60;
	var seconds_string = "0" + seconds;
	seconds_string = seconds_string.substr(seconds_string.length - 2)
	document.getElementById("timer").innerHTML = minutes + ":" + seconds_string;
}
countdown = setInterval(timer, 1000);
$('#button-pay').on('click', function() {
	if(timeleft > 0) {
		html  = '<div id="payment-wrapper" style="position:relative;">';
		html += '	<div id="payment-left" style="float:left; margin-top:20px;">';
		html += '		<div style="font-size:16px; padding:6px; text-align:center;"><?php echo $text_please_send ?> <span style="font-size:18px; border-style:solid; border-width: 1px; border-radius:3px; padding-top:3px; padding-right:6px; padding-left:6px; padding-bottom:3px;"><?php echo $kimocoin_total; ?></span> <?php echo $text_kmc_to ?> </div>';
		html += '		<div style="font-size:16px; padding:6px; text-align:center;"><span style="font-size:18px; border-style:solid; border-width: 1px; border-radius:3px; padding-top:3px; padding-right:6px; padding-left:6px; padding-bottom:3px;"><?php echo $kimocoin_send_address; ?></span></div>';
		html += '		<div style="font-size:16px; padding:6px; text-align:center;"> <?php echo $text_to_complete ?></div>';
		html += '		<div style="font-size:16px; padding:6px; text-align:center;"><a style="font-size: 16px;" href="kimocoin:<?php echo $kimocoin_send_address; ?>?amount=<?php echo $kimocoin_total; ?>"><?php echo $text_click_pay ?></a> <?php echo $text_uri_compatible ?></div>';
		html += '	</div>';
		html += '<div id="payment-right" style="float: right;"><img src="http://chart.apis.google.com/chart?cht=qr&chl=kimocoin:<?php echo $kimocoin_send_address; ?>?amount=<?php echo $kimocoin_total; ?>&chs=160x160"></div></div>';
		html += '<div class="buttons" style="clear: both; margin-bottom:6px; margin-top:12px;">';
		html += '	<div class="center" style="font-size: 16px;"><?php echo $text_pre_timer ?><span id="timer" style="font-size:18px; font-weight:bold;"></span><?php echo $text_post_timer ?></div>';
		html += '</div>';
		html += '<div class="buttons" style="clear: both; margin-bottom:6px; margin-top:12px;">';
		html += '	<div class="center"><a id="button-confirm"><span><?php echo $text_click_here ?></span></a> <?php echo $text_if_not_redirect ?></div>';
		html += '</div>';
	}
	else {
		html  = expired_countdown_content;
	}
	$.colorbox({
		overlayClose: true,
		opacity: 0.5,
		width: '650px',
		height: '375px',
		href: false,
		html: html,
		onComplete: function() {
			checker = setInterval(kimocoin_check, 5000);
			$('#button-confirm').on('click', function() {
				$.ajax({ 
					type: 'GET',
					url: 'index.php?route=payment/kimocoin/confirm_sent',
					timeout: 5000,
					dataType: 'text',
					error: function() {
						document.getElementById("cboxLoadedContent").innerHTML = document.getElementById("cboxLoadedContent").innerHTML + '<div class="warning"><?php echo $error_confirm; ?></div>';
					},
					success: function(received) {
						if(received != "1") {
							document.getElementById("cboxLoadedContent").innerHTML = document.getElementById("cboxLoadedContent").innerHTML + '<div class="warning"><?php echo $error_incomplete_pay; ?></div>';
						}
						else {
							location.href = 'index.php?route=checkout/success';
						}
					}	
				});
			});
			function kimocoin_check () {
				if(timeleft > 0) {
					$.ajax({ 
						type: 'GET',
						url: 'index.php?route=payment/kimocoin/confirm_sent',
						timeout: 5000,
						dataType: 'text',
						error: function() {
							document.getElementById("cboxLoadedContent").innerHTML = document.getElementById("cboxLoadedContent").innerHTML + '<div class="warning"><?php echo $error_confirm; ?></div>';
						},
						success: function(received) {
							if(received == "1") {
								location.href = 'index.php?route=checkout/success';
							}
						}		
					});
				}
			}
		},
		onCleanup: function() {
			clearInterval(checker);
			checker = 0;
		}
	});
});
//--></script> 


