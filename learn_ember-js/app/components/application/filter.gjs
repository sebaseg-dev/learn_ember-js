import Component from '@glimmer/component';

export default class ApplicationFilter extends Component {
  get results() {
    let { apps, query } = this.args;

    if (query) {
      apps = apps.filter((app) => app.title.includes(query));
    }

    return apps;
  }

  <template>
    {{yield this.results}}
  </template>
}