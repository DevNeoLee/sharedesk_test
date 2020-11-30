
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')
require('popper.js')
require('bootstrap')
// import 'bootstrap'
global.toastr = require("toastr")
require("jquery-ui")

import "@fortawesome/fontawesome-free/js/all";

import "controllers"

import "./page_home_datepicker"

// google map api with Stimulus.js
window.dispatchMapsEvent = function (...args) {
  const event = document.createEvent("Events")
  event.initEvent("google-maps-callback", true, true)
  event.args = args
  window.dispatchEvent(event)
}

//css
import 'scss/site'

//JS
import('js/site')

//Images
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

toastr.options = {
  "closeButton": false,
  "debug": false,
  "newestOnTop": false,
  "progressBar": false,
  "positionClass": "toast-top-right",
  "preventDuplicates": false,
  "onclick": null,
  "showDuration": "1500",
  "hideDuration": "1000",
  "timeOut": "1000",
  "extendedTimeOut": "1000",
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut"
}