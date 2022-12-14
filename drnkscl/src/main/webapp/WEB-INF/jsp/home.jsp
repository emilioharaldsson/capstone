<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


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
    <title>DRNKSCL|HOME</title>
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

    <div class="container-fluid spacer-3 layer-3">
      <div class="container justify-content-center">
        <div class="row align-items-center">
          <sec:authorize access = "!isAuthenticated()">
          <div class="container col">
            <div class="row">
              <h1 class="theFuture">The Future of Social Drinking is Here</h1>
            </div>
            <div class="row">
              <p class="subtext">
                Browse and Enjoy recipes from other cocktail maniacs around the
                world.
              </p>
            </div>
            <button type="button" class="btn btn-dark btn-rounded signUpBtn">
              Sign Up
            </button>
          </div>
        </sec:authorize>
        <sec:authorize access = "isAuthenticated()">
          <div class="container col">
            <div class="row">
              <h1 class="theFuture">Welcome to DRNKSCL!</h1>
            </div>
            <div class="row">
              <p class="subtext">
                Browse and Enjoy recipes from other cocktail maniacs around the
                world.
              </p>
            </div>
            <button type="button" class="btn btn-dark btn-rounded signUpBtn">
              Browse DRNKs
            </button>
          </div>
        </sec:authorize>
          <div class="col justify-content-end">
            <img src="img/ioio.png" alt="" />
          </div>
        </div>
      </div>
    </div>

    <div class="spacer layer-1"></div>

    <div class="container-fluid contentHomePage">
      <div class="row text-center">
        <h3 class="sponsored mt-2">Sponsored By</h3>
      </div>
      <div class="row align-items-center sponsorships">
        <div class="col text-center">
          <img src="img/bicardi.png" alt="" class="sponsor-img" />
        </div>
        <div class="col text-center">
          <img src="img/ciroc.png" alt="" class="sponsor-img" />
        </div>
        <div class="col text-center">
          <img src="img/hennesy.png" alt="" class="sponsor-img" />
        </div>
        <div class="col text-center">
          <img src="img/greygouse.png" alt="" class="sponsor-img" />
        </div>
        <div class="col text-center">
          <img src="img/jackdaniels.png" alt="" class="sponsor-img" />
        </div>
      </div>
    </div>

    <div class="spacer-2 layer-2"></div>

    <div class="container-fluid-browseDrinks spacer-4 layer-4">
      <div class="row">
        <div class="col">
          <img src="img/uuuu.png" alt="" />
        </div>
        <div class="col">
          <div class="checkOutTheFeed">
            <div class="row mb-4 mt-2">
              <h4 class="text-center haveUEverHadA">
                Have You Ever Had A ... ?
              </h4>
            </div>
            <div class="row text-center mb-3">
              <p class="infoInfo">
                Connect with a global community of drink lovers. There is no
                limit to where this journey can take you. Perhaps you think that
                you'll never find that perfect margarita flavor, or an old
                fashion recipe that doesn't make you gag. We bet that today is
                the day you prove yourself wrong
              </p>
            </div>
            <div class="text-center">
              <button type="button" class="btn btn-dark btn-rounded signUpBtn">
                Check Out <span class="haveUEverHadA">DRNKSCL</span> feed
              </button>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="container">
            <div class="row mb-5">
              <div class="col-3">
                <span class="homePageIcon">
                  <i class="fa-solid fa-martini-glass fa-3x"></i>
                </span>
              </div>
              <div class="col-9 mt-2">
                <h6 class="homePageIcon">Browse and Try New Drinks</h6>
              </div>
            </div>
            <div class="row mb-5">
              <div class="col-3">
                <span class="homePageIcon">
                  <i class="fa-regular fa-heart fa-3x"></i>
                </span>
              </div>
              <div class="col-9 mt-2">
                <h6 class="homePageIcon">Leave a Review, make some friends</h6>
              </div>
            </div>
            <div class="row">
              <div class="col-3">
                <span class="homePageIcon">
                  <i class="fa-solid fa-flask fa-3x"></i>
                </span>
              </div>
              <div class="col-9 mt-2">
                <h6 class="homePageIcon">Share your own inventions</h6>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="container-fluid spacer-3 layer-8">
      <h4 class="text-center">
        <span class="haveUEverHadA">DRNKSCL</span> Classic Cocktails
      </h4>
      <div class="row">
        <div class="col-1"></div>
        <div class="col-7 mt-5">
          <div class="container">
            <div class="row mb-5">
              <div class="col">
                <div class="container-fluid shadowBox">
                  <div class="row">
                    <div class="col-4 mb-4 mt-2">
                      <img src="img/oldFashion.png" alt="" />
                    </div>
                    <div class="col-8">
                      <div class="container-fluid">
                        <div class="row">
                          <h6 class="drnksclClassic">Young Fashion</h6>
                        </div>
                        <div class="row">
                          <p class="drnksclClassicDescription">
                            2 oz bourbon, 2 oz Coke, 1 eggwhite, 3 drops
                            bitters, 3 oz Angry Orchard
                          </p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="container-fluid shadowBox">
                  <div class="row">
                    <div class="col-4 mb-4 mt-2">
                      <img src="img/whiteRussian.png" alt="" />
                    </div>
                    <div class="col-8">
                      <div class="container-fluid">
                        <div class="row">
                          <h6 class="drnksclClassic">Black Russian</h6>
                        </div>
                        <div class="row">
                          <p class="drnksclClassicDescription">
                            2 oz vodka, 1 oz Kahlua, 2 oz Coke , 1 splash heavy
                            cream, 2 oz chocolate milk
                          </p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <div class="container-fluid shadowBox">
                  <div class="row">
                    <div class="col-4 mb-4 mt-2">
                      <img src="img/moscowMule.png" alt="" />
                    </div>
                    <div class="col-8">
                      <div class="container-fluid">
                        <div class="row">
                          <h6 class="drnksclClassic">Moscow Donkey</h6>
                        </div>
                        <div class="row">
                          <p class="drnksclClassicDescription">
                            2 oz vodka, 2 oz blackberry soda, 2 oz lime juice, 5
                            mint leaves
                          </p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="container-fluid shadowBox">
                  <div class="row">
                    <div class="col-4 mb-4 mt-2">
                      <img src="img/margarita.png" class="mt-2" alt="" />
                    </div>
                    <div class="col-8">
                      <div class="container-fluid">
                        <div class="row">
                          <h6 class="drnksclClassic">Tahini Margarita</h6>
                        </div>
                        <div class="row">
                          <p class="drnksclClassicDescription">
                            2 oz white tequila, 2 oz lime juice, 4 oz Sprite, 2
                            tbsp tahini, 4 jalapeño
                          </p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row"></div>
          </div>
        </div>
        <div class="col-4">
          <img src="img/martiniDrink.png" alt="" />
        </div>
      </div>
    </div>
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
  </body>
</html>
