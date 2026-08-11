import { pageTitle } from 'ember-page-title';
import { WelcomePage } from 'ember-welcome-page';

<template>
  {{pageTitle "LearnEmberJs"}}

  {{outlet}}

  {{! The following component displays Ember's default welcome message. }}
  {{!-- <WelcomePage @extension="gjs" /> --}}
  {{! Feel free to remove this! }}
  Hello world!
</template>
