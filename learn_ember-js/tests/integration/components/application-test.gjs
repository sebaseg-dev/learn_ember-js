import { module, test } from 'qunit';
import { setupRenderingTest } from 'learn-ember-js/tests/helpers';
import { render } from '@ember/test-helpers';
import Application from 'learn-ember-js/components/application';

module('Integration | Component | application', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders information about an application', async function (assert) {

    await render(<template><Application /></template>);

    assert.dom('article').hasClass('application');
    assert.dom('article h3').hasText('Spotify');
    assert.dom('article .detail.over-production').includesText('🔴 favorise l\'IA dans la création musicale');
    assert.dom('article .detail.personal-data').includesText('🔴 récolte beaucoup de metrics sur les utilisateurs');
    assert.dom('article .detail.offline').includesText('🟠 permet l\'écoute hors-ligne mais nécessite une reconnexion régulière');
    assert.dom('article .detail.ownership').includesText('🔴 abonnement sans aucun transfert');
    assert.dom('article .image').exists();
  });
});
