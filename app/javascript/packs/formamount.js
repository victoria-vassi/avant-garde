const sliderInput = document.querySelector("#test")
  sliderInput.addEventListener("click", () => {
    const listened_amount = document.querySelector(".irs-single")
    const array = listened_amount.innerText.split("")
    const newArray = array.filter(function(str) {
  return /\S/.test(str);
  });
    const amount = newArray.join("")
  const formInput = document.querySelector("#investment_amount")
  formInput.value = parseInt(amount,10)
});
