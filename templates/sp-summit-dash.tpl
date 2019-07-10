<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">
    <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>RAH Infotech | Security And Performance Summit</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    
    <!-- Favicons
    ================================================== -->
    <link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="img/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css"  href="../css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../fonts/font-awesome/css/font-awesome.css">

    <!-- Slider
    ================================================== -->
    <link href="../css/owl.carousel.css" rel="stylesheet" media="screen">
    <link href="../css/owl.theme.css" rel="stylesheet" media="screen">

    <!-- Stylesheet
    ================================================== -->
    <link rel="stylesheet" type="text/css"  href="../css/style-blue.css">
    <link rel="stylesheet" type="text/css" href="../css/responsive.css">

    <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,700,300,600,800,400' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>

    <script>
      new WOW().init();
    </script>

    <script type="text/javascript" src="../js/modernizr.custom.js"></script>


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <!-- Navigation
    ==========================================-->
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
            <li><a href="/#tf-home" class="page-scroll">Home</a></li>
            <li><a href="/#tf-about" class="page-scroll">Company</a></li>
            <li><a href="/#tf-services" class="page-scroll">Solutions</a></li>
            <li><a href="/#tf-works" class="page-scroll">Products</a></li>
            <li><a href="/services" class="page-scroll">Services</a></li>
            <li><a href="/support" class="page-scroll">Support</a></li>
            <li><a href="/career" class="page-scroll">Career</a></li>
            <!-- <li><a href="/#tf-contact" class="page-scroll">Contact Us</a></li> -->
            <li><a href="/contact" class="page-scroll">Contact Us</a></li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>

    <!-- Home Page
    ==========================================-->
    <!-- <div id="media-home" class="text-center" style="background: url(img/product_banners/actifio.jpg);background-size: cover;background-position: center;background-attachment: fixed;background-repeat: no-repeat;color: #cfcfcf; height: 350px;">
        <div class="overlay">
            <div class="content-1 wow fadeIn" data-wow-duration="3s">
                <h1 style="color: #fff;"><strong>Actifio</strong></h1>
            </div>
        </div>
    </div> -->

    <!-- <div id="product-home" class="text-center" style="background: url(img/product_banners/actifio.jpg);background-size: cover;background-position: center;background-attachment: fixed;background-repeat: no-repeat;color: #cfcfcf;">
        <div class="overlay">
            <div class="content wow fadeIn" data-wow-duration="3s">
                <h1><strong>Actifio</strong></h1>
                <a href="#product-about" class="fa fa-angle-down page-scroll"></a>
            </div>
        </div>
    </div> -->

    <!-- About Us Page
    ==========================================-->
    <div id="product-about">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="about-text">

                        <h3>Security And Performance Summit 2019 Participants</h3>

                        <br><br>
                        
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Organization</th>
                                    <th>Designation</th>
                                </tr>
                            </thead>
                            <tbody>
                                % for x in data:
                                    <tr>
                                        <td>{{x['name']}}</td>
                                        <td>{{x['email']}}</td>
                                        <td>{{x['phone']}}</td>
                                        <td>{{x['org_name']}}</td>
                                        <td>{{x['org_desig']}}</td>
                                    </tr>
                                % end
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>

    
    
    

    <!-- <nav id="footer">
        <div class="container">
            <div class="pull-left fnav">
                <p>ALL RIGHTS RESERVED. COPYRIGHT © 2019. Designed & Developed by <a href="https://www.opencubelabs.com" target="_blank">Opencube Labs</a></p>

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
    </nav> -->


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.1.11.1.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/SmoothScroll.js"></script>
    <script type="text/javascript" src="js/jquery.isotope.js"></script>

    <script src="js/owl.carousel.js"></script>

    <!-- Javascripts
    ================================================== -->
    <script type="text/javascript" src="js/main.js"></script>

  </body>
</html>