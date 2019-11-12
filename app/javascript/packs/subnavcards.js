const links = document.querySelectorAll(".card-link");
links.forEach((link) => {
  link.addEventListener("click", (e) => {
    var i, tabcontent, tablinks;

    tabcontent = document.querySelectorAll(".tab-pane");
    for (i = 0; i < tabcontent.length; i++) {
      tabcontent[i].className = tabcontent[i].className.replace(" active", "");
    }

    tablinks = document.querySelectorAll(".nav-link");
    for (i = 0; i < tablinks.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    document.getElementById(`my-${e.currentTarget.id}-content`).className += " active";
    document.getElementById(`my-${e.currentTarget.id}`).className += " active";
  });
});