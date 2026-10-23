---
title: For utvikleren
tags: [utvikler]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Lesesti for utvikleren

**Hvem denne siden er for:** deg som skal bygge Power Apps Code Apps med GitHub Copilot som verktøy. Du er vant til VS Code, Git og npm. Power Platform er kanskje nytt, og det er greit: Code Apps er en vanlig Vite-app pluss et lite lag som kobler den til plattformen.

## Det du kan etter stien

- Sette opp maskinen med Copilot CLI, `pa`-CLI-en og Power Platform Skills-pluginen.
- Gå fra tom mappe til publisert app med Copilot som agent, og forstå hva som skjedde underveis.
- Jobbe i en daglig loop der Copilot skriver, du reviewer, og plattformen håndhever reglene.
- Vite hva som hører hjemme i instruksjonsfilene, hva du aldri lar Copilot gjøre, og hvor du finner feilsøkingen.

## Les i denne rekkefølgen

| # | Side | Du sitter igjen med |
|---|---|---|
| 1 | [Produktene, hva er hva](produktene.md) | Hvilken CLI som er hvilken: `copilot`, `pa`, og hvorfor `ms` ikke angår deg |
| 2 | [Oppsett av maskinen](../arbeidsflyt/oppsett-maskin.md) | Node, Git, Copilot CLI, `pa`, innlogging og nettleserens spørsmål om lokalt nettverk |
| 3 | [Hurtigstart](../arbeidsflyt/hurtigstart.md) | Fra tom mappe til publisert app, med terminalbilde av hvert steg |
| 4 | [Skills og plugins](../arbeidsflyt/skills-og-plugins.md) | Power Platform Skills-markedsplassen og hvilken plugin som gjelder hvilken apptype |
| 5 | [Rammeverk](../arbeidsflyt/rammeverk.md) | React-malen og de andre Vite-rammeverkene som er testet |
| 6 | [Datakilder](../arbeidsflyt/datakilder.md) | Dataverse og SharePoint gjennom connectorer, delegering og grensen på ti connectorer |
| 7 | [Daglig loop](../arbeidsflyt/daglig-loop.md) | Oppgave, plan, prompt, review, test, push |
| 8 | [Instruksjonsfiler](../arbeidsflyt/instructions-og-agents.md) | Hva som hører hjemme i `copilot-instructions.md` og `AGENTS.md` for en Code App |
| 9 | [Review-regler](../arbeidsflyt/review-regler.md) | Hva du sjekker i kode Copilot har skrevet før du pusher |
| 10 | [Grenser](../arbeidsflyt/grenser.md) | Hva Copilot ikke får gjøre i dette oppsettet |
| 11 | [Hemmeligheter](../sikkerhet/hemmeligheter.md) | Hvor hemmeligheter ikke skal ligge, og hvorfor `.env` ikke er nok |
| 12 | [Feilsøking](../arbeidsflyt/feilsoking.md) | Kjente feil og omveier |

## Lab før produksjon

Alle kommandoer i stien er kjørt i en lab før de ble publisert, med versjonsnummer oppgitt på siden. Kjør dem selv i et personlig utviklermiljø før du prøver i et miljø andre bruker. [Hvem får bygge](../styring/hvem-faar-bygge.md) forklarer hvorfor `pa app init` kan feile i et miljø der Code Apps ikke er slått på.

## Neste steg

Gå til [Oppsett av maskinen](../arbeidsflyt/oppsett-maskin.md). Det tar et kvarter, og alt etterpå forutsetter det.
