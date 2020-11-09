window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price");
  
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
     console.log(inputValue);

    const addTaxValue = document.getElementById("add-tax-price")
    addTaxValue.innerHTML = (Math.floor(inputValue * 0.1));
     console.log(addTaxValue);
  
    const profitNumber = document.getElementById("profit")
    const value_result = inputValue * 0.1
    profitNumber.innerHTML = (Math.floor(inputValue - value_result));
     console.log(profitNumber);
  })
})