---
title: Workshop-oppsett
tags: [arkitekt, utvikler]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Workshop-oppsett: fra idé til fungerende app på én dag

**Hvem denne siden er for:** den som skal holde workshopen, og CoE-lederen som skal bestille den. Formatet er kjørt for norske utviklerteam gjennom 2026, og det virker når forutsetningene er på plass dagen før. Når de ikke er det, går halve dagen til oppsett, og det er det deltakerne husker.

## Formatet

| Tid | Hva | Hvem gjør hva |
|---|---|---|
| 0:00 | Hvorfor: produktene, seks måter å bygge en app, hva som er annerledes med Code Apps | Instruktør, 30 min, ingen laptop |
| 0:30 | Hurtigstarten, live, med terminalen på skjermen | Instruktør bygger, deltakerne ser. 30 min |
| 1:00 | Alle bygger hurtigstart-appen i eget miljø | Deltakerne, instruktør går rundt. 45 min |
| 1:45 | Pause | |
| 2:00 | Teamets egen app: oppgaven er valgt på forhånd, datakilden er godkjent på forhånd | Team på to til tre. Plan først, så bygging. 2 timer |
| 4:00 | Lunsj | |
| 4:45 | Fortsett, med mål om Local Play som virker | 1 time 15 min |
| 6:00 | Review: hvert team viser diffen og forklarer én del | Teamene, 45 min |
| 6:45 | Push til teamets miljø, deling, og hva som skjer videre (solution, pipeline, kanal) | Instruktør og teamene, 45 min |
| 7:30 | Slutt | |

Fire-timers varianten: stopp etter Local Play, og la push være hjemmelekse med champion-en til stede.

## Dagen før

Dette er den delen som avgjør. Hver linje har en eier og sjekkes skriftlig:

| Sjekk | Eier | Hvordan |
|---|---|---|
| Alle deltakere har Copilot-sete, og har logget inn én gang | Copilot-admin | Usage metrics viser aktivering |
| Alle har et utviklermiljø med Code Apps på, og Environment Maker | Plattform-admin | Admin center, gruppen for piloten |
| Datakilden for teamoppgaven finnes, med connection, og DLP tillater den | Plattform-admin | `pa connection list` fra en deltakermaskin |
| Alle har gått gjennom [Forutsetninger](forutsetninger.md) | Deltakerne | Skjermbilde av `pa auth status` og `copilot plugin list` i kanalen |
| Lisens for sluttbrukerne av teamappen er avklart | Lisensansvarlig | Ett svar på e-post |
| Repo per team opprettet i organisasjonens GitHub, med instruksjonsfil fra malen | Champion | Lenke i kanalen |
| Nettverk: deltakerne kan nå GitHub, npm, Power Platform og Local Play fra lokalet | IT | Testet fra lokalet, ikke fra kontoret |
| Instruktøren har kjørt hurtigstarten på nytt denne uken med gjeldende versjoner | Instruktør | Dato i kanalen |

Mangler én av linjene, flytt workshopen. Det er billigere.

## Oppgavene

Teamoppgaven velges av teamet uken før, etter tre regler: en datakilde som allerede er godkjent (Office 365 Users eller en SharePoint-liste er de trygge), en bruker som finnes i rommet, og noe som er ferdig når listen vises og ett valg virker. Eksempler som har fungert: kollegaoversikt med søk, romoversikt fra en liste, enkel registrering mot en liste.

Oppgaver som ikke virker på én dag: alt med Dataverse-tabeller som må lages først, alt med flyter, alt med mer enn én datakilde.

## Instruktøren

Instruktøren bygger live, med terminalen synlig, og sier høyt hva som skjer og hvorfor, inkludert når agenten foreslår noe feil. Deltakerne lærer mer av å se én feil håndtert enn av tre glatte demoer. Instruktøren bruker samme versjoner som deltakerne, verifisert samme uke.

## Etter workshopen

- Hvert team har en app i eget miljø og et repo med én PR.
- Champion-en følger opp i kanalen i to uker: neste steg er solution og connection reference ([ALM](../drift/alm-for-code-apps.md)).
- Instruktøren skriver tre linjer til [Feilsøking](../arbeidsflyt/feilsoking.md) om det som gikk galt.
- Undersøkelsen fra [Pilotevaluering](../maaling/pilot-evaluering.md) sendes samme dag.

## Neste steg

[Forutsetninger](forutsetninger.md) for deltakernes sjekkliste. [Læringssti](laeringssti.md) for hva som kommer etter.

## Kilder

- GitHub Docs, Roll out GitHub Copilot at scale (workshop 7 dager før lansering): https://docs.github.com/en/copilot/tutorials/roll-out-at-scale (lest 2026-10-23)
- Formatet er kjørt som code-first-workshop for norske team i 2026, i fire- og åttetimers varianter.
