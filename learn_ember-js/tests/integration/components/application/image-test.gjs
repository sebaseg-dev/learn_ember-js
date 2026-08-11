import { module, test } from 'qunit';
import { setupRenderingTest } from 'learn-ember-js/tests/helpers';
import { render, click } from '@ember/test-helpers';
import ApplicationImage from 'learn-ember-js/components/application/image';
import RentalImage from 'learn-ember-js/components/application/image';

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

  test('clicking on the component toggles its size', async function (assert) {
    await render(<template>
      <RentalImage
        src="/assets/images/manifesto.png"
        alt="Manifesto"
      />
    </template>);

    assert.dom('button.image').exists();

    assert.dom('.image').doesNotHaveClass('large');
    assert.dom('.image small').hasText('View Larger');

    await click('button.image');

    assert.dom('.image').hasClass('large');
    assert.dom('.image small').hasText('View Smaller');

    await click('button.image');

    assert.dom('.image').doesNotHaveClass('large');
    assert.dom('.image small').hasText('View Larger');
  });
});
