<%@ taglib prefix = "sec" uri = "http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=\, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="/css/style.css" />
    <title>Document</title>
    <link
      href="https://fonts.googleapis.com/css?family=Archivo+Black&display=swap"
      rel="stylesheet"
    />
    <script
      src="https://kit.fontawesome.com/96385e6273.js"
      crossorigin="anonymous"
    ></script>
    <script
    src="https://code.jquery.com/jquery-3.6.1.js"
    integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
    crossorigin="anonymous"
  ></script>
  </head>
  <body class="addDrinkBody">
    <script>

        $(document).ready(function () {
          console.log("document ready")
            $(".likeABtn").click(function(){
              console.log("like button clicked")
               $.ajax({
              url: "/likeDrink",
              data: {
                drinkId : this.value
              },
              success: function(result){
                alert("You liked a drink!");
              }, 
              error: function(data){
                console.log("ajax called failed....")
              }
            });
          });
        })
    </script>
    <!-- NAVBAR -->
    <nav class="navabar navbar-expand-sm navbar-light">
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item active">
            <a href="/home" class="navbar-brand mb-0 h1">
              <p class="logo-1">DRINKSCL</p>
            </a>
          </li>
          <li class="nav-item active">
            <a href="/browse" class="nav-link">
              <p class="navOption">Drnks</p>
            </a>
          </li>

          <sec:authorize access = "!isAuthenticated()">
            <li class="nav-item active">
              <a href="/user/login" class="nav-link">
                <p class="navOption">Login</p>
              </a>
            </li>
            <li class="nav-item active">
              <a href="/signup" class="nav-link">
                <p class="navOption">Sign Up</p>
              </a>
            </li>
          </sec:authorize>

          <sec:authorize access="isAuthenticated()">
            <li class="nav-item active">
              <a href="/profile" class="nav-link">
                <p class="navOption">Profile</p>
              </a>
            </li>
            <li class="nav-item active">
              <a href="/user/logout" class="nav-link">
                <p class="navOption">Logout</p>
              </a>
            </li>
          </sec:authorize>
        </ul>
      </div>
    </nav>


    <div class="container likeADrink mt-5">
      <div class="row addADrinkRow">
        <div class="container-fluid align-items-center">
          <div class="row drnkSearchBar align-items-center justify-content-center">
            <form action="/browse" method = "GET" class = "form p-0" style = "background-color: transparent;" placeholder="Search Drinks"">
              <div class="row justify-content-center" style="margin-left: 230px"> 
                <div class="col-8">
                  <input type="text" name = "searchDrink" class = "form-control m-0" style= "box-shadow:#BEBEBE 0px 48px 100px 0px;" placeholder="Search">
                </div>
                <div class="col-4">
                  <button style="background-color: transparent; border: none">
                    <i class="fa-solid fa-magnifying-glass glassIcon fa-2x"></i>
                  </button>
                </div>
              </div>
            </form>
          </div>
        </div>
        <div class="col-6 displayRecipes">
          <div class="container-fluid mt-5">
            <c:forEach items="${drnks}" var ="drnk">
                <div class="row scldrnk  mt-2 align-items-center" >
                    <div class="col-2">
                        <img src= ${drnk.avatar} alt="" style = "width:50px">
                    </div>
                    <div class="col-8">
                        <div class="container-fluid">
                            <div class="row text-center mt-1">
                              <a href="/drinkcard?id=${drnk.id}" class = "scldrnkBulletPoint" style = "color:white; letter-spacing: 0.2rem; font-size: 11px; text-decoration:none">
                                <p >${drnk.name}</p>
                              </a>
                            </div>
                            <div class="row text-center form-text">
                                <p style = "letter-spacing: 0.2rem; text-transform: lowercase;">${drnk.author}</p>
                            </div>
                        </div>
                    </div>
                    <div class = "col-2 align-items-center">
                        <button class = "likeABtn" style = "background-color: #02111B; border:none" value = ${drnk.id}>
                            <i class="fa-regular fa-heart" style = "color:white"></i>
                        </button>
                    </div>
                  </div>
            </c:forEach>
          </div>
        </div>
        
      </div>
    </div>



    <div class="layer-9 spacer-5"></div>

    <!-- FOOTER -->
    <div class="container-fluid footerBottom" style="background-color: #45526e">
      <!-- Footer -->
      <footer
        class="text-center text-lg-start text-white"
        style="background-color: #45526e"
      >
        <!-- Grid container -->
        <div class="container p-4 pb-0">
          <!-- Section: Links -->
          <section class="">
            <!--Grid row-->
            <div class="row">
              <!-- Grid column -->
              <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-2">
                <h6
                  class="text-uppercase mb-4 font-weight-bold footerCompanyName"
                >
                  DRNKSCL
                </h6>
                <p class="footerText">
                  Here you can use rows and columns to organize your footer
                  content. Lorem ipsum dolor sit amet, consectetur adipisicing
                  elit.
                </p>
              </div>
              <!-- Grid column -->

              <hr class="w-100 clearfix d-md-none" />

              <!-- Grid column -->
              <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-2">
                <h6
                  class="text-uppercase mb-4 font-weight-bold footerCompanyName"
                >
                  Products
                </h6>
                <p class="footerText">
                  <a class="text-white">MDBootstrap</a>
                </p>
                <p class="footerText">
                  <a class="text-white">MDWordPress</a>
                </p>
                <p class="footerText">
                  <a class="text-white">BrandFlow</a>
                </p>
                <p class="footerText">
                  <a class="text-white">Bootstrap Angular</a>
                </p>
              </div>
              <!-- Grid column -->

              <hr class="w-100 clearfix d-md-none" />

              <!-- Grid column -->
              <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
                <h6
                  class="text-uppercase mb-4 font-weight-bold footerCompanyName"
                >
                  Useful links
                </h6>
                <p class="footerText">
                  <a class="text-white">Your Account</a>
                </p>
                <p class="footerText">
                  <a class="text-white">Careers</a>
                </p>
                <p class="footerText">
                  <a class="text-white">Contact Us</a>
                </p>
                <p class="footerText">
                  <a class="text-white">Help</a>
                </p>
              </div>

              <!-- Grid column -->
              <hr class="w-100 clearfix d-md-none" />

              <!-- Grid column -->
              <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
                <h6
                  class="text-uppercase mb-4 font-weight-bold footerCompanyName"
                >
                  Contact
                </h6>
                <p class="footerText">
                  <i class="fas fa-home mr-3"></i> Jersey City, NJ 07307, US
                </p>
                <p class="footerText">
                  <i class="fas fa-envelope mr-3"></i> drnkscl@drnkscl.com
                </p>
                <p class="footerText">
                  <i class="fas fa-phone mr-3"></i> + 703 400 0788
                </p>
                <p class="footerText">
                  <i class="fas fa-print mr-3"></i> + 01 234 567 89
                </p>
              </div>
              <!-- Grid column -->
            </div>
            <!--Grid row-->
          </section>
          <!-- Section: Links -->

          <hr class="my-3" />

          <!-- Section: Copyright -->
          <section class="p-2 pt-0">
            <div class="row d-flex align-items-center">
              <!-- Grid column -->
              <div class="col-md-7 col-lg-8 text-center text-md-start">
                <!-- Copyright -->
                <div class="p-2 footerText">
                  © 2020 Copyright:
                  <a class="text-white" href="https://mdbootstrap.com/"
                    >MDBootstrap.com</a
                  >
                </div>
                <!-- Copyright -->
              </div>
              <!-- Grid column -->

              <!-- Grid column -->
              <div class="col-md-5 col-lg-4 ml-lg-0 text-center text-md-end">
                <!-- Facebook -->
                <a
                  class="btn btn-outline-light btn-floating m-1"
                  class="text-white"
                  role="button"
                  ><i class="fab fa-facebook-f"></i
                ></a>

                <!-- Twitter -->
                <a
                  class="btn btn-outline-light btn-floating m-1"
                  class="text-white"
                  role="button"
                  ><i class="fab fa-twitter"></i
                ></a>

                <!-- Google -->
                <a
                  class="btn btn-outline-light btn-floating m-1"
                  class="text-white"
                  role="button"
                  ><i class="fab fa-google"></i
                ></a>

                <!-- Instagram -->
                <a
                  class="btn btn-outline-light btn-floating m-1"
                  class="text-white"
                  role="button"
                  ><i class="fab fa-instagram"></i
                ></a>
              </div>
              <!-- Grid column -->
            </div>
          </section>
          <!-- Section: Copyright -->
        </div>
        <!-- Grid container -->
      </footer>
      <!-- Footer -->
    </div>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
    <script src="/js/likeADrink.js"></script>
  </body>
</html>
