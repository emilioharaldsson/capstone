<%@ taglib prefix = "sec" uri = "http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=\, initial-scale=1.0" />
    <title>Document</title>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="/css/style.css" />
  </head>
  <body>
    <div class="container">
      <div class="row">
        <div class="col-2">
          <a href="/">Home</a>
          <a href="/createRecipe">Add A Drink</a>
          <a href="/createUser">Sign Up</a>
          <a href="/user/login">Login</a>
          <sec:authorize access="hasAnyAuthority('CONTENT', 'ADMIN')">
            <a href="/admin/admintest"> Admin Test</a>
          </sec:authorize>
          <sec:authorize access="isAuthenticated()">
            <a href="/user/logout">Logout</a>
            <sec:authentication property="principal.username" />
          </sec:authorize>
          <sec:authorize access="isAuthenticated()">
            <a href="/user/newDrink">Add New Drink</a>
          </sec:authorize>
        </div>
      </div>
    </div>
 
