---
title: AI-kompetanse
tags: [leder, arkitekt]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# AI-kompetanse: artikkel 4 som opplæringsplan

**Hvem denne siden er for:** CoE-lederen som skal lage planen, etterlevelsesansvarlig som skal dokumentere den, og lederen som skal forstå at dette ikke er valgfritt. EU AI Act artikkel 4 har gjeldt siden 2. februar 2025: virksomheten skal sørge for at ansatte som bruker AI-systemer, har tilstrekkelig AI-kompetanse, tilpasset deres rolle og konteksten systemet brukes i. GitHub Copilot er et slikt system fra første sete.

## Hva «tilstrekkelig» betyr her

Forordningen definerer ikke et pensum. Den sier at kompetansen skal stå i forhold til rollen, den tekniske kunnskapen og konteksten. For en utvikler som bruker Copilot til å skrive kode som går i produksjon, er det rimelig å kreve at de kan:

1. **Forklare hva som sendes til modellen** og hva som ikke gjør det. [Dataflyt til modellen](../sikkerhet/dataflyt-til-modellen.md).
2. **Si hva modellen ikke vet:** interne regler, dagens versjon av CLI-en, hva DLP tillater, hva som er bestemt i teamet.
3. **Lese det den skriver** før det merges, og forklare det til en annen. [Review-regler](../arbeidsflyt/review-regler.md).
4. **Vite når de stopper:** nye connectorer, hemmeligheter, produksjon, preview-løfter. [Grenser](../arbeidsflyt/grenser.md).
5. **Kjenne sin egen rolle** under forordningen: virksomheten er deployer, ikke tilbyder, og det betyr åpenhet og kompetanse, ikke CE-merking. [EU AI Act-rolle](../norge/eu-ai-act-rolle.md).

For en leder: punkt 5, pluss risikoene i [risikoregisteret](../strategi/risikoregister.md). For admin: punkt 1 og 5, pluss policyene.

## Planen

| Rolle | Innhold | Form | Tid | Frist |
|---|---|---|---|---|
| Utvikler | Punkt 1 til 5 over | En time med instruktør, eller selvstudium med de fem lenkene, pluss hurtigstarten | 3 timer | Før første merge til `main` |
| Champion | Utvikler-innholdet, pluss hvordan man forklarer det til andre | Utvikler-innholdet, pluss én time med CoE | 4 timer | Dag −45 |
| Admin | Punkt 1 og 5, policyer og logger | Selvstudium med [Copilot-policyer](../sikkerhet/copilot-policyer.md) | 2 timer | Før seter tildeles |
| Leder | Punkt 5 og risikoregisteret | 30 minutter i et ledermøte | 30 min | Før pilotbeslutning |
| Ny ansatt med sete | Som rollen | Del av onboarding | | Før sete aktiveres |

Opplæringen gjentas når noe vesentlig endres: ny modell-policy, ny agent (for eksempel Claude Code), eller en hendelse i risikoregisteret.

## Dokumentasjonen

Artikkel 4 krever ikke en bestemt form, men tilsynet vil spørre om bevis. Minimum:

- Planen over, vedtatt og datert, i [styringsplanen](../verktoykasse/maler/styringsplan.md).
- Ett ark med navn, rolle, modul og dato gjennomført. Det er KPI K13.
- Innholdet som ble brukt, versjonert, slik at dere kan vise hva som ble lært når.

## Det opplæringen ikke løser

Kompetanse forvitrer når agenten gjør alt. R10 i risikoregisteret. Motmidlene er ikke mer opplæring, men arbeidsflyten: plan først, les diffen, forklar i review. [Daglig loop](../arbeidsflyt/daglig-loop.md) er derfor også et artikkel 4-tiltak, og bør stå i planen som det.

## Neste steg

[Læringssti](laeringssti.md) for hele opplæringen per rolle. [EU AI Act-rolle](../norge/eu-ai-act-rolle.md) for forordningen.

## Kilder

- EUR-Lex, Forordning (EU) 2024/1689 (KI-forordningen), artikkel 4: https://eur-lex.europa.eu/eli/reg/2024/1689/oj (lest 2026-10-23)
- Regjeringen, Tung vil sende KI-loven med endringer på høring (2026-08-04): https://www.regjeringen.no/no/aktuelt/tung-vil-sende-ki-loven-med-endringer-pa-horing/id3169693/ (lest 2026-10-23)
- Planen bygger på artikkel 4-tolkningen i en governance-metode brukt på norske tenanter i 2026. Den er ikke juridisk rådgivning; få den bekreftet av virksomhetens jurist.
