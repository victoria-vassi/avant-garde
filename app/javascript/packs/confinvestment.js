const sliderInput = document.querySelector("#test")

const addValues = () => {
  Number.prototype.number_with_delimiter = function(delimiter) {
    var number = this + '', delimiter = delimiter || ',';
    var split = number.split('.');
    split[0] = split[0].replace(
        /(\d)(?=(\d\d\d)+(?!\d))/g,
        '$1' + delimiter
    );
    return split.join('.');
};
  const listenedAmount = document.querySelector(".irs-single")
  const array = listenedAmount.innerText.split("")
  const newArray = array.filter(function(str) {
    return /\S/.test(str);
    });
  const amount = newArray.join("")
  const campaignPrice = sliderInput.dataset.price
  const campaignMinInvestment = sliderInput.dataset.min
  const min = parseInt(campaignMinInvestment)
  const div1 = parseInt(amount) / parseInt(campaignPrice) * 100
  const div = Math.round( div1 * 10 ) / 10;

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
    const div1 = parseInt(amount) / parseInt(campaignPrice) * 100
    const div = Math.round( div1 * 10 ) / 10;

    const investedShare = document.querySelector("#invested_share_conf")
    const investedAmount = document.querySelector("#invested_amount_conf")

    investedAmount.innerText = `You want to invest $${amount}`
    investedShare.innerText = `You will own ${div}% of the art piece`

  });







