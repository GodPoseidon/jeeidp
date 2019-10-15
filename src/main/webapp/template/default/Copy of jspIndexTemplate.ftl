<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/_common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="积木科技后台管理" />
	<meta name="author" content="" />

	<title>积木科技后台管理</title>

	<link rel="stylesheet" href="${'$'}{res}/neon/js/jquery-ui/css/no-theme/jquery-ui-1.10.3.custom.min.css">
	<link rel="stylesheet" href="${'$'}{res}/neon/css/font-icons/entypo/css/entypo.css">
	<link rel="stylesheet" href="${'$'}{res}/neon/css/bootstrap.css">
	<link rel="stylesheet" href="${'$'}{res}/neon/css/neon-core.css">
	<link rel="stylesheet" href="${'$'}{res}/neon/css/neon-theme.css">
	<link rel="stylesheet" href="${'$'}{res}/neon/css/neon-forms.css">
	<link rel="stylesheet" href="${'$'}{res}/neon/css/custom.css">


	<script src="${'$'}{res}/neon/js/jquery-1.11.3.js"></script>

	<style>
	em{ color:#C00;}
	span.error{color:#C00;}
	</style>  

</head>
<body class="page-body  page-fade">



	<div class="page-container"><!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->
	
	<div class="sidebar-menu">

		<div class="sidebar-menu-inner">
			
			<header class="logo-env">

				<!-- logo -->
				<div class="logo">
					<%-- <a href="index.html">
						<img src="${'$'}{res}/neon/images/logo@2x.png" width="120" alt="" />
					</a> --%>
					<h1><b style="color:#fff;">积木科技</b></h1>
				</div>

				<!-- logo collapse icon -->
				<div class="sidebar-collapse">
					<a href="#" class="sidebar-collapse-icon"><!-- add class "with-animation" if you want sidebar to have animation during expanding/collapsing transition -->
						<i class="entypo-menu"></i>
					</a>
				</div>

								
				<!-- open/close menu icon (do not remove if you want to enable menu on mobile devices) -->
				<div class="sidebar-mobile-menu visible-xs">
					<a href="#" class="with-animation"><!-- add class "with-animation" to support animation -->
						<i class="entypo-menu"></i>
					</a>
				</div>

			</header>
			
									
			<ul id="main-menu" class="main-menu">
				<!-- add class "multiple-expanded" to allow multiple submenus to open -->
				<!-- class "auto-inherit-active-class" will automatically add "active" class for parent elements who are marked already with class "active" -->
				<li class="active opened active">
					<a href="index.html">
						<i class="entypo-gauge"></i>
						<span class="title">数据管理</span>
					</a>
					<ul>
						<#list tableList as table>
						<li>
							<a href="javascript:void(0);" onClick="menu('${'$'}{ctx}/admin/${table.className?uncap_first}/search');">
								<span class="title">${table.tableComment}</span>
							</a>
						</li>	
						</#list>		
					</ul>
				</li>
	
				
			</ul>
			
		</div>

	</div>

	<div class="main-content">
				
		<div class="row">
		
			<!-- Profile Info and Notifications -->
			<div class="col-md-6 col-sm-8 clearfix">
		
				<ul class="user-info pull-left pull-none-xsm">
		
					<!-- Profile Info -->
					<li class="profile-info dropdown"><!-- add class "pull-right" if you want to place this from right -->
		
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<img src="${'$'}{res}/neon/images/thumb-1@2x.png" alt="" class="img-circle" width="44" />
							John Henderson
						</a>
		
						<ul class="dropdown-menu">
		
							<!-- Reverse Caret -->
							<li class="caret"></li>
		
							<!-- Profile sub-links -->
							<li>
								<a href="extra-timeline.html">
									<i class="entypo-user"></i>
									Edit Profile
								</a>
							</li>
		
							<li>
								<a href="mailbox.html">
									<i class="entypo-mail"></i>
									Inbox
								</a>
							</li>
		
							<li>
								<a href="extra-calendar.html">
									<i class="entypo-calendar"></i>
									Calendar
								</a>
							</li>
		
							<li>
								<a href="#">
									<i class="entypo-clipboard"></i>
									Tasks
								</a>
							</li>
						</ul>
					</li>
		
				</ul>
				
				<ul class="user-info pull-left pull-right-xs pull-none-xsm">
		
					<!-- Raw Notifications -->
					<li class="notifications dropdown">
		
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
							<i class="entypo-attention"></i>
							<span class="badge badge-info">6</span>
						</a>
		
						<ul class="dropdown-menu">
							<li class="top">
								<p class="small">
									<a href="#" class="pull-right">Mark all Read</a>
									You have <strong>3</strong> new notifications.
								</p>
							</li>
							
							<li>
								<ul class="dropdown-menu-list scroller">
									<li class="unread notification-success">
										<a href="#">
											<i class="entypo-user-add pull-right"></i>
											
											<span class="line">
												<strong>New user registered</strong>
											</span>
											
											<span class="line small">
												30 seconds ago
											</span>
										</a>
									</li>
									
									<li class="unread notification-secondary">
										<a href="#">
											<i class="entypo-heart pull-right"></i>
											
											<span class="line">
												<strong>Someone special liked this</strong>
											</span>
											
											<span class="line small">
												2 minutes ago
											</span>
										</a>
									</li>
									
									<li class="notification-primary">
										<a href="#">
											<i class="entypo-user pull-right"></i>
											
											<span class="line">
												<strong>Privacy settings have been changed</strong>
											</span>
											
											<span class="line small">
												3 hours ago
											</span>
										</a>
									</li>
									
									<li class="notification-danger">
										<a href="#">
											<i class="entypo-cancel-circled pull-right"></i>
											
											<span class="line">
												John cancelled the event
											</span>
											
											<span class="line small">
												9 hours ago
											</span>
										</a>
									</li>
									
									<li class="notification-info">
										<a href="#">
											<i class="entypo-info pull-right"></i>
											
											<span class="line">
												The server is status is stable
											</span>
											
											<span class="line small">
												yesterday at 10:30am
											</span>
										</a>
									</li>
									
									<li class="notification-warning">
										<a href="#">
											<i class="entypo-rss pull-right"></i>
											
											<span class="line">
												New comments waiting approval
											</span>
											
											<span class="line small">
												last week
											</span>
										</a>
									</li>
								</ul>
							</li>
							
							<li class="external">
								<a href="#">View all notifications</a>
							</li>
						</ul>
		
					</li>
		
					<!-- Message Notifications -->
					<li class="notifications dropdown">
		
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
							<i class="entypo-mail"></i>
							<span class="badge badge-secondary">10</span>
						</a>
		
						<ul class="dropdown-menu">
							<li>
								<form class="top-dropdown-search">
									
									<div class="form-group">
										<input type="text" class="form-control" placeholder="Search anything..." name="s" />
									</div>
									
								</form>
								
								<ul class="dropdown-menu-list scroller">
									<li class="active">
										<a href="#">
											<span class="image pull-right">
												<img src="${'$'}{res}/neon/images/thumb-1.png" alt="" class="img-circle" />
											</span>
											
											<span class="line">
												<strong>Luc Chartier</strong>
												- yesterday
											</span>
											
											<span class="line desc small">
												This ain’t our first item, it is the best of the rest.
											</span>
										</a>
									</li>
									
									<li class="active">
										<a href="#">
											<span class="image pull-right">
												<img src="${'$'}{res}/neon/images/thumb-1.png" alt="" class="img-circle" />
											</span>
											
											<span class="line">
												<strong>Salma Nyberg</strong>
												- 2 days ago
											</span>
											
											<span class="line desc small">
												Oh he decisively impression attachment friendship so if everything. 
											</span>
										</a>
									</li>
									
									<li>
										<a href="#">
											<span class="image pull-right">
												<img src="${'$'}{res}/neon/images/thumb-1.png" alt="" class="img-circle" />
											</span>
											
											<span class="line">
												Hayden Cartwright
												- a week ago
											</span>
											
											<span class="line desc small">
												Whose her enjoy chief new young. Felicity if ye required likewise so doubtful.
											</span>
										</a>
									</li>
									
									<li>
										<a href="#">
											<span class="image pull-right">
												<img src="${'$'}{res}/neon/images/thumb-1.png" alt="" class="img-circle" />
											</span>
											
											<span class="line">
												Sandra Eberhardt
												- 16 days ago
											</span>
											
											<span class="line desc small">
												On so attention necessary at by provision otherwise existence direction.
											</span>
										</a>
									</li>
								</ul>
							</li>
							
							<li class="external">
								<a href="mailbox.html">All Messages</a>
							</li>
						</ul>
		
					</li>
		
					<!-- Task Notifications -->
					<li class="notifications dropdown">
		
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
							<i class="entypo-list"></i>
							<span class="badge badge-warning">1</span>
						</a>
		
						<ul class="dropdown-menu">
							<li class="top">
								<p>You have 6 pending tasks</p>
							</li>
							
							<li>
								<ul class="dropdown-menu-list scroller">
									<li>
										<a href="#">
											<span class="task">
												<span class="desc">Procurement</span>
												<span class="percent">27%</span>
											</span>
										
											<span class="progress">
												<span style="width: 27%;" class="progress-bar progress-bar-success">
													<span class="sr-only">27% Complete</span>
												</span>
											</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="task">
												<span class="desc">App Development</span>
												<span class="percent">83%</span>
											</span>
											
											<span class="progress progress-striped">
												<span style="width: 83%;" class="progress-bar progress-bar-danger">
													<span class="sr-only">83% Complete</span>
												</span>
											</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="task">
												<span class="desc">HTML Slicing</span>
												<span class="percent">91%</span>
											</span>
											
											<span class="progress">
												<span style="width: 91%;" class="progress-bar progress-bar-success">
													<span class="sr-only">91% Complete</span>
												</span>
											</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="task">
												<span class="desc">Database Repair</span>
												<span class="percent">12%</span>
											</span>
											
											<span class="progress progress-striped">
												<span style="width: 12%;" class="progress-bar progress-bar-warning">
													<span class="sr-only">12% Complete</span>
												</span>
											</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="task">
												<span class="desc">Backup Create Progress</span>
												<span class="percent">54%</span>
											</span>
											
											<span class="progress progress-striped">
												<span style="width: 54%;" class="progress-bar progress-bar-info">
													<span class="sr-only">54% Complete</span>
												</span>
											</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="task">
												<span class="desc">Upgrade Progress</span>
												<span class="percent">17%</span>
											</span>
											
											<span class="progress progress-striped">
												<span style="width: 17%;" class="progress-bar progress-bar-important">
													<span class="sr-only">17% Complete</span>
												</span>
											</span>
										</a>
									</li>
								</ul>
							</li>
							
							<li class="external">
								<a href="#">See all tasks</a>
							</li>
						</ul>
		
					</li>
		
				</ul>
		
			</div>
		
		
			<!-- Raw Links -->
			<div class="col-md-6 col-sm-4 clearfix hidden-xs">
		
				<ul class="list-inline links-list pull-right">
		
					<!-- Language Selector -->
					<li class="dropdown language-selector">
		
						Language: &nbsp;
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-close-others="true">
							<img src="${'$'}{res}/neon/images/flag-uk.png" />
						</a>
		
						<ul class="dropdown-menu pull-right">
							<li>
								<a href="#">
									<img src="${'$'}{res}/neon/images/flag-de.png" />
									<span>Deutsch</span>
								</a>
							</li>
							<li class="active">
								<a href="#">
									<img src="${'$'}{res}/neon/images/flag-uk.png" />
									<span>English</span>
								</a>
							</li>
							<li>
								<a href="#">
									<img src="${'$'}{res}/neon/images/flag-fr.png" />
									<span>François</span>
								</a>
							</li>
							<li>
								<a href="#">
									<img src="${'$'}{res}/neon/images/flag-al.png" />
									<span>Shqip</span>
								</a>
							</li>
							<li>
								<a href="#">
									<img src="${'$'}{res}/neon/images/flag-es.png" />
									<span>Español</span>
								</a>
							</li>
						</ul>
		
					</li>
		
					<li class="sep"></li>
		
					
					<li>
						<a href="#" data-toggle="chat" data-collapse-sidebar="1">
							<i class="entypo-chat"></i>
							Chat
		
							<span class="badge badge-success chat-notifications-badge is-hidden">0</span>
						</a>
					</li>
		
					<li class="sep"></li>
		
					<li>
						<a href="extra-login.html">
							Log Out <i class="entypo-logout right"></i>
						</a>
					</li>
				</ul>
		
			</div>
		
		</div>
		
		<hr />
		
		
		<div class="row content-panel">
			awefe
		</div>
	
		<!-- Footer -->
		<footer class="main">    
			
			&copy; 2016 <strong>deram</strong> Admin Theme by <a href="http://laborator.co" target="_blank">Laborator</a>
		
		</footer>
	</div>

</div>


	<!-- Imported styles on this page -->
	<link rel="stylesheet" href="${'$'}{res}/neon/js/jvectormap/jquery-jvectormap-1.2.2.css">
	<link rel="stylesheet" href="${'$'}{res}/neon/js/rickshaw/rickshaw.min.css">

	<!-- Bottom scripts (common) -->
	<script src="${'$'}{res}/neon/js/gsap/main-gsap.js"></script>
	<script src="${'$'}{res}/neon/js/jquery-ui/js/jquery-ui-1.10.3.minimal.min.js"></script>
	<script src="${'$'}{res}/neon/js/bootstrap.js"></script>
	<script src="${'$'}{res}/neon/js/joinable.js"></script>
	<script src="${'$'}{res}/neon/js/resizeable.js"></script>
	<script src="${'$'}{res}/neon/js/neon-api.js"></script>
	<script src="${'$'}{res}/neon/js/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>


	<!-- Imported scripts on this page -->
	<script src="${'$'}{res}/neon/js/jvectormap/jquery-jvectormap-europe-merc-en.js"></script>
	<script src="${'$'}{res}/neon/js/jquery.sparkline.min.js"></script>
	<script src="${'$'}{res}/neon/js/rickshaw/vendor/d3.v3.js"></script>
	<script src="${'$'}{res}/neon/js/rickshaw/rickshaw.min.js"></script>
	<script src="${'$'}{res}/neon/js/raphael-min.js"></script>
	<script src="${'$'}{res}/neon/js/morris.min.js"></script>
	<script src="${'$'}{res}/neon/js/toastr.js"></script>
	<script src="${'$'}{res}/neon/js/neon-chat.js"></script>
	
	<script src="${'$'}{res}/neon/js/jquery.validate.js"></script>
	<script src="${'$'}{res}/neon/js/common/common.js"></script>
	
	<!-- JavaScripts initializations and stuff -->
	<script src="${'$'}{res}/neon/js/neon-custom.js"></script>

	<script>
	function menu(url){
		$.ajax({
			type: 'post',
			url: url,
			dataType: 'html',
			success: function(data){
				$('.content-panel').html(data);
			}
		});
	};
	function add(url){
		$.ajax({
			type: 'post',
			url: url,
			dataType: 'html',
			success: function(data){
				$('.panel-search').hide();
				$('.panel-content').html(data);
			}
		});
	};
	function update(url){
		$.ajax({
			type: 'post',
			url: url,
			dataType: 'html',
			success: function(data){
				$('.panel-search').hide();
				$('.panel-content').html(data);
			}
		});
	};
	function save(obj, url){
		$.ajax({
			type: 'post',
			url: url,
			data: obj.serialize(),
			dataType: 'json',
			success: function(data){
				if(data.code == GW.SUCCESS){
					alert("保存或修改成功！");
				}else{
					alert(data.message); 
				}
			}
		});
	};
	function del(url){
		$.ajax({
			type: 'post',
			url: url,
			dataType: 'json',
			success: function(data){
				if(data.code == GW.SUCCESS){
					alert("删除成功！");
					golist();
				}else{
					alert(data.message);
				}
			}
		});
	};
	function search(obj, url){
		$.ajax({
			type: 'post',
			url: url,
			data: obj.serialize(),
			dataType: 'html',
			success: function(data){
				$('.panel-content').html(data);
			}
		});
	};
	</script>
</body>
</html>