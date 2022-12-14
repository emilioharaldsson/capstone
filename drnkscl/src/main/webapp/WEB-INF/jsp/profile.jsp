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
  <body>
    <!-- NAV -->
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


    <!-- CONTENT -->
    <div class="container-fluid spacer-9 layer-20">
      <div class="row">
        <div class="col mt-5">
          <div class="container-fluid">
            <div class="row justify-content-center">
              <div class="profilePicContainer">
                <img src="${user.avatar}" class="profilePic" alt="" />
              </div>
            </div>
            <div class="row text-center mt-3">
              <h6 style="color: white" class="contentFormat">${fullName}</h6>
            </div>
            <div class="row text-center">
              <p style="color: #b2beb5; font-size: 12px">${user.alias}</p>
            </div>
            <div class="row">
              <div class="container-fluid text-center">
                <a href="/editUser">
                  <button
                    type="button"
                    class="btn btn-light btn-rounded"
                    class="editProfileBtn"
                    href="/editUser"
                  >
                    Edit Profile
                  </button>
                </a>
              </div>
            </div>
            <div class="row mt-2">
              <div class="container-fluid text-center">
                <a href="/userProfilePicUpload">
                  <button
                    type="button"
                    class="btn btn-light btn-rounded"
                    class="editProfileBtn"
                    href="/editUser"
                  >
                    Upload Avatar
                  </button>
                </a>
              </div>
            </div>
            <div class="row mt-4 mb-2 " style = "margin: 1px 50px;">
              <hr class="mb-1 contentFormat" style="color: white" />
            </div>
            <div class="row mt-3 text-center" style="margin: 10px 90px">
              <div class="col-6">
                <div class="container text-center">
                  <div class="row">
                    <p style="color: white">${numberOfUserDrinks}</p>
                  </div>
                  <div class="row">
                    <p style="color: white">drnks</p>
                  </div>
                </div>
              </div>
              <div class="col-6">
                <div class="container text-center">
                  <div class="row">
                    <p style="color: white">${numberOfUserFansies}</p>
                  </div>
                  <div class="row">
                    <p style="color: white">fansies</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col yourDrinks">
          <div class="container">
            <div class="row mt-5 text-center">
              <h3 class="contentFormat">ur Drnks</h3>
            </div>
            <div class="row mt-1 mb-4">
              <hr class="mb-1" style="color: white" />
            </div>
            <c:forEach items="${userDrinks}" var="userDrink">
              <a
                href="/drinkcard?id=${userDrink.id}"
                style="text-decoration: none"
              >
                <div class="row mt-1 mb-2 text-center" style="color: #02111b">
                  <p
                    style="
                      color: white;
                      letter-spacing: 0.3rem;
                      text-transform: lowercase;
                    "
                    class="userDrinksOnProfile"
                  >
                    ${userDrink.name}
                  </p>
                </div>
              </a>
            </c:forEach>
            <div class="container-fluid text-center">
              <a href="/user/newDrink">
                <button
                  type="button"
                  class="btn btn-light btn-rounded"
                  class="editProfileBtn"
                  href=""
                >
                  Create Drink
                </button>
              </a>
            </div>
          </div>
        </div>
        <div class="col"></div>
      </div>
    </div>

    <!-- DIVIDER -->
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
    <script src="/js/app.js"></script>
  </body>
</html>
