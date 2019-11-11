const sliderInput = document.querySelector("#test")

const addValues = () => {
  const listenedAmount = document.querySelector(".irs-single")
  console.log(listenedAmount)
  const array = listenedAmount.innerText.split("")
  const newArray = array.filter(function(str) {
    return /\S/.test(str);
    });
  const amount = newArray.join("")
  const campaignPrice = sliderInput.dataset.price
  const campaignMinInvestment = sliderInput.dataset.min
  const min = parseInt(campaignMinInvestment)
  const div = parseInt((parseInt(amount) / parseInt(campaignPrice) * 100))

  const investedShare = document.querySelector("#invested_share_conf")
  const investedAmount = document.querySelector("#invested_amount_conf")

  investedAmount.innerText = `You want to invest $${amount}`
  investedShare.innerText = `You will own ${div}% of the art piece`
}

setTimeout(addValues, 500)

  sliderInput.addEventListener("click", () => {
    const listenedAmount = document.querySelector(".irs-single")
    console.log(listenedAmount)
    const array = listenedAmount.innerText.split("")
    const newArray = array.filter(function(str) {
      return /\S/.test(str);
      });
    const amount = newArray.join("")
    const campaignPrice = sliderInput.dataset.price
    const campaignMinInvestment = sliderInput.dataset.min
    const min = parseInt(campaignMinInvestment)
    const div = parseInt((parseInt(amount) / parseInt(campaignPrice) * 100))

    const investedShare = document.querySelector("#invested_share_conf")
    const investedAmount = document.querySelector("#invested_amount_conf")

    investedAmount.innerText = `You want to invest $${amount}`
    investedShare.innerText = `You will own ${div}% of the art piece`
  });







