# learn_ember-js

following official tutorial on https://guides.emberjs.com/release/tutorial/

## Initialisation of the Ember project in a sub-directory

_Needs `ember-cli` installed._

```bash
ember new learn_ember-js --lang fr --strict --skip-git
```

## Start the project in development mode

```bash
cd ./learn_ember-js
npm start
```

Development server is accessible at: `localhost:4200`

## Reading notes

### Part 1 – Component Basics

![Part 1 – Components Basics](./assets/tuto_part1_components-basics.webp)

### Part 1 – More about components

![Part 1 – More about components](./assets/tuto_part1_components-more.webp)

### Part 1 – Interactive components

On peut wrapper nos composants dans une classe JS:

```js
import Component from '@glimmer/component';

export default class ImageComponent extends Component {
  constructor(...args) {
    super(...args);
    this.isLarge = false;
  }

  <template></template>
}
```

qui peut s'écrire de manière concise:

```js
import Component from '@glimmer/component';

export default class ImageComponent extends Component {
  isLarge = false;

  <template></template>
}
```

que l'on peut passer en valeur de `state` avec `@tracked` et ajouter une `method` avec `@action`:

```js
export default class ImageComponent extends Component {
  @tracked isLarge = false;

  @action toggleSize() {
    this.isLarge = !this.isLarge;
  }

  <template></template>
}
```

> Lorsqu'une `@tracked` change, Ember re-rend tous les `templates` qui en dépendent.

**Syntaxe** du `if/else` et du `if` _inline_:

```js
<template>
      <button type="button" class="image {{if this.isLarge "large"}}" {{on "click" this.toggleSize}}>
        <img ...attributes>
        {{#if this.isLarge}}
          <small>View Smaller</small>
        {{else}}
          <small>View Larger</small>
        {{/if}}
      </button>
  </template>
```

**Syntaxe** qui existe aussi en ternaire:

```js
<small>View {{if this.isLarge "Smaller" "Larger"}}</small>
```

