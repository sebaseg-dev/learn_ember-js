import { useLegacyStore } from '@warp-drive/legacy';
import { JSONAPICache } from '@warp-drive/json-api';
import { JsonSuffixHandler } from 'learn-ember-js/utils/handlers.js';

const Store = useLegacyStore({
  linksMode: false,
  cache: JSONAPICache,
  handlers: [
    JsonSuffixHandler
  ],
  schemas: [
    // -- your schemas here
  ],
});

export default Store;
