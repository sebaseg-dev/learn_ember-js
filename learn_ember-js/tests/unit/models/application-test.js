import { setupTest } from 'learn-ember-js/tests/helpers';
import { module, test } from 'qunit';

module('Unit | Model | application', function (hooks) {
  setupTest(hooks);

  test('it has the right type', function (assert) {
    const store = this.owner.lookup('service:store');
    let application = store.createRecord('application', {
      id: 'spotify',
      title: 'Spotify',
      overproduction: '🔴 favorise l\'IA dans la création musicale',
      offline: '🟠 permet l\'écoute hors-ligne mais nécessite une reconnexion régulière',
      location: {
        lat: 59.334591,
        lng: 18.063240
      },
      category: 'Music',
      personaldata: '🔴 récolte beaucoup de metrics sur les utilisateurs',
      ownership: '🔴 abonnement sans aucun transfert',
      image: 'https://s1.qwant.com/thumbr/474x474/9/f/c4994037cea80b3ce38d6687c542a207e503624ed96a7e20513b23519b1965/OIP.PM_BT3OFH23hykQ_TpVdzgHaHa.jpg?u=https%3A%2F%2Ftse.mm.bing.net%2Fth%2Fid%2FOIP.PM_BT3OFH23hykQ_TpVdzgHaHa%3Fpid%3DApi&q=0&b=1&p=0&a=0',
      description: 'This grand old mansion sits on over 100 acres of rolling hills and dense redwood forests.',
      city: 'Stockholm'
    });

    assert.strictEqual(application.type, '🎵 Musique');

    application.category = 'Video';
    assert.strictEqual(application.type, '🎬 Vidéo');

    application.category = 'Games';
    assert.strictEqual(application.type, '👾 Jeux');

    application.category = 'Autre valeur';
    assert.strictEqual(application.type, 'Autre valeur');
  });
});
