const addIngredientForm = document.querySelector('.inputRowContainer');
const addIngredientBtn = document.querySelector('.addIngredientBtn');


function addDrinkIngredient(e) {
    e.preventDefault();
    let rowContainer = document.createElement('div');
    rowContainer.classList.add('row')
    rowContainer.classList.add('mb-3')

    let nameCol = document.createElement('div');
    nameCol.classList.add('col-8');
    let ingredientName = fillCol(nameCol, "ingredient", "form-control", "ingredient", "ingredientName");
    rowContainer.append(ingredientName);

    let amountCol = document.createElement('div');
    amountCol.classList.add('col-2');
    let amount = fillCol(amountCol, "amount", "form-control", "amount", "amount");
    rowContainer.append(amount);


    let unitCol = document.createElement('div');
    unitCol.classList.add('col-2');
    let unit = fillCol(unitCol, "amount", "form-control", "unit", "unit");
    rowContainer.append(unit);
   
    addIngredientForm.append(rowContainer);

}


function fillCol(element, type, className, id, name){
    let inputField = document.createElement('input');
    inputField.classList.add(className)
    inputField.classList.add('p-1')
    inputField.setAttribute("type", type);
    inputField.setAttribute("id", id);
    inputField.setAttribute("name", name);
    element.append(inputField);
    return element;
}



addIngredientBtn.addEventListener('click', addDrinkIngredient);

