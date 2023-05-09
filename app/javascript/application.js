// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "controllers"
import "@hotwired/turbo-rails"
import "bootstrap"
import $ from 'jquery';


console.log("Hello from application.js");
console.log("JAVASCRIPT PACKS LOADED");

document.addEventListener("turbo:load", () => {
  const activeLanguageLink = document.querySelector(".language-link.selected");
  const languageLinks = document.querySelectorAll(".language-link");
  languageLinks.forEach((languageLink) => {
    languageLink.addEventListener("click", (event) => {
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
    });
  });
});

