import riot from 'riot'

// Import framework with all components
import Framework7 from 'framework7/framework7.esm.bundle.js';
import 'framework7/css/framework7.css';

import 'framework7-icons';
// import './css/app.css';

// Import Main Tag
import './main.tag'

window.app = new Framework7({
  // App root element
  root: '#app',
  // App Name
  name: 'mqtt-client',
  // App id
  id: 'com.app.mqtt',
  theme:'ios',
  view: {
    pushState: true,
  },
  // Add default routes
  routes: [
  ],
  on: {
    init: function () {
      console.log(riot)
    }
  }
  // ... other parameters
});
//
// var $$ = Framework7.Dom7;

var app_main = riot.mount("#app",'app_main');

// Init/Create main view
var mainView = app.views.create('.view-main', {
  url: '/'
});