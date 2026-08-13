import { module, test } from 'qunit';
import { visit, find, currentURL, click } from '@ember/test-helpers';
import { setupApplicationTest } from 'learn-ember-js/tests/helpers';

module('Acceptance | learn ember js', function (hooks) {
  setupApplicationTest(hooks);

  test('visiting /', async function (assert) {
    await visit('/');

    assert.strictEqual(currentURL(), '/');
    assert.dom('nav').exists();
    assert.dom('h1').hasText('Offpunk');
    assert.dom('h2').hasText('Offpunk');

    assert.dom('.jumbo a.button').hasText('À propos');
    await click('.jumbo a.button');

    assert.strictEqual(currentURL(), '/about');
  });

  test('viewing the details of a rental property', async function (assert) {
      await visit('/');
      assert.dom('.application').exists({ count: 3 });
  
      await click('.application:first-of-type a');
      assert.strictEqual(currentURL(), '/application/spotify');
    });
  
    test('visiting /application/spotify', async function (assert) {
      await visit('/application/spotify');
  
      assert.strictEqual(currentURL(), '/application/spotify');
      assert.dom('nav').exists();
      assert.dom('h1').containsText('Offpunk');
      assert.dom('h2').containsText('Spotify');
      assert.dom('.application.detailed').exists();
      assert.dom('.share.button').hasText('Share on Twitter');
      
      let button = find('.share.button');
  
      let tweetURL = new URL(button.href);
      assert.strictEqual(tweetURL.host, 'twitter.com');
  
      assert.strictEqual(
        tweetURL.searchParams.get('url'),
        `${window.location.origin}/application/spotify`
      );
    });
  
  test('visiting /about', async function (assert) {
    await visit('/about');

    assert.strictEqual(currentURL(), '/about');
    assert.dom('nav').exists();
    assert.dom('h1').hasText('Offpunk');
    assert.dom('h2').hasText('À propos');

    assert.dom('.jumbo a.button').hasText('Contact');
    await click('.jumbo a.button');

    assert.strictEqual(currentURL(), '/getting-in-touch');
  });

  test('visiting /getting-in-touch', async function (assert) {
    await visit('/getting-in-touch');

    assert.strictEqual(currentURL(), '/getting-in-touch');
    assert.dom('nav').exists();
    assert.dom('h1').hasText('Offpunk');
    assert.dom('h2').hasText('Nous contacter');

    assert.dom('.jumbo a.button').hasText('À propos');
    await click('.jumbo a.button');

    assert.strictEqual(currentURL(), '/about');
  });

  test('navigating using the navbar', async function (assert) {
    await visit('/');

    assert.dom('nav').exists();
    assert.dom('nav a.menu-index').hasText('Offpunk');
    assert.dom('nav a.menu-about').hasText('À propos');
    assert.dom('nav a.menu-contact').hasText('Contact');

    await click('nav a.menu-about');
    assert.strictEqual(currentURL(), '/about');

    await click('nav a.menu-contact');
    assert.strictEqual(currentURL(), '/getting-in-touch');

    await click('nav a.menu-index');
    assert.strictEqual(currentURL(), '/');
  })
  
});
