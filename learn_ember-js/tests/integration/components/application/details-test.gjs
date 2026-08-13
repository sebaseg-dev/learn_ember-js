import { module, test } from 'qunit';
import { setupRenderingTest } from 'learn-ember-js/tests/helpers';
import { render } from '@ember/test-helpers';
import Details from 'learn-ember-js/components/application/details';
import { tracked } from '@glimmer/tracking';

class State {
  @tracked app = {};
}

const state = new State();

module('Integration | Component | application/details', function (hooks) {
  setupRenderingTest(hooks);

  hooks.beforeEach(function () {
    state.app = {
      "title": "Spotify",
      "type": '🎵 Musique',
      "overproduction": "🔴 favorise l'IA dans la création musicale",
      "offline": "🟠 permet l'écoute hors-ligne mais nécessite une reconnexion régulière",
      "location": {
        "lat": 59.334591,
        "lng": 18.063240
      },
      "category": "Music",
      "personaldata": "🔴 récolte beaucoup de metrics sur les utilisateurs",
      "ownership": "🔴 abonnement sans aucun transfert",
      "image": "https://s1.qwant.com/thumbr/474x474/9/f/c4994037cea80b3ce38d6687c542a207e503624ed96a7e20513b23519b1965/OIP.PM_BT3OFH23hykQ_TpVdzgHaHa.jpg?u=https%3A%2F%2Ftse.mm.bing.net%2Fth%2Fid%2FOIP.PM_BT3OFH23hykQ_TpVdzgHaHa%3Fpid%3DApi&q=0&b=1&p=0&a=0",
      "description": "This grand old mansion sits on over 100 acres of rolling hills and dense redwood forests.",
      "city": "Stockholm"
    };
  });


  test('it renders a header with a share button', async function (assert) {
    await render(<template>
      <Details @app={{state.app}} />
    </template>);

    assert.dom('.jumbo').exists();
    assert.dom('.jumbo h2').containsText('Spotify');
    assert
      .dom('.jumbo p')
      .containsText('Their HQ are located in Stockholm.');
    assert.dom('.jumbo a.button').containsText('Share on Twitter');
  });

  test('it renders detailed information about an application', async function (assert) {
    await render(<template>
      <Details @app={{state.app}} />
    </template>);

    assert.dom('article').hasClass('application');
    assert.dom('article h3').containsText('About Spotify');
    assert.dom('article .detail.overproduction').containsText('🔴 favorise l\'IA dans la création musicale');
    assert.dom('article .detail.type').containsText('🎵 Musique – Music');
    assert.dom('article .detail.offline').containsText('🟠 permet l\'écoute hors-ligne mais nécessite une reconnexion régulière');
    assert.dom('article .detail.ownership').containsText('🔴 abonnement sans aucun transfert');
    assert.dom('article .image').exists();
    assert.dom('article .map').exists();
  });
});
