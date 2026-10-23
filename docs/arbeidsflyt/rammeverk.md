---
title: Rammeverk
tags: [utvikler]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Rammeverk: React-malen og de andre Vite-rammeverkene

**Hvem denne siden er for:** utvikleren som lurer på om teamet må bytte til React for å bygge Code Apps. Svaret er nei. En Code App er en Vite-app pluss tre deler som ikke bryr seg om rammeverket. Alle rammeverkene under er bygget og publisert i oktober 2026.

## Tre deler gjør en Vite-app til en Code App

1. `@microsoft/power-apps`, SDK-pakken koden din importerer.
2. `@microsoft/power-apps-vite`, Vite-pluginen `powerApps()` som setter relative asset-stier, konfigurerer CORS mot spilleren, serverer konfigurasjonen og skriver ut Local Play-URL-en.
3. `power.config.json`, skrevet av `pa app init`.

Ingen av delene er React-spesifikke. Den offisielle malen er React med TypeScript, og den er den raskeste starten fordi alt allerede er koblet.

## Testresultatene

Hvert rammeverk ble scaffoldet med `npm create vite`, fikk pluginen lagt til, ble initialisert med `pa app init`, kjørt med `pa app run`, bygget og publisert med `pa app push` til et testmiljø.

| Rammeverk | Scaffold | Innsats | Bunt | Status |
|---|---|---|---|---|
| React (offisiell mal) | `npx degit github:microsoft/PowerAppsCodeApps/templates/vite my-app` | ingen, alt er koblet | ~218 KB | Publisert |
| Vue | `npm create vite@latest my-app -- --template vue-ts` | én plugin-linje | ~64 KB | Publisert |
| Svelte | `--template svelte-ts` | én plugin-linje | ~30 KB | Publisert |
| Solid | `--template solid-ts` | én plugin-linje | ~14 KB | Publisert |
| Preact | `--template preact-ts` | én plugin-linje | ~17 KB | Publisert |
| Angular | håndbygd Vite-prosjekt med AnalogJS `vite-plugin-angular` | Vite-oppsett for hånd, TypeScript 6.0, uten zone.js | ~92 KB | Publisert |

Buntstørrelsene er hovedfilen i `dist/assets` etter `npm run build`, målt med Vite 8.

## Oppskriften for alle unntatt Angular

```bash
npm create vite@latest my-app -- --template vue-ts
cd my-app && npm install
npm install @microsoft/power-apps
npm install -D @microsoft/power-apps-vite
```

Legg `powerApps()` til i `vite.config.ts`:

```ts
import { powerApps } from '@microsoft/power-apps-vite/plugin'
export default defineConfig({
  plugins: [vue(), powerApps()],
})
```

Så som for React:

```bash
pa app init -n "My App" -e <environment-id>
pa app run
npm run build && pa app push
```

Sjekk: `dist/index.html` refererer `./assets/...` med relative stier. Det er beviset på at pluginen er aktiv.

!!! warning "Windows PowerShell 5.1 og `--`"
    Windows PowerShell 5.1 fjerner en frittstående `--` før npm ser den, og create-vite lager da et vanilla-prosjekt. Bruk PowerShell 7 (`pwsh`), eller skriv `'--'` i anførselstegn.

## Angular er unntaket

Angulars CLI skjuler Vite-konfigurasjonen, så du kan ikke bare legge til en plugin. Du bygger et lite Vite-prosjekt for hånd med `@analogjs/vite-plugin-angular`, og de samme tre delene gjelder. To ting kostet tid: Angular 22 krever TypeScript 6.0, ellers feiler `npm install` på peer-avhengigheter, og Angular 22 er zoneless som standard, så `import 'zone.js'` i `main.ts` får bygget til å feile. Fullstendig oppskrift med alle filene: [Build an Angular Code App on Power Apps with Vite](https://recursion.no/blogs/angular-power-apps-code-app/).

## To regler som gjelder alle rammeverk

- **Ikke vent på SDK-en før du rendrer.** `getContext()` fra `@microsoft/power-apps/app` returnerer et promise som bare løses inne i Power Apps-spilleren. Lokalt henger det for alltid. Kall det etter at første skjerm er oppe.
- **Bruk hash-ruting.** Den publiserte appen kjører under en relativ base uten garantert SPA-fallback for dype stier. Vue Router: `createWebHashHistory()`. Solid: `<HashRouter>`. Angular: `withHashLocation()`. Svelte-spa-router er hash som standard.

## Guidene per rammeverk

Hvert rammeverk har en egen guide med terminalbilde av hvert steg, oppdatert til `pa`-CLI-en i oktober 2026:

- [Pick Any Vite Framework](https://recursion.no/blogs/power-apps/power-apps-code-app-framework/) (oversikten)
- [React](https://recursion.no/blogs/react-power-apps-code-app/), [Vue](https://recursion.no/blogs/vue-power-apps-code-app/), [Svelte](https://recursion.no/blogs/svelte-power-apps-code-app/), [SolidJS](https://recursion.no/blogs/solidjs-power-apps-code-app/), [Preact](https://recursion.no/blogs/preact-power-apps-code-app/), [Angular](https://recursion.no/blogs/angular-power-apps-code-app/)

## For arkitekten

Rammeverket er en teambeslutning, ikke en plattformbegrensning. Velg det teamet vedlikeholder best. Skriv valget inn i repoets instruksjonsfil, slik at Copilot foreslår komponenter i riktig rammeverk; se [Instruksjonsfiler](instructions-og-agents.md).

## Neste steg

[Datakilder](datakilder.md): slik kobler appen seg til Dataverse og SharePoint, uansett rammeverk.

## Kilder

- Microsoft Learn, Quickstart: Create a code app using the Power Apps CLI: https://learn.microsoft.com/power-apps/developer/code-apps/how-to/npm-quickstart (lest 2026-10-23)
- GitHub, microsoft/PowerAppsCodeApps, templates/vite: https://github.com/microsoft/PowerAppsCodeApps/tree/main/templates/vite (lest 2026-10-23)
- Egen test 2026-10-23: seks rammeverk scaffoldet, initialisert, kjørt, bygget og publisert med `pa` 1.3.0, SDK 1.5.0, plugin 1.0.13, Vite 8.
