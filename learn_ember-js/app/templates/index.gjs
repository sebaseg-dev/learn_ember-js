import { LinkTo } from '@ember/routing';
import Jumbo from 'learn-ember-js/components/jumbo';

<template>
  <Jumbo>
    <h2>Offpunk</h2>
    <p>
      J'ai découvert récemment la philosophie Offpunk, ainsi qu'un
      <a
        href="https://ploum.net/2026-08-03-offpunk_manifesto.html"
        target="_blank"
        rel="noopener noreferrer"
      >manifeste</a>
      . Ce sera la sujet de ce projet.
    </p>
    <LinkTo @route="about" class="button">À propos</LinkTo>
  </Jumbo>
</template>
