function tax() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const priceValue = parseFloat(itemPrice.value);
    if (!isNaN(priceValue)) {
      const fee = priceValue * 0.1;
      const roundedFee = Math.floor(fee);
      const addTaxPrice = document.getElementById("add-tax-price");
      addTaxPrice.innerHTML = `${roundedFee}`;
      const salesProfit = priceValue - roundedFee;
      const profit = document.getElementById("profit");
      profit.innerHTML = `${salesProfit}`;
    } else {
      const addTaxPrice = document.getElementById("add-tax-price");
      addTaxPrice.innerHTML = '-';
      const profit = document.getElementById("profit");
      profit.innerHTML = '-';
    }
  });
}

window.addEventListener('load', tax);