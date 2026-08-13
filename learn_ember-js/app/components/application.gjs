import ApplicationImage from './application/image';
import Map from './map';
import { LinkTo } from '@ember/routing';

<template>
  <article class="application">
    <ApplicationImage
      src = {{@application.image}}
      alt = {{@application.title}}
    />
      <div class="details">
        <h3>
          <LinkTo @route="details" @model={{@application}}>
            {{@application.title}}
          </LinkTo>
        </h3>
        <div class="detail overproduction">
          <span>Sur-production:</span> {{@application.overproduction}}
        </div>
        <div class="detail personaldata">
          <span>Catégorie:</span> {{@application.type}}
        </div>
        <div class="detail offline">
          <span>Déconnexion:</span> {{@application.offline}}
        </div>
        <div class="detail ownership">
          <span>Propriété du contenu:</span> {{@application.ownership}}
        </div>
      </div>
      <Map
        @lat={{@application.location.lat}}
        @lng={{@application.location.lng}}
        @zoom="9"
        @width="150"
        @height="150"
        alt="A map of {{@application.title}} headquarters"
      />
    </article>
</template>
