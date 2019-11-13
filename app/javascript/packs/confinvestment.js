const sliderInput = document.querySelector("#test")

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

  investedAmount.innerText = `$${amount}, ie ${div}% of the art piece`
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

    investedAmount.innerText = `$${amount}, ie ${div}% of the art piece`
  });







