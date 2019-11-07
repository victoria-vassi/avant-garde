const clickModal = () => {

const buttonForm = document.querySelector("#button-form")
    buttonForm.addEventListener("click", () => {
      const buttonModal = document.querySelector("#button-modal")
      buttonModal.click();
  });
};

export { clickModal }
