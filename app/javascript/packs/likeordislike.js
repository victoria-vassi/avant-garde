const thumbsup = document.querySelectorAll("#thumbsup")
const thumbsdown = document.querySelectorAll("#thumbsdown")
// const likebuttoncounter = document.querySelector("#ourcounter")

thumbsup.forEach((thumb) => {
  thumb.addEventListener('click', (event) => {
    const count = thumb.parentElement.firstElementChild
    var num = parseInt(count.innerText, 10)
    num = num + 1
    count.innerText = num.toString();
  });
})

thumbsdown.forEach((thumb) => {
  thumb.addEventListener('click', (event) => {
    const count = thumb.parentElement.firstElementChild
    var num = parseInt(count.innerText, 10)
    num = num + 1
    count.innerText = num.toString();
  });
})



