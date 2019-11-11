  const buttonInvest = document.querySelector("#button-invest")
if (buttonInvest.dataset.funded === "true") {
  buttonInvest.classList.remove("btn-primary");
  buttonInvest.classList.add("btn-dark");
  buttonInvest.value = "Campaign closed";
  buttonInvest.disabled = true;
}

