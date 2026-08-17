import Component from '@glimmer/component';
import AppCard from 'learn-ember-js/components/app-card';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
import { on } from '@ember/modifier';
import ApplicationFilter from 'learn-ember-js/components/application/filter';

export default class AppList extends Component {
  @tracked query = '';

  @action
   updateQuery(event) {
     let formData = new FormData(event.currentTarget);
     this.query = formData.get('application-search-term');
   }
 
   @action
   handleSubmit(event) {
     event.preventDefault();
     this.updateQuery(event);
   }
   
  <template>
    <div class="applications">
      <form {{on "input" this.updateQuery}} {{on "submit" this.handleSubmit}}>
        <label>
          <span>Where would you like to stay?</span>
          <input name="application-search-term" class="light">
        </label>
        <p>The results below will update as you type.</p>
        <p>débug: {{this.query}}</p>
      </form>

      <ul class="results">
        <ApplicationFilter @apps={{@applications}} @query={{this.query}} as |apps|>
                  {{#each apps as |application|}}
            <li><AppCard @application={{application}} /></li>
          {{/each}}
        </ApplicationFilter>
      </ul>
    </div>
  </template>
}