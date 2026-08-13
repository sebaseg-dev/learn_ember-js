import Jumbo from 'learn-ember-js/components/jumbo';
import RentalImage from 'learn-ember-js/components/application/image';
import Map from 'learn-ember-js/components/map';
import ShareButton from 'learn-ember-js/components/share-button';

<template>
  <Jumbo>
      <h2>{{@app.title}}</h2>
      <p>Their HQ are located in {{@app.city}}.</p>
      <ShareButton
        @text="Check out {{@rental.title}} on Super Rentals!"
        @hashtags="vacation,travel,authentic,blessed,superrentals"
        @via="emberjs"
      >
        Share on Twitter
      </ShareButton>
    </Jumbo>
  
    <article class="application detailed">
      <RentalImage
        src={{@app.image}}
        alt="A picture of {{@app.title}}"
      />
  
      <div class="details">
        <h3>About {{@app.title}}</h3>
  
        <div class="detail overproduction">
          <span>Owner:</span> {{@app.overproduction}}
        </div>
        <div class="detail type">
          <span>Type:</span> {{@app.type}} – {{@app.category}}
        </div>
        <div class="detail offline">
          <span>Location:</span> {{@app.offline}}
        </div>
        <div class="detail ownership">
          <span>Number of bedrooms:</span> {{@app.ownership}}
        </div>
        <div class="detail description">
          <p>{{@app.description}}</p>
        </div>
      </div>
  
      <Map
        @lat={{@app.location.lat}}
        @lng={{@app.location.lng}}
        @zoom="12"
        @width="894"
        @height="600"
        alt="A map of {{@app.title}}"
        class="large"
      />
    </article>
</template>
