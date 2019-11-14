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


const buttonForm = document.querySelector("#button-form")
    buttonForm.addEventListener("click", () => {
      const buttonModal = document.querySelector("#button-modal")
      buttonModal.click();
  });

const addValues = () => {

  const listenedAmount = document.querySelector(".irs-single")
  const array = listenedAmount.innerText.split("")
  const newArray = array.filter(function(str) {
    return /\S/.test(str);
    });
  const amount1 = newArray.join("")
  function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
  const amount = numberWithCommas(amount1)
  const campaignPrice = sliderInput.dataset.price
  const campaignMinInvestment = sliderInput.dataset.min
  const min = parseInt(campaignMinInvestment)
  const div1 = parseInt(amount1) / parseInt(campaignPrice) * 100
  const div = Math.round( div1 * 10 ) / 10;

  const investedShare = document.querySelector("#invested_share_conf")
  const investedAmount = document.querySelector("#invested_amount_conf")

  investedAmount.innerText = `$${amount} i.e. ${div}% of the art piece`
}

setTimeout(addValues, 500)

  sliderInput.addEventListener("click", () => {
    const listenedAmount = document.querySelector(".irs-single")
    console.log(listenedAmount)
    const array = listenedAmount.innerText.split("")
    const newArray = array.filter(function(str) {
      return /\S/.test(str);
      });
    const amount1 = newArray.join("")
      function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
    const amount = numberWithCommas(amount1)
    const campaignPrice = sliderInput.dataset.price
    const campaignMinInvestment = sliderInput.dataset.min
    const min = parseInt(campaignMinInvestment)
    const div1 = parseInt(amount1) / parseInt(campaignPrice) * 100
    const div = Math.round( div1 * 10 ) / 10;

    const investedShare = document.querySelector("#invested_share_conf")
    const investedAmount = document.querySelector("#invested_amount_conf")

    investedAmount.innerText = `$${amount} i.e. ${div}% of the art piece`
  });







