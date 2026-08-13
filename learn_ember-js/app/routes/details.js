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

export default class DetailsRoute extends Route {
  async model(params) {
    let response = await fetch(`/api/applications/${params.application_id}.json`);
    let { data } = await response.json();

    let { id, attributes } = data;
    let type;

    if (APPLICATION_CATEGORIES.includes(attributes.category)) {
      type = toFrench(attributes.category);
    }

    return { id, type, ...attributes };
  }
}