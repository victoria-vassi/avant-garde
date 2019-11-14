const thumbsup = document.querySelectorAll("#thumbsup")
const thumbsdown = document.querySelectorAll("#thumbsdown")
// const likebuttoncounter = document.querySelector("#ourcounter")


const test = (e) => {
  const count = e.target.parentElement.firstElementChild
  var num = parseInt(count.innerText, 10)
  num = num + 1
  count.innerText = num.toString();
  e.target.removeEventListener('click', test, false);

}

thumbsup.forEach((thumb) => {
  thumb.addEventListener('click', test)
});


thumbsdown.forEach((thumb) => {
  thumb.addEventListener('click', test)
});




