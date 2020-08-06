<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <link href="src/css/bootstrap.min.css" rel="stylesheet">
    <link href="src/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="src/css/Montserrat.css" rel="stylesheet">
    <link href="src/mycss/Home.css" rel="stylesheet">
  </head>
<body>

    <div class="navbar navbar-inverse navbar-top" id="navbarTop">
      <div class="container-fluid">

        <div class="navbar-header">
          <div class="navbar-brand">
              PROJECT MAD
              <!-- <span class="h4" style="color:#1A5276">Project</span>
              <span class="h4" style="color:#C0392B ">MAD</span> -->
          </div>
          <button="button" class="navbar-toggle btn-md" data-toggle="collapse" data-target="#navbarHome">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>    
        </div>

        <div class="collapse navbar-collapse" id="navbarHome">
          <ul class="nav navbar-nav">
            <li> <img src="src/mycss/images/logo-circular.png" alt="Project MAD Logo" title="Project MAD" width="35" height="35" style="margin-top:7px; "> </li> 
            <li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
            <li class="active"><a href="" ><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;HOME</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
			<li><a href="Registration.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;SIGN UP</a></li>
				<li class="dropdown"><a class="dropdown-toggle" type="button"
					data-toggle="dropdown"> <span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;SIGN IN&nbsp;
					<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="MemberLogin.jsp">Member</a></li>
						<li class="divider"></li>
						<li><a href="ManagementLogin.jsp">Management</a></li>		
					</ul>
				</li>
			</ul>
            
        </div>

      </div>
    </div>


    <div class="panel panel-default" id="panelRed"></div>

    <div class="panel panel-default">
    <div class="panel panel-body">
    <div class="row">
      <div class="col-lg-9">
        <div class="carousel slide" data-ride="carousel" id="carouselMAD">
          <ol class="carousel-indicators">
            <li data-target="#carouselMAD" data-slide-to="0" class="active"></li>
            <li data-target="#carouselMAD" data-slide-to="1"></li>
            <li data-target="#carouselMAD" data-slide-to="2"></li>
            <li data-target="#carouselMAD" data-slide-to="3"></li>
            <li data-target="#carouselMAD" data-slide-to="4"></li>
            <li data-target="#carouselMAD" data-slide-to="5"></li>
            <li data-target="#carouselMAD" data-slide-to="6"></li>
          </ol>
          <div class="carousel-inner" id="carouselMAD">
            <div class="item active">
              <img src="src/mycss/images/loginBack.jpg">
            </div>
            <div class="item">
              <img src="src/mycss/images/c2.jpg" class="img-responsive">
            </div>
            <div class="item">
              <img src="src/mycss/images/c3.jpg" class="img-responsive">
            </div>
            <div class="item">
              <img src="src/mycss/images/c4.jpg" class="img-responsive">
            </div>
            <div class="item">
              <img src="src/mycss/images/c5.jpg" class="img-responsive">
            </div>
            <div class="item">
              <img src="src/mycss/images/c6.jpg" class="img-responsive">
            </div>
            <div class="item">
              <img src="src/mycss/images/c7.jpg" class="img-responsive">
            </div>
            <a class="left carousel-control" href="#carouselMAD" data-slide="prev">
              <span class="glyphicon glyphicon-chevron-left"></span>
            </a>
            <a class="right carousel-control" href="#carouselMAD" data-slide="next">
              <span class="glyphicon glyphicon-chevron-right"></span>
            </a>
          </div>
        </div> 
      </div> 

      <div class="col-lg-3">
        <div class="panel panel-default">
          <div class="panel-body">
            <img src="src/mycss/images/left.jpg" class="img-responsive">
            <br>
          </div>
          <div class="panel-footer">
          <div class="row">
            <div class="col-lg-5">
              <a href="MemberLogin.jsp"><button class="btn btn-primary btn-md pull-left">
              <span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;Sign in</button></a>
            </div>
            <div class="col-lg-2"></div>
            <div class="col-lg-5">
              <a href="Home.jsp"><button class="btn btn-primary btn-md pull-right">
              <span class="glyphicon glyphicon-earphone"></span>&nbsp;&nbsp;&nbsp;Contact us</button></a>
            </div>
          </div> 
          </div>
        </div>     

        <br>
        <div class="panel panel-default" id="panelJoin">
          <div class="panel-body">
            <span class="h3">How can I help?</span><br><br>
            You can help us by joining our MAD community and participating in our monthly events!
            <br>
            <br>
            <div class="panel-footer text-center">
            <a href="https://docs.google.com/forms/d/e/1FAIpQLScEG4z3G2eF2Ywxkz-QAJO6E0VLtI6RsV8z8A0Ev6UdzAYA5g/viewform?c=0&w=1">
            <button class="btn btn-primary btn-md">
            <span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;Be a volunteer</button></a>
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
    </div>
  
    <div class="panel panel-default" id="panelRed"></div>

    <div class="container">

    <div class="container content-section text-center">
      <div class="row">
        <div class="col-lg-1"></div>
          <div class="col-lg-10">
              <h2 id="about">ABOUT PROJECT MAD</h2> <br>
              <p><h4>Project MAD (Murals and Doodles) gathers a bunch of like-minded artistic college students to paint the town red (and blue, and every color!). We aim to make art accessible to the common folk by putting it on display in public spaces like outside railway stations and on walls overseeing traffic.</h4>
              </p>
            <br>
          </div>
        <div class="col-lg-1"></div>
      </div>
    </div>

    <div class="container content-section text-center">
          <button class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp;&nbsp;Know more</button>
    </div>

    </div>

    <br>
    <br>

    <div class="panel panel-default" id="panelRed"></div>
      
    <div class="container">
      <h2 id="about" class="text-center">OUR WORK</h2>
      <h5 id="about" class="text-center">(Click on the image to enlarge)</h5> 
      <br>
      <br>
        <div class="row">

          <div class="col-xs-12 col-sm-6 col-lg-3">
            <div class="thumbnail">
              <a href="" data-toggle="modal" data-target="#imgVile">
                <img src="src/mycss/images/Vile Parle.jpg" class="img-responsive" 
                alt="Vile Parle Railway Station Photo" title="Vile Parle Railway Station">
                <div class="caption text-center">
                  <p>Vile Parle Railway Station</p>
                </div>
              </a>
            </div>
          </div>

          <div class="modal fade" id="imgVile">
            <div class="modal-dialog modal-md">
              <div class="modal-content">
                <div class="modal-header">
                  <h3 class="text-center">Vile Parle Railway Station</h3>
                </div>
                <div class="modal-body">
                  <img src="src/mycss/images/Vile Parle.jpg" class="img-responsive" 
                  alt="Vile Parle Railway Station-Photo" title="Vile Parle Railway Station">
                  <br>
                </div>
                <div class="modal-footer">
                <a href="" class="btn btn-default" data-dismiss="modal">Close</a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-xs-12 col-sm-6 col-lg-3" >
            <div class="thumbnail">
              <a href="" data-toggle="modal" data-target="#imgUrja">
                <img src="src/mycss/images/Urja.jpg" class="img-responsive" 
                alt="Urja Shelter Home, Dadar-Photo" title="Urja Shelter Home, Dadar">
                <div class="caption text-center">
                  <p>Urja Shelter Home, Dadar</p>
                </div>
              </a>
            </div>
          </div>

          <div class="modal fade" id="imgUrja">
            <div class="modal-dialog modal-md">
              <div class="modal-content">
                <div class="modal-header">
                  <h3 class="text-center">Urja Shelter Home, Dadar</h3>
                </div>
                <div class="modal-body">
                  <img src="src/mycss/images/Urja.jpg" class="img-responsive" 
                  alt="Urja Shelter Home, Dadar-Photo" title="Urja Shelter Home, Dadar">
                  <br>
                </div>
                <div class="modal-footer">
                <a href="" class="btn btn-default" data-dismiss="modal">Close</a>
                </div>
              </div>
            </div>
          </div>


          <div class="col-xs-12 col-sm-6 col-lg-3" >
            <div class="thumbnail">
              <a href="" data-toggle="modal" data-target="#imgDockyard">
                <img src="src/mycss/images/Dockyard.jpg" class="img-responsive" 
                alt="Dockyard Road Railway Station-Photo" title="Dockyard Road Railway Station">
                <div class="caption text-center">
                  <p>Dockyard Road Railway Station</p>
                </div>
              </a>
            </div>
          </div>

          <div class="modal fade" id="imgDockyard">
            <div class="modal-dialog modal-md">
              <div class="modal-content">
                <div class="modal-header">
                  <h3 class="text-center">Dockyard Road Railway Station</h3>
                </div>
                <div class="modal-body">
                  <img src="src/mycss/images/Dockyard.jpg" class="img-responsive" 
                  alt="Dockyard Road Railway Station-Photo" title="Dockyard Road Railway Station">
                  <br>
                </div>
                <div class="modal-footer">
                <a href="" class="btn btn-default" data-dismiss="modal">Close</a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-xs-12 col-sm-6 col-lg-3" >
            <div class="thumbnail">
              <a href="" data-toggle="modal" data-target="#imgAnitaLodge">
                <img src="src/mycss/images/AnitaLodge.jpg" class="img-responsive" 
                alt="Anita Lodge, Goa-Photo" title="Anita Lodge, Goa">
                <div class="caption text-center">
                  <p>Anita Lodge, Goa</p>
                </div>
              </a>
            </div>
          </div>

          <div class="modal fade" id="imgAnitaLodge">
            <div class="modal-dialog modal-md">
              <div class="modal-content">
                <div class="modal-header">
                  <h3 class="text-center">Anita Lodge, Goa</h3>
                </div>
                <div class="modal-body">
                  <img src="src/mycss/images/AnitaLodge.jpg" class="img-responsive" 
                  alt="Anita Lodge, Goa-Photo" title="Anita Lodge, Goa">
                  <br>
                </div>
                <div class="modal-footer">
                <a href="" class="btn btn-default" data-dismiss="modal">Close</a>
                </div>
              </div>
            </div>
          </div>
        </div>  
      <br>
      <div class="container content-section text-center">
        <button class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp;&nbsp;View more</button>
      </div>

    </div>

      <br>
      <br>
      <div class="panel panel-default" id="panelRed">
      </div>
      
      <div class="container">
        <div class="container content-section text-center">
          <h2 id="about" class="text-center">CONTACT US</h2>
          <br>
          <div>  
            <h4><i class="fa fa-whatsapp"></i>&nbsp;&nbsp;+91-9167738212</h4>
            <h4><i class="fa fa-whatsapp"></i>&nbsp;&nbsp;+91-9769894016</h4>
            <h4><span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;projectmadteam@gmail.com</h4>
            <br>
          </div>
        </div>
        <div class="container content-section text-center">
          <button class="btn btn-primary btn-lg"><i class="fa fa-users"></i>&nbsp;&nbsp;Meet the team</button>
        </div>
      </div>

      <br>
      <br>
      <div class="panel panel-default" id="panelRed">
      </div>
      

      <div class="container">
        <div class="row">
          <div class="col-sm-3">
            <h2 id="about">QUICK LINKS</h2><br>
            <li><a href="https://docs.google.com/forms/d/e/1FAIpQLScEG4z3G2eF2Ywxkz-QAJO6E0VLtI6RsV8z8A0Ev6UdzAYA5g/viewform?c=0&w=1">
            Be a volunteer</a></li>
            <br>
            <li><a href="">About us</a></li>
            <br>
            <li><a href="">Write to us</a></li>
            <br>
          </div>
          <div class="col-sm-6"></div>
          <div class="col-sm-3">
              <h2 id="about">JOIN US ON</h2><br>
              <span class="h5"><a href="https://www.facebook.com/projectMuralsAndDoodles">
              <i class="fa fa-facebook fa-2x"></i></a></span>&nbsp;&nbsp;&nbsp;
              <span class="h5"><a href="https://www.instagram.com/projectmadteam">
              <i class="fa fa-instagram fa-2x"></i></a></span>&nbsp;&nbsp;&nbsp;
              <span class="h5"><a href="https://www.youtube.com/channel/UCN73W4uyhukVnZJUn4oGtDw">
              <i class="fa fa-youtube fa-2x"></i></a></span>&nbsp;&nbsp;&nbsp;
              <span class="h5"><a href="https://twitter.com/tamimsangrar">
              <i class="fa fa-twitter fa-2x"></i></a></span>&nbsp;&nbsp;&nbsp;
              <span class="h5"><a href="https://plus.google.com/u/0/114769295158768214800">
              <i class="fa fa-google-plus fa-2x"></i></a></span>
          </div>
          <br> <br>
        </div>
      </div>

      
      <div class="panel panel-default" id="panelRed">
      </div>
      <br>
      <br>
    

    <div class="navbar navbar-inverse navbar-bottom" id="navbarBottom">
      <div class="container-fluid">
        <div class="nav navbar-nav navbar-left">
          Copyright &copy; 2017 Project MAD. All Rights Reserved.
        </div>
        <div class="nav navbar-nav navbar-right">
          <span class="li"><i class="fa fa-globe fa-lg"></i>&nbsp;&nbsp;Developed by 
          <a href="https://about.me/shiva_shetty">Shiva Shetty</a></span>
        </div>
      </div>
    </div>

    <script src="src/js/jquery.min.js"></script> 
    <script src="src/js/bootstrap.min.js"></script>
  </body>
</html>