import { module, test } from 'qunit';
import { setupRenderingTest } from 'learn-ember-js/tests/helpers';
import { render } from '@ember/test-helpers';
import AppCard from 'learn-ember-js/components/app-card';
import { tracked } from '@glimmer/tracking';

module('Integration | Component | application', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders information about an application', async function (assert) {
    class State { 
      @tracked application = {
        id: 'spotify',
        title: 'Spotify',
        overproduction: '🔴 favorise l\'IA dans la création musicale',
        offline: '🟠 permet l\'écoute hors-ligne mais nécessite une reconnexion régulière',
        location: {
          lat: 59.334591,
          lng: 18.063240,
        },
        category: 'Music',
        ownership: '🔴 abonnement sans aucun transfert',
        image: 'https://s1.qwant.com/thumbr/474x474/9/f/c4994037cea80b3ce38d6687c542a207e503624ed96a7e20513b23519b1965/OIP.PM_BT3OFH23hykQ_TpVdzgHaHa.jpg?u=https%3A%2F%2Ftse.mm.bing.net%2Fth%2Fid%2FOIP.PM_BT3OFH23hykQ_TpVdzgHaHa%3Fpid%3DApi&q=0&b=1&p=0&a=0',
        description: 'This grand old mansion sits on over 100 acres of rolling hills and dense redwood forests.',
        type: '🎵 Musique',
      };
    };

    const state = new State();

    await render(<template><AppCard @application={{state.application}} /></template>);
    assert.dom('article').hasClass('application');
    assert.dom('article h3').hasText('Spotify');
    assert.dom('article h3 a').hasAttribute('href', '/application/spotify');
    assert.dom('article .detail.overproduction').includesText('🔴 favorise l\'IA dans la création musicale');
    assert.dom('article .detail.personaldata').includesText('Catégorie:');
    assert.dom('article .detail.offline').includesText('🟠 permet l\'écoute hors-ligne mais nécessite une reconnexion régulière');
    assert.dom('article .detail.ownership').includesText('🔴 abonnement sans aucun transfert');
    assert.dom('article .image').exists();
    assert.dom('article .map').exists();
  });
});
