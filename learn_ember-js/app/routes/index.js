import Route from '@ember/routing/route';

const APPLICATION_CATEGORIES = ['Music', 'Video', 'Games'];

function toFrench(category) {
  switch (category) {
    case 'Music':
      return '🎵 Musique';
    case 'Video':
      return '🎬 Vidéo';
    case 'Games':
      return '👾 Jeux';
    default:
      return category;
  }
}

export default class IndexRoute extends Route {
  async model() {
    let response = await fetch('api/applications.json');
    let { data } = await response.json();
    return data.map((model) => {
      let { attributes } = model;
      let type;

      if (APPLICATION_CATEGORIES.includes(attributes.category)) {
        type = toFrench(attributes.category);
      }

      return {type, ...attributes};
    });
  }
}
