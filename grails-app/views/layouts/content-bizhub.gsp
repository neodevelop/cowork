<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>BizHub</title>

<!-- CSS Sheet  --> 
<link rel="stylesheet" href="${createLinkTo(dir: 'themes/bizhub/css', file: 'style.css')}"/>
    
<!-- Floating Menu jQuery  --> 

<link rel="stylesheet" href="${createLinkTo(dir: 'themes/bizhub/css', file: 'floatingmenu.css')}"/>
<link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'myMenu.css')}"/>

<g:javascript library="jquery" plugin="jquery"/>
<jqui:resources themeCss="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/themes/dark-hive/jquery-ui.css" />

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
<!-- End Header  -->
<g:set var="idMenu" value="${pageProperty(name:'page.topMenu')}"/>
<g:if test="${idMenu=='none'}">
</g:if>
<g:else>
  <g:render template="/includes/nav"  />
</g:else>


<!-- Begin Content  -->
  <div id="content">

<g:layoutBody />  

  </div>
<!-- End  Content  -->
</div>
<!-- End  Wrapper  -->
<g:render template="/includes/myMenu"/>
<g:render template="/includes/footer"  />
</body>
</html>
