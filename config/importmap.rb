# Pin npm packages by running ./bin/importmap
pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true 
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
# pin "@popperjs/core", to: "https://cdn.skypack.dev/@popperjs/core@2.11.7?dts", preload: true
pin "bootstrap", to: "bootstrap.js", preload: true
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.6.4/dist/jquery.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"



