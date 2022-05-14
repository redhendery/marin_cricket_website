// Entry point for the build script in your package.json
require("@rails/ujs").start()
require("@rails/activestorage").start()

import "@hotwired/turbo-rails"
import "./controllers"

// Navbar specific JS
(() => {
  var burger = document.querySelector('.burger');
  var nav = document.querySelector('#'+burger.dataset.target);
  burger.addEventListener('click', () => {
    burger.classList.toggle('is-active');
    nav.classList.toggle('is-active');
  });
})();
