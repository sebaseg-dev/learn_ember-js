import EmberRouter from '@embroider/router';
import config from 'learn-ember-js/config/environment';

export default class Router extends EmberRouter {
  location = config.locationType;
  rootURL = config.rootURL;
}

Router.map(function () {});
Router.map(function () {
  this.route('about');
  this.route('contact', { path: '/getting-in-touch' });
});
