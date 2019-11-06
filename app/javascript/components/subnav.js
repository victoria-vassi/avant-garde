const subnav = () => {

  const links = document.querySelectorAll(".nav-link");
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

      document.getElementById(`${e.target.id}-content`).className += " active";
      e.currentTarget.className += " active";
    });
  });
};

export { subnav }
