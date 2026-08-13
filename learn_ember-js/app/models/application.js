import Model, { attr } from '@warp-drive/legacy/model';

const APPLICATION_CATEGORIES = ['Music', 'Video', 'Games'];

export default class ApplicationModel extends Model {
  @attr title;
  @attr overproduction;
  @attr offline;
  @attr location;
  @attr category;
  @attr image;
  @attr ownership;
  @attr description;

  get type() {
    switch (this.category) {
      case 'Music':
        return '🎵 Musique';
      case 'Video':
        return '🎬 Vidéo';
      case 'Games':
        return '👾 Jeux';
      default:
        return this.category;
    }
  }
}