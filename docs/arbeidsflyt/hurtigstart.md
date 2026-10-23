---
title: Hurtigstart
tags: [utvikler]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Hurtigstart: fra tom mappe til publisert Code App med Copilot CLI

**Hvem denne siden er for:** utvikleren som har gjort [Oppsett av maskinen](oppsett-maskin.md) og vil se hele løpet én gang før den daglige loopen. Alt under er kjørt i en lab 2026-10-23 med Copilot CLI 1.0.61, `pa` 1.3.0 og pluginen `code-apps-preview` 1.1.0. Siden følger Microsoft Learns quickstart steg for steg, med det som faktisk skjedde i terminalen.

!!! warning "Før du starter"
    Du trenger et miljø der **Enable code apps** er på, maker-rolle i det miljøet, og miljø-ID-en. Finn ID-en i maker-portalen under **Session details**, eller be admin. Uten den stopper steg 4. Se [Hvem får bygge](../styring/hvem-faar-bygge.md).

## Steg 1: installer pluginen

Utenfor en Copilot-økt:

```bash
copilot plugin marketplace add microsoft/power-platform-skills
copilot plugin install code-apps-preview@power-platform-skills
```

Sjekk: `copilot plugin list` viser `code-apps-preview@power-platform-skills`. Start Copilot på nytt hvis økten var åpen.

<!-- bilde: 01-plugin-install.png -->

## Steg 2: start Copilot i en tom mappe

```bash
mkdir my-app && cd my-app
copilot
```

Sjekk: prompten viser Copilot-økten, og `/plugin` lister pluginen som aktiv.

## Steg 3: kjør `create-app`-skillen

```text
/code-apps-preview:create-app
```

Agenten sjekker først forutsetningene: Node, `pa`, innlogging mot riktig tenant. Mangler noe, installerer eller forklarer den. Så ber den deg beskrive appen.

Sjekk: agenten bekrefter at forutsetningene er på plass og spør hva du vil bygge.

## Steg 4: beskriv appen, med miljø-ID

Skriv på engelsk, konkret, og ta med miljøet. Eksempelet fra laben:

```text
Create an app that shows my colleagues from Office 365 Users in a searchable list.
Selecting a person shows their name, title, department, e-mail and phone.
Deploy to environment: <environment-id>
```

Agenten identifiserer datakilden (Office 365 Users-connectoren), UI-et og interaksjonene, stiller eventuelle oppfølgingsspørsmål og viser en plan.

Sjekk: planen nevner connectoren du forventet og ingen andre. Nevner den en connector du ikke ba om, si fra før du godkjenner.

<!-- bilde: 04-plan.png -->

## Steg 5: godkjenn planen og se på

Når du godkjenner, kjører agenten `pa`-kommandoene for deg: scaffold av prosjektet, `pa app init` mot miljøet, `pa app add data-source` for connectoren, og så skriver den koden.

Sjekk: mappen har `power.config.json`, `generated/` med typet tjeneste for connectoren, og `src/` med appen. Ingen hemmeligheter i noen av filene.

<!-- bilde: 05-build.png -->

## Steg 6: kjør lokalt

Agenten spør om du vil kjøre appen. Ja, eller kjør selv:

```bash
pa app run
```

Vite-pluginen skriver ut en **Local Play**-URL. Åpne den i samme nettleserprofil som du er logget inn i Power Platform med. Første gang spør nettleseren om tilgang til lokalt nettverk; godta.

Sjekk: appen vises i Power Apps-spilleren med data fra tenanten din. Lokalt er det din egen bruker som henter dataene.

<!-- bilde: 06-run.png -->

## Steg 7: publiser

Agenten spør om den skal deploye. Ja, eller selv:

```bash
npm run build
pa app push
```

Sjekk: `pa app push` svarer «App pushed successfully» med en URL til appen i Power Apps. Åpne make.powerapps.com, velg miljøet, og se appen under Apps med typen Code.

<!-- bilde: 07-push.png -->

## Steg 8: del appen

```bash
pa app share --principal <bruker@organisasjon.no> --access play
```

Eller del fra maker-portalen som for andre apper. Brukeren trenger Power Apps Premium, pay-as-you-go eller App Pass, og egen tilgang til datakilden.

Sjekk: brukeren åpner URL-en og ser appen. Første gang får brukeren et samtykkevindu som lister connectorene appen bruker.

## Hva som nettopp skjedde

Du skrev ingen scaffold, ingen datakobling og ingen deploy-kommando selv. Copilot kjørte `pa`-CLI-en, og Power Platform ga appen identitet, DLP, revisjonslogg, telemetri og deling. Det er fordelingen i resten av veiledningen: agenten skriver, plattformen håndhever, du reviewer.

## Hvis noe feilet

| Melding | Betyr | Gjør |
|---|---|---|
| Code apps er ikke aktivert i miljøet | **Enable code apps** er av | Admin slår på; se [Hvem får bygge](../styring/hvem-faar-bygge.md) |
| Connectoren kan ikke brukes / DLP-konflikt | Connectoren er blokkert i miljøet | Velg en tillatt connector, eller be admin; se [DLP og Code Apps](../sikkerhet/dlp-og-code-apps.md) |
| Tom app i Local Play | Nettleseren blokkerer lokalt nettverk | Godta spørsmålet om Local Network Access |
| `pa` finnes ikke | CLI-en er ikke installert globalt | `npm install --global @microsoft/power-apps-cli` |
| Agenten foreslår `npx power-apps` eller `pac code` | Gammel kunnskap i modellen | Si at CLI-en er `pa`, og legg det i [instruksjonsfilen](instructions-og-agents.md) |

## Claude Code

Samme plugin, samme skill-navn og samme prompt fungerer i Claude Code: start `claude` i stedet for `copilot`. Resten av stegene er like.

## Neste steg

[Daglig loop](daglig-loop.md): det du gjør hver dag etter den første appen. [Instruksjonsfiler](instructions-og-agents.md): slik gjør du at agenten kjenner organisasjonens regler fra første prompt.

## Kilder

- Microsoft Learn, Quickstart: Build a code app with GitHub Copilot: https://learn.microsoft.com/power-apps/developer/code-apps/how-to/quickstart-github-copilot (lest 2026-10-23)
- Microsoft Learn, Power Apps CLI command reference: https://learn.microsoft.com/power-apps/developer/code-apps/reference/cli (lest 2026-10-23)
- Egen test 2026-10-23: Copilot CLI 1.0.61, `pa` 1.3.0, plugin `code-apps-preview` 1.1.0, Node 24.
