const sliderInput = document.querySelector("#test")
  sliderInput.addEventListener("click", () => {
    const listenedAmount = document.querySelector(".irs-single")
    const array = listenedAmount.innerText.split("")
    const newArray = array.filter(function(str) {
  return /\S/.test(str);
  });
    const amount = newArray.join("")
    const campaignPrice = sliderInput.dataset.price
    const div = parseInt((parseInt(amount) / parseInt(campaignPrice) * 100))

    const investedAmount = document.querySelector("#invested_amount_conf")
 investedAmount.innerText = `You want to invest $${amount}`
    const investedShare = document.querySelector("#invested_share_conf")

    investedShare.innerText = `You will own ${div}% of the art piece`
});

