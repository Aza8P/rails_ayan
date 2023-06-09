// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/stimulus"
import "@hotwired/stimulus-loading"
import "@hotwired/turbo-rails"
import "controllers"
import "popper"
import "bootstrap"

document.addEventListener("turbo:load", () => {
  const activeLanguageLink = document.querySelector(".language-link.selected");
  console.log("event click", activeLanguageLink);
  const languageLinks = document.querySelectorAll(".language-link");
  languageLinks.forEach((languageLink) => {
    languageLink.addEventListener("click", (event) => {
      // Check if the clicked link is inside the navbar or not
      if (!event.target.closest('.language-switcher')) {
        event.preventDefault();
        const language = languageLink.dataset.locale;
        const csrfToken = document.querySelector("meta[name='csrf-token']").content;
        fetch(`/locale?locale=${language}`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            "X-CSRF-Token": csrfToken,
          },
        }).then(() => {
          window.location.reload();
        });
      }
    });
  });
});


