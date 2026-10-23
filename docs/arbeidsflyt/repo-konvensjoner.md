---
title: Repo-konvensjoner
tags: [utvikler]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Repo-konvensjoner for en Code App

**Hvem denne siden er for:** utvikleren som oppretter repoet, og teamlederen som skal kunne lese alle teamets repoer likt. Konvensjonene er få, og de finnes fordi agenten leser repoet som kontekst: et ryddig repo gir bedre forslag.

## Struktur

```text
<app-navn>/
  .github/
    copilot-instructions.md     regler for Copilot i dette repoet
    workflows/publish.yml       CI og publisering til Dev
    instructions/               valgfritt: stibaserte instruksjoner
    agents/                     valgfritt: egne agenter
  AGENTS.md                     kort, for alle agentverktøy (Copilot CLI, Claude Code)
  README.md                     hva appen er, miljø, eier, hvordan kjøre
  power.config.json             skrives av pa; committes
  generated/                    skrives av pa add data-source; committes
  src/                          koden
  tests/
  package.json  vite.config.ts  tsconfig.json  .nvmrc  .gitignore  .editorconfig
```

## Hva som committes

| Fil | Commit | Hvorfor |
|---|---|---|
| `power.config.json` | Ja | Miljø-ID, app-ID og connection-ID-er. Identifikatorer, ikke hemmeligheter. Uten den kan ingen andre kjøre `pa app run` mot samme app |
| `generated/` | Ja | Typene for connectorene; agenten trenger dem som kontekst, og CI trenger dem for bygg |
| `dist/` | Nei | Bygges i CI |
| `.env*` | Nei | Hemmeligheter, se [Hemmeligheter](../sikkerhet/hemmeligheter.md). Legg `.env.example` uten verdier |
| `node_modules/` | Nei | |
| Copilot-økter og logger | Nei | |

!!! note "power.config.json og flere miljøer"
    Filen peker på ett miljø. Teamets repo peker på teamets Dev-miljø; utviklere som vil kjøre mot eget miljø, bruker `PA_CLI_ENVIRONMENT_ID` lokalt i stedet for å endre filen. Promotering til Test og Prod går via solution og pipeline, ikke via å bytte miljø i filen. Se [ALM](../drift/alm-for-code-apps.md).

## Linjeskift og format

LF i hele repoet (`.gitattributes` med `* text=auto eol=lf`). `.editorconfig` med to mellomrom og UTF-8. Prettier og ESLint fra malen, kjørt i CI. Agenten følger det repoet gjør; er repoet inkonsekvent, blir forslagene det også.

## Node-versjon

`.nvmrc` eller `engines` i `package.json` med LTS-versjonen pipelinen bruker. Samme versjon lokalt og i CI.

## Branches og pull requests

- `main` er beskyttet: PR påkrevd, minst én reviewer, CI grønn, ingen direkte push.
- Branch per oppgave: `feat/avdelingsfilter`, `fix/tom-liste`.
- PR-mal i `.github/pull_request_template.md` med tre felt: oppgaven, planen agenten fulgte, hva som avvek fra planen. [Daglig loop](daglig-loop.md) steg 7.
- Commit-meldinger på det språket teamet skriver kode-kommentarer på; vær konsekvent.

## README

Ti linjer: hva appen gjør, hvem som eier den, hvilket miljø den kjører i (navn, ikke ID), hvordan kjøre lokalt, hvor pipelinen er. README er det første agenten leser, så den skal være sann.

## Navn

Repo-navn lik app-navnet i Power Apps, med små bokstaver og bindestrek. Solution-prefikset i Power Platform står i README. Ingen kundenavn i repo-navn i et konsulenthus; bruk kundens kode.

## Neste steg

[Instruksjonsfiler](instructions-og-agents.md) for innholdet i `copilot-instructions.md` og `AGENTS.md`. [CI/CD](../drift/ci-cd.md) for workflow-filen.

## Kilder

- GitHub Docs, Adding repository custom instructions: https://docs.github.com/en/copilot/how-tos/configure-custom-instructions/add-repository-instructions (lest 2026-10-23)
- Microsoft Learn, Power Apps code apps architecture (power.config.json): https://learn.microsoft.com/power-apps/developer/code-apps/architecture (lest 2026-10-23)
- Konvensjonene er de som er brukt i labkjøringene og workshopene i 2026.
