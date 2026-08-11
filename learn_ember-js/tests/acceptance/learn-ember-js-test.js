import { module, test } from 'qunit';
import { visit, currentURL, click } from '@ember/test-helpers';
import { setupApplicationTest } from 'learn-ember-js/tests/helpers';

module('Acceptance | learn ember js', function (hooks) {
  setupApplicationTest(hooks);

  test('visiting /', async function (assert) {
    await visit('/');

    assert.strictEqual(currentURL(), '/');
    assert.dom('h2').hasText('Offpunk');

    assert.dom('.jumbo a.button').hasText('À propos');
    await click('.jumbo a.button');

    assert.strictEqual(currentURL(), '/about');
  });

  test('visiting /about', async function (assert) {
      await visit('/about');
  
      assert.strictEqual(currentURL(), '/about');
      assert.dom('h2').hasText('À propos');
  
      assert.dom('.jumbo a.button').hasText('Contact');
      await click('.jumbo a.button');
  
      assert.strictEqual(currentURL(), '/getting-in-touch');
    });
  
    test('visiting /getting-in-touch', async function (assert) {
      await visit('/getting-in-touch');
  
      assert.strictEqual(currentURL(), '/getting-in-touch');
      assert.dom('h2').hasText('Nous contacter');
  
      assert.dom('.jumbo a.button').hasText('À propos');
      await click('.jumbo a.button');
  
      assert.strictEqual(currentURL(), '/about');
    });
});
