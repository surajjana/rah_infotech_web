<!DOCTYPE html>
<html>
<head>
	<title>Test</title>

	<!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">
    <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>RAH Infotech | Create Message</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    
    <!-- Favicons
    ================================================== -->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="img/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css"  href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome/css/font-awesome.css">

    <!-- Slider
    ================================================== -->
    <link href="css/owl.carousel.css" rel="stylesheet" media="screen">
    <link href="css/owl.theme.css" rel="stylesheet" media="screen">

    <!-- Stylesheet
    ================================================== -->
    <link rel="stylesheet" type="text/css"  href="css/style-blue.css">
    <link rel="stylesheet" type="text/css" href="css/responsive.css">

    <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,700,300,600,800,400' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>

    <script>
      new WOW().init();
    </script>

    <script type="text/javascript" src="js/modernizr.custom.js"></script>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="//code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

	<link rel="stylesheet" type="text/css"  href="css/bootstrap.css">
	<link rel="stylesheet" href="css/tokenize2.css">

	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="js/tokenize2.js"></script>
	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

	
</head>
<body>

	<nav id="tf-menu" class="navbar navbar-default navbar-fixed-top on">
      <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/">
              <img src="img/rah_logo.png" style="width: 70%;">
          </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="/dash" class="page-scroll">Dash Home</a></li>
            <li><a href="/events" class="page-scroll">Events</a></li>
            <li><a href="/media" class="page-scroll">Media</a></li>
            <li><a href="/login" class="page-scroll">Logout</a></li>
          </ul>
        </div><!-- /.navbar-collapse -->

        
      </div><!-- /.container-fluid -->
    </nav>

    <div id="product-about">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    
                    <div class="section-title center">
                        <center><h2>New <strong>Message</strong></h2></center>
                        <div class="line">
                            <!-- <hr> -->
                        </div>
                        <div class="clearfix"></div>

                        <div class="row">
                            <div class="col-md-3"></div>
                            <div class="col-md-6" style="padding: 25px;">
                                
                                
                                <div class="form-group">
                                    <label style="font-size: 1.2em; font-weight: bold;">Subject</label>
                                    <input type="text" id="subject" name="subject" class="form-control" placeholder="Subject">
                                </div>
                                <div class="form-group">
					              <label for="msg">Message</label>
					              <textarea class="form-control" rows="5" id="msg" maxlength="300">Enter message here...</textarea>
					            </div> 

                                <p style="font-size: 1.2em; font-weight: bold;">Recipients</p>
                                <div class="form-group">
                                	
                                	<select class="rec" multiple>
                                		% for emp in names:
                                            <option value="{{emp['_id']['$oid']}}">{{emp['name']}}</option>
                                        % end
										<!-- <option value="suraj@sertify.me">Suraj Jana</option>
										<option value="2">Audi</option>
										<option value="3">BMW</option>
										<option value="4">Cadillac</option>
										<option value="5">Chevrolet</option>
										<option value="6">Ferrari</option>
										<option value="7">Ford</option>
										<option value="8">Honda</option>
										<option value="9">Lexus</option>
										<option value="10">Mercedes-Benz</option> -->
									</select>
                                </div>

                                <p style="font-size: 1.2em; font-weight: bold;">Files</p>
                                <div class="form-group">
                                	
                                	<select class="files" multiple>
                                		% for file in files:
                                            <option value="{{file['_id']['$oid']}}">{{file['name']}}</option>
                                        % end
										<!-- <option value="suraj@sertify.me">Suraj Jana</option>
										<option value="2">Audi</option>
										<option value="3">BMW</option>
										<option value="4">Cadillac</option>
										<option value="5">Chevrolet</option>
										<option value="6">Ferrari</option>
										<option value="7">Ford</option>
										<option value="8">Honda</option>
										<option value="9">Lexus</option>
										<option value="10">Mercedes-Benz</option> -->
									</select>
                                </div>

                                <button id="btn" class="btn btn-primary" onclick="test_it()">Submit</button>
                                
                            </div>
                            <div class="col-md-3"></div>

                        </div>
                                   
                    </div>
                       
                </div>
            </div>
        </div>
    </div>


    <nav id="footer">
        <div class="container">
            <div class="pull-left fnav">
                <p>ALL RIGHTS RESERVED. COPYRIGHT © 2018. Designed & Developed by <a href="https://www.opencubelabs.com" target="_blank">Opencube Labs</a></p>

                <a target="_blank" href="/ewaste">E-Waste Collection Centers</a>
            </div>
            <div class="pull-right fnav">
                <ul class="footer-social">
                    <li><a href="//facebook.com/rahinfotech"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="//twitter.com/rahinfotech"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="//linkedin.com/company/rah-infotech-pvt-ltd"><i class="fa fa-linkedin"></i></a></li>
                    <li><a href="//rahinfotech.wordpress.com"><i class="fa fa-wordpress"></i></a></li>
                </ul>
            </div>
        </div>
    </nav>


    
	

	<script type="text/javascript">
		$('.rec').tokenize2();
		$('.files').tokenize2();

		function test_it(){
			console.log($('select').val())
		}
	</script>

</body>
</html>