---
title: Språkpolicy
tags: [leder, arkitekt, utvikler]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Språkpolicy: norsk prosa, engelske termer

**Hvem denne siden er for:** alle som skriver i eller ut fra denne veiledningen: interne retningslinjer, instruksjonsfiler, kurs, e-poster til utviklere. Policyen er kort, og den finnes fordi oversatte produktnavn skaper feil som er vanskelige å finne igjen.

## Regelen

1. **Prosa på norsk bokmål.** Forklaringer, begrunnelser, beslutninger, sjekklister.
2. **Produktnavn på engelsk, slik produsenten skriver dem.** GitHub Copilot, Copilot CLI, Power Apps Code Apps, Power Platform admin center, Managed Environments, environment group, connection reference, Conditional Access. Ikke «miljøgruppe», ikke «tilkoblingsreferanse», selv om det frister.
3. **UI-etiketter på engelsk, i anførselstegn eller fet, nøyaktig som på skjermen.** «Enable code apps», **Settings** > **Product** > **Features**. Da finner leseren det igjen, og du finner det igjen når skjermen endrer seg.
4. **Kommandoer, pakkenavn, filnavn og kode på engelsk, i kodeformat.** `pa app push`, `@microsoft/power-apps-cli`, `power.config.json`.
5. **Prompter til Copilot skrives på engelsk.** Modellene er trent mest på engelsk, dokumentasjonen agenten leser er engelsk, og kodebasen er engelsk. En norsk prompt fungerer, men gir jevnt over dårligere treff på produktspesifikke termer. Unntaket er når prompten skal produsere norsk tekst til sluttbrukere.
6. **Instruksjonsfiler i repoet (`copilot-instructions.md`, `AGENTS.md`) skrives på engelsk**, av samme grunn, med norske kommentarer der teamet trenger det.

## Ordlisten

[Ordlisten](../ordliste.md) gir den norske forklaringen av hvert engelsk begrep, slik at ingen trenger å gjette. Når du innfører et nytt begrep i en side, skriv det engelske navnet først og forklar det på norsk i samme setning.

## Hvorfor

En oversatt term er en term ingen kan søke etter. «Miljøgruppe» finnes ikke på Microsoft Learn, i admin-senteret eller i en feilmelding. Når noe går galt klokken fire på en fredag, er det den engelske termen som fører til svaret. Prosaen på norsk er der fordi målgruppen er norsk og fordi begrunnelser og beslutninger skal leses av folk som ikke er utviklere.

## Neste steg

Les [Ordlisten](../ordliste.md) én gang. Så [EU AI Act, rollen som deployer](eu-ai-act-rolle.md), der policyen settes på prøve: «deployer» er et juridisk begrep fra forordningen, og det oversettes ikke.
