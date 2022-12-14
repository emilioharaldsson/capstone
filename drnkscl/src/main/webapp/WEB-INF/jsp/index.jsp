<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="./include/header.jsp" />
<div class="wrapper">
  <form action="/" method="get" class="form-inline">
    <div class="form-group mb-2">
      <input
        name="search"
        type="text"
        class="form-control"
        id="inputPassword2"
        placeholder="Recipe"
      />
    </div>
    <button type="submit" class="btn btn-primary mb-2">Search Recipe</button>
  </form>
  <table class="table table-striped table-dark">
    <thead>
      <tr>
        <th scope="col">Recipe Id</th>
        <th scope="col">Name</th>
        <th scope="col">Author</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${recipes}" var="recipe">
        <tr>
          <td>${recipe.id}</td>
          <td>${recipe.name}</td>
          <td>${recipe.author}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
<jsp:include page="./include/footer.jsp" />
