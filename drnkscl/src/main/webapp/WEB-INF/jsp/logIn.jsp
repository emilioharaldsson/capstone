<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglibprefix
= "sec" uri = "http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
  </head>
  <body>
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
          <sec:authorize access="isAuthenticated()">
            <li class="nav-item active">
              <a href="/user/logout" class="nav-link">
                <p class="navOption">Logout</p>
              </a>
            </li>
          </sec:authorize>
          <sec:authorize access="isAuthenticated()">
            <li class="nav-item active">
              <a href="/user?id=${user.id}" class="nav-link">
                <p class="navOption">Profile</p>
              </a>
            </li>
          </sec:authorize>
        </ul>
      </div>
    </nav>

    <!-- CONTENT -->
    <div class="container-fluid logInPage">
      <div class="container-fluid loginForm">
        <form action="/user/loginpost" method="POST" class="form-example">
          <h4 class="text-center">Login</h4>
          <div class="mb-3 message-container">
            <label for="InputEmail" class="form-label theme">Username</label>
            <input
              type="username"
              name="username"
              id="username"
              class="form-control emailVal"
            />
            <div id="emailHelp" class="form-text">
              Please reference the email you used to register
            </div>
          </div>
          <div class="mb-3">
            <label for="InputPassword" class="form-label theme">Password</label>
            <input
              type="password"
              name="password"
              id="password"
              aria-describedby="passwordHelp"
              class="form-control password"
            />
            <div class="passwordConditions">
              <div id="passwordHelp" class="form-text">
                <a href="">Forgot Password?</a>
              </div>
              <div id="passwordHelp" class="form-text"></div>
            </div>
          </div>
          <div class="text-center">
            <button
              type="submit"
              class="btn btn-dark signUpBtn"
              style="font-size: 18px"
            >
              Log In
            </button>
          </div>
        </form>
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

    <div class="container wrapper"></div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
