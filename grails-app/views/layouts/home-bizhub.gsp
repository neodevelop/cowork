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
<body>
<div id="wrapper">

<!-- Begin Top Bar  -->
  <div id="top">
    <img src="${createLinkTo(dir:'themes/bizhub/images',file:'topbar.png')}" alt="head" usemap="#shapes" />
    <map name="shapes" id="shapes">
        <area coords="860,0,930,0,800,110,730,110" shape="poly" href="${createLink(controller:'reservation',action:'choose')}" title="Rectangle" alt="Rectangle"/>
    </map>
  </div>
  
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

<g:render template="/includes/nav"  />

<!-- Begin Content  -->
  <div id="content">
  
<g:layoutBody />

  </div>
<!-- End  Content  -->
</div>
<!-- End  Wrapper  -->
<g:render template="/includes/footer"  />

</body>
</html>
