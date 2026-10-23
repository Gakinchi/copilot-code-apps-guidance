---
title: Review-regler
tags: [utvikler]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Review-regler for AI-skrevet kode

**Hvem denne siden er for:** den som reviewer en pull request der Copilot har skrevet mesteparten, og teamlederen som skal gjøre reglene til teamets. Utgangspunktet er enkelt: AI-skrevet kode reviewes som annen kode. Det som er annerledes, er hva som typisk går galt, og at den som åpnet PR-en kanskje ikke har lest alt selv.

## Reviewerens fem spørsmål

1. **Kan forfatteren forklare det?** Spør om én valgt del av diffen. Et «Copilot foreslo det» uten mer, er en PR som går tilbake.
2. **Stemmer diffen med planen?** PR-beskrivelsen har planen. Alt som ikke står i den, skal være forklart under «avvik».
3. **Er det noe nytt i `power.config.json` eller `generated/`?** En ny connector eller datakilde er en styringsbeslutning, ikke en kodeendring. Sjekk at den er tillatt i miljøet før merge; se [DLP](../sikkerhet/dlp-og-code-apps.md).
4. **Tester testene noe?** Les dem. En test uten en påstand som kan feile, er ikke en test.
5. **Er det noe som ikke hører hjemme i en nettleser?** Hemmeligheter, autorisasjonslogikk som bare finnes i frontend, direkte kall til API-er utenom connectorer.

## Det som typisk går galt med Code Apps

| Mønster | Hva du ser | Hvorfor det er feil |
|---|---|---|
| `await getContext()` før render | Appen henger på en hvit side utenfor Power Apps-spilleren | `getContext()` løses bare inne i spilleren. Hent kontekst etter første render, eller håndter at den ikke kommer |
| Ruter uten hash | `react-router` med `BrowserRouter` | Publisert app kjører under en relativ base uten SPA-fallback; bruk hash-ruting |
| Ny npm-pakke for noe plattformen gjør | En HTTP-klient mot et API som finnes som connector | Omgår DLP og identitet. Bruk connectoren |
| Filtrering på klienten over hele tabellen | `.filter()` på resultatet av en henting uten filter | Henter bare de første 500 eller 2000 radene; delegering må skje i spørringen. Se [Datakilder](datakilder.md) |
| Hardkodet miljøverdi | SharePoint-URL i koden | Skal være environment variable; se [ALM](../drift/alm-for-code-apps.md) |
| Rolle-sjekk bare i UI | «Hvis admin, vis knappen» | Appen kjører i brukerens nettleser. Håndheving skjer i Dataverse eller flyten |
| Catch som svelger feil | `catch (e) {}` eller logging uten rethrow | Brukeren får en tom liste i stedet for en feil, og ingen ser det i Monitor |

## Det som typisk går galt med agenter generelt

- **Forandringer utenfor oppgaven.** Agenten «rydder» mens den er der. Be om at det skilles ut i egen PR.
- **Gjenoppfunne hjelpefunksjoner.** Koden har allerede en `formatDate`; agenten lagde en til. Søk.
- **Kommentarer som beskriver hva koden gjør, ikke hvorfor.** Fjern dem.
- **Tester som speiler implementasjonen.** Kjør testen mot en bevisst feil for å se om den fanger den.
- **Avhengighetsoppgraderinger som følger med.** `package-lock.json` endret uten at oppgaven krevde det.

## Branch-beskyttelse som håndhever reglene

Reglene over er vaner. Det som faktisk håndheves, er branch-beskyttelsen: PR påkrevd, minst én reviewer som ikke er forfatteren, CI grønn, ingen push til `main`. En agent kan åpne en PR, men ikke merge den. [Repo-konvensjoner](repo-konvensjoner.md).

Copilot code review kan brukes som første pass hvis policyen tillater det, med [instruksjonsfilen](instructions-og-agents.md) som regler. Det erstatter ikke den menneskelige revieweren; det gjør at den menneskelige revieweren slipper å peke på det åpenbare.

## Når revieweren sier nei

Si hva som mangler, ikke hva som er dumt. «Forklar hvorfor connectoren ble lagt til, og få den bekreftet mot DLP før vi merger» er en review. «Dette ser AI-generert ut» er det ikke.

## Neste steg

[Grenser](grenser.md) for hva agenten ikke får gjøre i utgangspunktet. [Daglig loop](daglig-loop.md) for hvor i loopen review sitter.

## Kilder

- Microsoft Learn, Power Apps coding guidelines: https://learn.microsoft.com/power-apps/guidance/coding-guidelines/overview (lest 2026-10-23)
- Microsoft Learn, Power Apps code apps architecture (runtime i spilleren): https://learn.microsoft.com/power-apps/developer/code-apps/architecture (lest 2026-10-23)
- Mønstrene er observert i labkjøringer av sju Vite-rammeverk med Code Apps og i workshoper i 2026.
