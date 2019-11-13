const progressBar = () => {

  const steps = document.querySelectorAll(".step-progressbar")
  steps.forEach((step) => {
    step.addEventListener("click", (e) => {
      var i, confirmpayment, payment;

      confirmpayment = document.getElementsByClassName("btn btn-sm btn-soft-primary transition-3d-hover");
      for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
      }

      payment = document.getElementsByClassName("step-progressbar");
      for (i = 0; i < nextpages.length; i++) {
        nextpages[i].className = nextpages[i].className.replace(" active", "");
      }
    })
  })
}
