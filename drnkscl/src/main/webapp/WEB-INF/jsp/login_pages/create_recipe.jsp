<%@taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../include/header.jsp" />

<div style="margin: 70px 250px !important">
  <h2 class="text-center">Create A Recipe</h2>
  <div class="container mb-5 mt-3">
    <c:if test="${bindingResult.hasErrors()}">
      <c:forEach items="${bindingResult.getAllErrors()}" var="error">
        <p class="mt-0 mb-1" style="color: red">${error.getDefaultMessage()}</p>
      </c:forEach>
    </c:if>
  </div>
  <form action="/createRecipe" method="POST">
    <div class="container row">
      <div class="col mb-3">
        <label for="exampleInputPassword1" class="form-label">Drink Name</label>
        <input
          name="name"
          type="text"
          class="form-control"
          id="exampleInputPassword1"
          value="${form.firstName}"
        />
      </div>
      <div class="col mb-3">
        <label for="exampleInputPassword1" class="form-label">User Id</label>
        <input
          name="id"
          type="text"
          class="form-control"
          id="exampleInputPassword1"
          value="${form.lastName}"
        />
      </div>
    </div>
    <div class="text-center">
      <button type="submit" class="btn btn-primary">Submit</button>
    </div>
  </form>
</div>

<jsp:include page="../include/footer.jsp" />
