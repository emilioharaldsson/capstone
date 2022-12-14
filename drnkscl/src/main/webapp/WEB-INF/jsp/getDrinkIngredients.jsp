<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
      crossorigin="anonymous"
    />
    <script
      src="https://kit.fontawesome.com/889d2aee20.js"
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="css/style.css" />
  </head>
  <body>
    <div class="wrapper">
      <form action="/recipe/getIngedrients"" method="get" class="form-inline">
        <div class="form-group mb-2">
          <input
            name="drinkName"
            type="text"
            class="form-control"
            id="inputPassword2"
            placeholder="Look For A Drink.."
          />
        </div>
        <button type="submit" class="btn btn-primary mb-2">
          Get Ingredients
        </button>
      </form>
      <table class="table table-striped table-dark">
        <thead>
          <tr>
            <th scope="col">Name</th>
            <th scope="col">Amount</th>
            <th scope="col">Unit</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${drinkIngredients}" var="drinkIngredient">
            <tr>
              <td>${drinkIngredient.get("name")}</td>
              <td>${drinkIngredient.get("amount")}</td>
              <td>${drinkIngredient.get("unit")}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </body>
</html>
