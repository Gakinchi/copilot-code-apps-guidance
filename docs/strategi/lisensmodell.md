---
title: Lisensmodell
tags: [leder, arkitekt]
verifisert: 2026-10-23
kilde: GITHUB DOCS
---

# Lisensmodell: hvem trenger hva

**Hvem denne siden er for:** ledelsen som skal budsjettere, og arkitekten som skal svare på «trenger alle en Copilot-lisens?». Det er to lisensfamilier som ikke har noe med hverandre å gjøre: GitHubs for verktøyet utviklerne bruker, og Microsofts for appene brukerne kjører. Begge må på plass, for ulike mennesker.

!!! warning "Priser er øyeblikksbilder"
    Prisene under er lest på GitHubs prisside 2026-10-23 og gjengis bare for å vise størrelsesorden. Sjekk siden samme dag som du skriver et budsjett, og be Microsoft-partneren om tilbud på Power Platform-lisensene, som varierer med avtale.

## Del 1: GitHub Copilot, for utviklerne

| | Copilot Business | Copilot Enterprise |
|---|---|---|
| Pris (listepris, per tildelt sete per måned) | 19 USD | 39 USD |
| Krever | En GitHub-organisasjon (Team eller Enterprise Cloud) | GitHub Enterprise Cloud |
| Copilot CLI og agent-modus | Ja | Ja |
| Plugins og MCP | Ja | Ja |
| Instruksjonsfiler i repo | Ja | Ja |
| Premium-forespørsler per bruker per måned | 1 900 AI-kreditter | 3 900 AI-kreditter, prioritert tilgang til premium-modeller |
| Policyer og sentral styring | Per organisasjon | Per enterprise, arver ned til organisasjonene |
| Usage metrics og audit log | Ja | Ja, pluss enterprise-nivå |

Hvem trenger sete: utviklerne som skal bygge Code Apps, champions, og den som skal lage og vedlikeholde instruksjonsfiler og prompter. Ikke sluttbrukerne av appene, ikke ledelsen, ikke admin som bare skal se metrikker (organisasjonseiere ser dem uten sete).

Velg **Business** hvis organisasjonen ikke allerede har GitHub Enterprise Cloud; policyene du trenger for piloten finnes der. Velg **Enterprise** når flere organisasjoner skal styres under ett tak, eller når kredittmengden i Business blir en flaskehals for utviklere som bruker agenten hele dagen. Kreditter er den variabelen de fleste underslår i budsjettet: agent-modus og premium-modeller trekker flere kreditter per oppgave enn kodefullføring, og et team som bruker Copilot CLI daglig bør måle forbruket i piloten før det bestemmer plan.

Claude Code som alternativ krever en egen lisens fra Anthropic (Claude Enterprise i en virksomhet) og styres ikke av GitHub-policyene; samme interne regler må gjelde. Se [Copilot-policyer](../sikkerhet/copilot-policyer.md).

## Del 2: Power Platform, for appene

### For utviklerne som bygger

Utvikleren trenger en Power Platform-konto med maker-rolle i et miljø der Code Apps er slått på. Å bygge og publisere krever ingen egen lisens utover det utvikleren allerede har som bruker; kjører utvikleren appen selv, gjelder samme krav som for sluttbrukere.

### For sluttbrukerne som kjører appene

Hver bruker som åpner en Code App trenger ett av disse, per Microsoft Learn:

| Lisensform | Passer når |
|---|---|
| **Power Apps Premium** (per bruker) | Brukeren skal kjøre flere apper, eller apper mot Dataverse og premium-connectorer, jevnlig |
| **Pay-as-you-go** (forbruk via Azure-abonnement) | Få eller uforutsigbare brukere; betal per aktiv bruker per app per måned |
| **App Pass** (per app) | Én app til mange brukere |
| **Auto-claim** | Tenanten tildeler automatisk en Premium-lisens fra poolen første gang brukeren trenger den |

Premium-connectorer som Dataverse krever Premium eller pay-as-you-go uansett; Standard-connectorer som SharePoint og Office 365 Users dekkes av Microsoft 365-lisensen i canvas-apper, men en Code App som sådan krever fortsatt én av formene over for å kjøre.

Managed Environments, som styringsmodellen forutsetter, krever at brukerne i miljøet har Premium-lisens eller tilsvarende; det er en egen rad i budsjettet.

!!! note "Verifiser i egen tenant"
    Hvilke lisenser som faktisk finnes, ser admin i Microsoft 365 admin center. Hvilke som kreves av et gitt miljø, viser Power Platform admin center under miljøets lisensrapporter. Ikke anta; sjekk begge før piloten.

## Regnestykket for en pilot

Et eksempel for å vise formen, ikke tallene:

- 5 utviklere med Copilot Business: 5 seter
- 1 champion utenfor utviklerteamet med sete: 1 sete
- 30 sluttbrukere av to pilotapper mot Dataverse: Premium for de som bruker apper daglig, pay-as-you-go for resten, verifisert mot eksisterende lisenser
- Managed Environments for pilotmiljøene: dekket av Premium-lisensene over

Det som ikke står i regnestykket, men koster mest: tiden utviklerne bruker på opplæring de første ukene, og tiden admin bruker på policyer og miljøer. [Plan 30-90-180](30-90-180.md) setter det inn i kalenderen.

## Neste steg

[Risikoregister](risikoregister.md), fordi lisensen er det billige spørsmålet; dataflyt og regulering er de dyre.

## Kilder

- GitHub Docs, Plans for GitHub Copilot: https://docs.github.com/en/copilot/get-started/plans (lest 2026-10-23)
- Microsoft Learn, Power Apps code apps overview, «License end users with Power Apps Premium»: https://learn.microsoft.com/power-apps/developer/code-apps/overview (lest 2026-10-23)
- Microsoft Learn, Managed Environments licensing: https://learn.microsoft.com/power-platform/admin/managed-environment-licensing (til verifisering ved budsjett)
- Microsoft, Power Apps pricing: https://www.microsoft.com/power-platform/products/power-apps/pricing (sjekk samme dag som budsjettet)
