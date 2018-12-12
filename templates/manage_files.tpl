<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">
    <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>RAH Infotech | Dashboard</title>
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
    <script type="text/javascript" src="js/jquery.1.11.1.js"></script>

    <script type="text/javascript">
        $(document).ready(function(){
            $('#sub-btn').click(function(){
                var username = document.getElementById('username').value;
                var pwd = document.getElementById('pwd').value;
                
                $('#err-msg').css('display', 'none')

                if(username == 'admin' && pwd == 'start@123'){
                    window.location = '/dash'
                }else{
                    $('#err-msg').css('display', 'block')
                }
            })
        })
    </script>


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
                        <center><h2>Manage <strong>Files</strong></h2></center>
                        <div class="line">
                            <!-- <hr> -->
                        </div>
                        <div class="clearfix"></div>

                        <div class="row text-center">
                            
                            <div class="col-md-12" style="margin-top: 15px;">
                                <table class="table table-striped">
                                    <thead>
                                      <tr>
                                        <th>Name</th>
                                        <th>Uploaded On</th>
                                        <th>View</th>
                                        <th>Delete</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                        % for file in res:
                                            <tr>
                                                <td>{{file['name']}}</td>
                                                <td>{{file['time_stamp']}}</td>
                                                <td><a target="_blank" href="{{file['link']}}">View</a></td>
                                                <td><a href="/delete_file?id={{file['_id']['$oid']}}">Delete</a></td>
                                            </tr>
                                        % end
                                    </tbody>
                                </table>
                            </div>

                            <div class="col-md-12" style="margin-top: 15px;">
                                <a href="/add_file">
                                    <button class="btn btn-primary"><i class="fa fa-plus"></i> Add File</button>
                                </a>
                            </div>

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