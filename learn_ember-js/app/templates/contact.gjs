import { LinkTo } from '@ember/routing';
import Jumbo from 'learn-ember-js/components/jumbo';

<template>
  <Jumbo>
    <h2>Nous contacter</h2>
    <p>
      Nous serions ravis d'avoir de vos nouvelles.
    </p>
    <address>
      Offpunk
      <p>
        chez Ploum<br />
        en Belgique
      </p>
      <a href="tel:003242424242">+32 42 42 42 42</a><br />
      <a href="mailto:contact@mail.com">contact@mail.com</a><br />
      <a href="gemini://capsule.com">gemini</a>
    </address>
    <LinkTo @route="about" class="button">À propos</LinkTo>
  </Jumbo>
</template>
