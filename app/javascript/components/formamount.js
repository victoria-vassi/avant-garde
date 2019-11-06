const formAmount = () => {

const sliderInput = document.querySelector("#test")
    sliderInput.addEventListener("click", () => {
      const amount = document.querySelector(".irs-single").innerText
    const formInput = document.querySelector("#investment_amount")
    formInput.value = parseInt(amount,10)*1000
  });
};

export { formAmount }
