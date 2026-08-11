import ApplicationImage from './application/image';
import Map from './map';

<template>
  <article class="application">
    <ApplicationImage
      src="https://s1.qwant.com/thumbr/474x474/9/f/c4994037cea80b3ce38d6687c542a207e503624ed96a7e20513b23519b1965/OIP.PM_BT3OFH23hykQ_TpVdzgHaHa.jpg?u=https%3A%2F%2Ftse.mm.bing.net%2Fth%2Fid%2FOIP.PM_BT3OFH23hykQ_TpVdzgHaHa%3Fpid%3DApi&q=0&b=1&p=0&a=0"
      alt="Spotify logo"
    />
      <div class="details">
        <h3>Spotify</h3>
        <div class="detail over-production">
          <span>Sur-production:</span> 🔴 favorise l'IA dans la création musicale
        </div>
        <div class="detail personal-data">
          <span>Données personnelles:</span> 🔴 récolte beaucoup de metrics sur les utilisateurs
        </div>
        <div class="detail offline">
          <span>Déconnexion:</span> 🟠 permet l'écoute hors-ligne mais nécessite une reconnexion régulière
        </div>
        <div class="detail ownership">
          <span>Propriété du contenu:</span> 🔴 abonnement sans aucun transfert
        </div>
      </div>
      <Map
        @lat="37.7749"
        @lng="-122.4194"
        @zoom="9"
        @width="150"
        @height="150"
        alt="A map of Grand Old Mansion"
      />
    </article>
</template>
