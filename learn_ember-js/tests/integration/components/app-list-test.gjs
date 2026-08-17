import { module, test } from 'qunit';
import { setupRenderingTest } from 'learn-ember-js/tests/helpers';
import { render, fillIn } from '@ember/test-helpers';
import { tracked } from '@glimmer/tracking';
import AppList from 'learn-ember-js/components/app-list';

class State {
  @tracked appList = [];
}

const state = new State();

module('Integration | Component | app list', function (hooks) {
  setupRenderingTest(hooks);

  hooks.beforeEach(async function () {
    state.appList = [
      {
        id: 'spotify',
        title: 'Spotify',
        type: '🎵 Musique',
        location: { lat: 59.334591, lng: 18.063240 },
        category: 'Music',
        image: 'https://example.com/spotify.png',
        description: 'Description Spotify',
      },
      {
        id: 'qobuz',
        title: 'Qobuz',
        type: '🎵 Musique',
        location: { lat: 48.894533, lng: 2.409630 },
        category: 'Music',
        image: 'https://example.com/qobuz.png',
        description: 'Description Qobuz',
      },
      {
        id: 'netflix',
        title: 'Netflix',
        type: '🎬 Vidéo',
        location: { lat: 37.235808, lng: -121.962375 },
        category: 'Video',
        image: 'https://example.com/netflix.png',
        description: 'Description Netflix',
      },
    ];
  });

  test('it renders all given rental properties by default', async function (assert) {
    await render(<template><AppList @applications={{state.appList}} /></template>);

    assert.dom('.applications').exists();
    assert.dom('.applications input').exists();

    assert.dom('.applications .results').exists();
    assert.dom('.applications .results li').exists({ count: 3 });

    assert
      .dom('.applications .results li:nth-of-type(1)')
      .containsText('Spotify');

    assert
      .dom('.applications .results li:nth-of-type(2)')
      .containsText('Qobuz');

    assert
      .dom('.applications .results li:nth-of-type(3)')
      .containsText('Netflix');
  });

  test('it updates the results according to the search query', async function (assert) {
      await render(<template><AppList @applications={{state.appList}} /></template>);
  
      assert.dom('.applications').exists();
      assert.dom('.applications input').exists();
  
      // Recherche de Qobuz
      await fillIn('.applications input', 'Qobuz');
  
      assert.dom('.applications .results').exists();
      assert.dom('.applications .results li').exists({ count: 1 });
      assert.dom('.applications .results li').containsText('Qobuz');
  
      // Recherche de Spotify
      await fillIn('.applications input', 'Spotify');
  
      assert.dom('.applications .results').exists();
      assert.dom('.applications .results li').exists({ count: 1 });
      assert.dom('.applications .results li').containsText('Spotify');
    });
});