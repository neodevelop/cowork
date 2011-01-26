<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><g:layoutTitle default="CoWork" /></title>
<g:javascript library="jquery" plugin="jquery"/>

<!-- CSS Sheet  --> 
<link rel="stylesheet" href="${createLinkTo(dir: 'themes/bizhub/css', file: 'style.css')}"/>

<!-- Sliding Gallery Navigation  -->
	
	<script type="text/javascript" src="${createLinkTo(dir: 'themes/bizhub/js', file: 'easySlider1.5.js')}"></script>
	
	<script type="text/javascript">
		$(document).ready(function(){	
			$("#slider").easySlider({
				auto: true,
				continuous: true 
			});
		});	
	</script>
    
<!-- Floating Menu jQuery  --> 

<link rel="stylesheet" href="${createLinkTo(dir: 'themes/bizhub/css', file: 'floatingmenu.css')}"/>

<script type="text/javascript" src="${createLinkTo(dir: 'themes/bizhub/js', file: 'jquery.easing.1.3.js')}"></script>
	<script>
	
	$(document).ready(function () {

		//get the default top value
		var top_val = $('#menu li a').css('top');

		//animate the selected menu item
		$('#menu li.selected').children('a').stop().animate({top:0}, {easing: 'easeOutQuad', duration:500});		

		$('#menu li').hover(
			function () {
				
				//animate the menu item with 0 top value
				$(this).children('a').stop().animate({top:0}, {easing: 'easeOutQuad', duration:500});		
			},
			function () {

				//set the position to default
				$(this).children('a').stop().animate({top:top_val}, {easing: 'easeOutQuad', duration:500});		

				//always keep the previously selected item in fixed position			
				$('#menu li.selected').children('a').stop().animate({top:0}, {easing: 'easeOutQuad', duration:500});		
			}		
		);
	
	});
	
	</script>
	
	<g:layoutHead />

</head>

<div id="wrapper">

<!-- Begin Top Bar  -->
  <div id="top"></div>
  
<!-- End Top Bar  --> 

<!-- Begin Header  -->
  <div id="header">
    <div id="slider">
      <ul>
        <li><a href="#"><img src="${createLinkTo(dir: 'themes/bizhub/images', file: 'h1.jpg')}" alt="" border="0" /></a></li>
        <li><a href="#"><img src="${createLinkTo(dir: 'themes/bizhub/images', file: 'h2.jpg')}" alt="" border="0" /></a></li>
        <li><a href="#"><img src="${createLinkTo(dir: 'themes/bizhub/images', file: 'h3.jpg')}" alt="" border="0" /></a></li>
      </ul>
    </div>
  </div>
<!-- End Header  -->

<!-- Begin Floating Navigation  -->
  <div id="nav"><ul id="menu">
	<li class="home selected"><a href="index.html" class="home">Item 1</a></li>
    <li class="aboutus"><a href="aboutus.html" class="aboutus">Item 2</a></li>
	<li class="services"><a href="services.html" class="services">Item 3</a></li>
    <li class="finance"><a href="finance.html" class="finance">Item 4</a></li>
    <li class="support"><a href="support.html" class="support">Item 5</a></li>
    <li class="contact"><a href="contact.html" class="contact">Item 6</a></li>
</ul></div>
<!-- End Floating Navigation  -->

<!-- Begin Content  -->
  <div id="content">
  
<g:layoutBody />

  </div>
<!-- End  Content  -->
</div>
<!-- End  Wrapper  -->

<!-- Begin Footer One  -->
<div id="footer"><div id="bottomcontent">
    <div id="b1">
      <h3> More About Us</h3>
        Vestibulum molestie, urna lobortis fringilla hendrerit, purus eros malesuadue tellus. Sem sapien vel felis. Aliquam vulputate rutrum lorem. Suspendisse potenti. Mauris placerat leo sit amet tortor. Nunc eu massa. Nulla vitae ipsum. Etiam </div>
    <div id="b3">
      <h3>Looking for us?</h3>
        <span class="lightbluetext">BizHub Corporation</span><br />
        3020 Bellows Ct. Michael,<br />
        CA 92616 USA
        <br />
    <span class="lightbluetext">P</span> +1800 88 8888<br />
        <span class="lightbluetext">F</span> +1800 99 9999<br />
        <a href="mailto:info@bizhub.net">info@bizhub.net</a></div>
    <div id="b2">
      <h3>What We Do</h3>
      <ul>
        <li><a href="#">Vestibulum molestie, urna lobortis.</a></li>
        <li><a href="#">Fringilla hendrerit, purus eros.</a></li>
        <li><a href="#">Malesuadue tellus sem sapien vel felis.</a></li>
        <li> <a href="#">Aliquam vulputate rutrum lorem.</a></li>
        <li><a href="#">Suspendisse potenti mauris placerat.</a></li>
      </ul>
    </div>

  </div></div>
<!-- End Footer One  -->

<!-- Begin Footer Two  -->
<div id="footer2">
  <div id="bottomcontent2">
  <div style="width:300px; float:left;">Copyright &copy;  BizHub. All rights reserved.</div>
  <div style="width:90px; float:right;"><img src="${createLinkTo(dir: 'themes/bizhub/images', file: 'twitter.gif')}" alt="" width="32" height="33" align="middle" class="leftimg" /><a href="#">Twitter</a></div>
  <div style="width:100px; float:right;"><img src="${createLinkTo(dir: 'themes/bizhub/images', file: 'linkedin.gif')}" alt="" width="32" height="33" align="middle" class="leftimg" /><a href="#">LinkedIn</a></div>
  <div style="width:110px; float:right;"><img src="${createLinkTo(dir: 'themes/bizhub/images', file: 'facebook.gif')}" alt="" width="30" height="33" align="middle" class="leftimg" /><a href="#">Facebook</a></div></div>
</div>
<!-- End Footer Two  -->
</body>
</html>
