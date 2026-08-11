import { module, test } from 'qunit';
import { setupRenderingTest } from 'learn-ember-js/tests/helpers';
import { render } from '@ember/test-helpers';
import ApplicationImage from 'learn-ember-js/components/application/image';

module('Integration | Component | application/image', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders the given image', async function (assert) {
    await render(<template>
      <ApplicationImage
        src="/assets/images/manifesto.png"
        alt="test"
      />
    </template>);

    assert
      .dom('.image img')
      .exists()
      .hasAttribute('src', '/assets/images/manifesto.png')
      .hasAttribute('alt', 'test');
  });
});
