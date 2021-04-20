window.addEventListener('load', () => {
  const priceInput = document.getElementById('item-price');
  priceInput.addEventListener("input", () => {
     const inputValue = priceInput.value;
     console.log(inputValue);
     
     const addTAXPrice = Math.floor(inputValue * 0.1)
     
     const addTaxDom = document.getElementById("add-tax-price");
     addTaxDom.innerHTML = addTAXPrice

     const profit = inputValue - addTAXPrice
     const salesProfit = document.getElementById("profit");
     salesProfit.innerHTML = profit
    })


});