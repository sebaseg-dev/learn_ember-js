import { LinkTo } from '@ember/routing';

<template>
  <div class="jumbo">
    <div class="right manifesto"></div>
    <h2>À propos</h2>
    <p>
      Ce projet à pour but de suivre le tutoriel d'<a
        href="https://guides.emberjs.com/release/tutorial/"
        target="_blank"
        rel="noopener noreferrer"
      >Ember.js</a>.
    </p>
    <LinkTo @route="contact" class="button">Contact</LinkTo>
  </div>
</template>
