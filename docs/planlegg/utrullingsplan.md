---
title: Utrullingsplan
tags: [arkitekt]
verifisert: 2026-10-23
kilde: GITHUB DOCS
---

# Utrullingsplan: GitHubs tidslinje lagt oppå Power Platform-fasene

**Hvem denne siden er for:** arkitekten og adopsjonslederen som skal planlegge de første 90 dagene dag for dag. GitHub anbefaler en konkret tidslinje for Copilot-lansering: champions 45 dager før, kunngjøring 14 dager før, workshop 7 dager før, lansering med kanal og wiki. Power Platform-siden trenger sine egne steg før den tidslinjen kan starte. Denne siden fletter dem.

## Tidslinjen

| Dag | Hva | Hvem | Fra |
|---|---|---|---|
| −45 | Champions rekruttert, én per pilotteam. Definer suksessmålene og mål baseline | Adopsjonsleder, CoE | GitHub |
| −45 til −20 | Grunnlaget i Power Platform: Code Apps på i pilotens environment group, DLP forhåndsvist og publisert, Entra-grupper, lisenser bekreftet | Plattform-admin, lisensansvarlig | Microsoft |
| −30 | Copilot-policyer satt, content exclusions, seter tildelt piloten, markedsplassen tillatt | Copilot-admin | GitHub |
| −30 | Instruksjonsfil-malen og prompt-biblioteket klare i organisasjonens malrepo | CoE, én utvikler | Denne veiledningen |
| −21 | Én pilotutvikler kjører hurtigstarten fra tom mappe til publisert app i pilotmiljøet; feil rettes før andre prøver | Champion | Denne veiledningen |
| −14 | Kunngjøring til piloten: hva, hvorfor, lesestier, kanal, dato for workshop | Adopsjonsleder | GitHub |
| −14 til −1 | Utviklerne gjør [Oppsett av maskinen](../arbeidsflyt/oppsett-maskin.md) på egen hånd, med champion som støtte | Utviklerne | |
| −7 | Workshop: fra idé til fungerende app på fire timer, på en reell oppgave | CoE, champions | GitHub |
| 0 | Lansering: kanalen åpnes, wiki-siden lenker til veiledningen, prompt-biblioteket tas i bruk, office hours annonsert | Adopsjonsleder | GitHub |
| 0 til 60 | Piloten bygger. Ukentlig: Copilot usage metrics, inventar, spørsmål i kanalen. Office hours hver uke | CoE | Denne veiledningen |
| 30 | Første spørreundersøkelse. Første gjennomgang med ledelsen | Adopsjonsleder | GitHub |
| 60 | Første app i et teammiljø på solution med connection references | Pilotteam, plattform-admin | Microsoft |
| 75 | Pilotens forslag til endringer i instruksjonsfiler og sonematrise | Champions, CoE | |
| 90 | Andre spørreundersøkelse, retrospektiv, pilotevaluering, beslutning | CoE, ledelsen | GitHub |

## Det som må være klart før dag −14

Kunngjøringen lover noe. Før den sendes skal dette være testet, ikke antatt:

1. En utvikler utenfor admin-teamet har kjørt hurtigstarten uten hjelp og publisert en app i pilotmiljøet.
2. Alle i piloten har aktivert Copilot-setet sitt (GitHub viser aktivering i usage metrics).
3. Connectorene piloten skal bruke er testet mot DLP i pilotmiljøet.
4. Kanalen finnes, og champions er medlemmer.
5. Lesestiene i veiledningen er lest av champions, og de vet hvor feilsøkingssiden er.

## Workshopen

Formatet som har fungert i norske virksomheter i 2026: én dag, en reell oppgave per team, Copilot CLI med Code Apps-pluginen, og en fungerende app i et personlig miljø før lunsj. Ettermiddagen går til datakilder, instruksjonsfiler og review. Slides er til åpningen, ikke til dagen. [Workshop-oppsett](../beredskap/workshop-oppsett.md) har forutsetningene og programmet.

## Lanseringsdagen

GitHubs anbefaling er enkel og riktig: en kanal der spørsmål får svar samme dag, en wiki-side som samler lenker, kuraterte ressurser. Her betyr det:

- Kanal i Teams eller Slack med champions og CoE, og en fast person som svarer på «det virker ikke» (se [Roller](roller.md) om skjøten mellom GitHub og Power Platform).
- Én intern wiki-side som lenker til [For utvikleren](../start/utvikler.md), [Feilsøking](../arbeidsflyt/feilsoking.md) og prompt-biblioteket.
- Office hours satt i kalenderen hver uke fra dag 0.

## Etter dag 90

Beslutningen om utvidelse tas på [pilotevalueringen](../maaling/pilot-evaluering.md). Utvidelsen gjentar tidslinjen for neste bølge, med piloten som champions. [Plan 30-90-180](../strategi/30-90-180.md) viser fasene videre.

## Kilder

- GitHub Docs, Driving Copilot adoption in your company: https://docs.github.com/en/copilot/tutorials/roll-out-at-scale/enable-developers/drive-adoption (lest 2026-10-23)
- Microsoft Learn, Power Platform adoption guidance, Plan: https://learn.microsoft.com/power-platform/guidance/adoption/plan-overview (lest 2026-10-23)
