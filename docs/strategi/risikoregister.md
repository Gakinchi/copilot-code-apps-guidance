---
title: Risikoregister
tags: [leder, arkitekt]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Risikoregister: det ledelsen må ta stilling til

**Hvem denne siden er for:** ledelsen og den som eier risikoregisteret i virksomheten. Hver risiko har en eier, et tiltak og en side i veiledningen som beskriver tiltaket. Kopier tabellen inn i virksomhetens eget register fra [verktøykassen](../verktoykasse/index.md) når malen kommer, og fyll inn navn.

## Registeret

| # | Risiko | Produkt / aktør | Sannsynlighet uten tiltak | Konsekvens | Tiltak | Eier | Side |
|---|---|---|---|---|---|---|---|
| R1 | Kode, prompter eller filer med forretningshemmeligheter sendes til en modell utenfor virksomheten | Copilot, utvikleren | Høy | Høy | Content exclusions for sensitive repoer; policy for hvilke modeller som er tillatt; opplæring i hva en prompt inneholder; databehandleravtale lest | Copilot-admin, personvernombud | [Dataflyt til modellen](../sikkerhet/dataflyt-til-modellen.md), [GDPR og EU-datagrense](../norge/gdpr-og-eu-datagrense.md) |
| R2 | Hemmeligheter (nøkler, tilkoblingsstrenger) havner i repo, i `power.config.json` eller i en prompt | Utvikleren | Middels | Høy | Secret scanning i GitHub; regel om at Code Apps aldri bruker egne hemmeligheter, bare connectorer; review | Copilot-admin, teamleder | [Hemmeligheter](../sikkerhet/hemmeligheter.md) |
| R3 | AI-skrevet kode merges uten reell gjennomlesning | Utvikleren, teamet | Høy | Middels | Branch-beskyttelse, pull request med reviewer, tester i CI, review-regler for AI-skrevet kode | Teamleder | [Review-regler](../arbeidsflyt/review-regler.md) |
| R4 | En Code App kobles til en datakilde DLP ikke tillater, eller omgår styringen | Utvikleren, Copilot | Lav | Høy | DLP håndheves av plattformen ved kjøring; regler i instruksjonsfilen; test av DLP før pilot | Plattform-admin | [DLP og Code Apps](../sikkerhet/dlp-og-code-apps.md) |
| R5 | Apper bygges på preview-funksjoner som endres eller forsvinner | Arkitekten | Middels | Middels | Produktstatus sjekkes før løfter; preview brukes bare i sone 1 og 2; kildemerking i intern dokumentasjon | Arkitekten | [Seks måter å bygge en app](../start/seks-mater.md), [Oppdateringstakt](../drift/oppdateringstakt.md) |
| R6 | CLI, plugin eller SDK endrer seg, og interne guider blir feil | Alle | Høy | Lav | Daterte guider; ny kjøring av hurtigstarten ved hovedversjoner; stale-sjekk kvartalsvis | CoE | [Metode](../veiledningen/metode.md) |
| R7 | Sluttbrukere mangler lisens, og appen stopper i produksjon | Lisensansvarlig | Middels | Middels | Lisenssjekk per bruker før deling; auto-claim vurdert; overvåking | Lisensansvarlig | [Lisensmodell](lisensmodell.md) |
| R8 | Regulatoriske plikter under EU AI Act og GDPR har ingen eier | Ledelsen | Middels | Høy | Rolle som deployer dokumentert; artikkel 4-opplæring; klassifisering av nye apper; personvernombud involvert | Etterlevelsesansvarlig | [EU AI Act](../norge/eu-ai-act-rolle.md) |
| R9 | Apper uten eier etter at utvikleren slutter | Teamleder | Middels | Middels | Repo i organisasjonens GitHub, ikke personlig konto; eier i solution; rutine for foreldreløse apper | Plattform-admin | [Reaktiv styring](../styring/reaktiv-styring.md) |
| R10 | Kompetansen forvitrer: utviklere som ikke lenger forstår koden agenten skrev | Teamleder | Middels | Middels | Review-regler som krever forklaring; opplæring; champions; måling av support-spørsmål | Adopsjonsleder | [AI-kompetanse](../beredskap/ai-kompetanse.md) |
| R11 | Kostnadene for Copilot-kreditter eller pay-as-you-go løper fra budsjettet | Lisensansvarlig | Middels | Lav | Måling i pilot før plan velges; usage metrics ukentlig; forbruksgrenser | Lisensansvarlig | [KPI-er](kpier.md) |
| R12 | Styringsendring (ny DLP-policy) suspenderer flyter og apper i produksjon | Plattform-admin | Middels | Høy | Forhåndsvis effekt før publisering; akseptert risiko signert per flyt | Plattform-admin | [DLP og Code Apps](../sikkerhet/dlp-og-code-apps.md) |

## Risikoene som er annerledes med AI

R1, R3 og R10 er de nye. De andre finnes uansett hvem som skriver koden. Legg merke til at ingen av de tre løses med teknologi alene: R1 trenger en policy og en samtale med personvernombudet, R3 trenger en arbeidsflyt teamet faktisk følger, R10 trenger opplæring og en kultur der man spør.

## Det som ikke er en risiko, selv om det føles sånn

- **At Copilot «finner på» en connector.** Plattformen avviser den ved kjøring. Det er irriterende, ikke farlig.
- **At appen kjører i brukerens nettleser.** Det gjør canvas-apper også. Det som må håndheves utenfor nettleseren, legges i Dataverse eller en flyt, og det er en designregel, ikke en risiko.
- **At utviklere får for mye makt.** Sone 3 krever pipeline og service principal; ingen pusher til produksjon fra laptopen. Se [Soner](../styring/soner.md).

## Neste steg

[KPI-er](kpier.md): tallene som viser om tiltakene virker. [Plan 30-90-180](30-90-180.md): når hvert tiltak settes i verk.
