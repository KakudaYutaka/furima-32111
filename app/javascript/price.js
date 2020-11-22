function calc (){
  const itemPrice = document.getElementById("item-price");

  itemPrice.addEventListener("input", () => {
    const addTaxPrice = document.getElementById("add-tax-price");
    const salesProfit = document.getElementById("profit");
    taxPrice = Math.floor(itemPrice.value * 0.1)/ 1;
    profit = (itemPrice.value - taxPrice);
    addTaxPrice.innerHTML = `${taxPrice}`;
    salesProfit.innerHTML = `${profit}`;
  });
}

window.addEventListener('load', calc);