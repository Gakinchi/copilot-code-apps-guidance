---
title: Pilotevaluering
tags: [leder, arkitekt]
verifisert: 2026-10-23
kilde: GITHUB DOCS
---

# Pilotevaluering: utvide, justere eller stoppe

**Hvem denne siden er for:** ledelsen som skal beslutte etter 90 dager, og CoE-lederen som skal legge fram grunnlaget. Evalueringen er planlagt fra dag 1 med kriterier alle har sett, slik at beslutningen handler om tall og erfaringer, ikke om stemning i rommet.

## Kriteriene

Fyll inn tall fra [KPI-arket](kpi-ark.md). Grensene under er forslag; sett deres egne før piloten starter, ikke etter.

| Kriterium | Grønt | Gult | Rødt |
|---|---|---|---|
| Aktive Copilot-brukere siste 28 dager (K2) | Over 80 % av setene | 50 til 80 % | Under 50 % |
| Apper levert i sone 2 på solution (K6) | Minst én per team | Én totalt | Ingen |
| Tid fra oppgave til fungerende versjon (K8) mot baseline | Halvert eller bedre | Redusert | Uendret eller verre |
| PR-tid (K9) mot baseline | Uendret eller bedre | Litt verre | Vesentlig verre |
| Utviklere som sier arbeidsdagen ble lettere (K12) | Over 70 % | 50 til 70 % | Under 50 % |
| DLP-brudd og hendelser (K11) | Null | Én, håndtert | Flere, eller én uhåndtert |
| Kreditter og lisenskost (K4) mot budsjett | Innenfor | Over, forklart | Over, uforklart |
| Opplæring gjennomført (K13) | 100 % | Over 80 % | Under 80 % |

## Beslutningsregelen

- **Alt grønt eller gult uten rødt:** utvid til neste bølge. Piloten blir champions.
- **Ett rødt:** juster og forleng med 30 dager. Finn årsaken i retrospektivet: lisens, miljø, oppgavevalg, opplæring.
- **Flere røde, særlig K8 og K12:** stopp og rapporter ærlig. En pilot som ikke gjorde arbeidsdagen lettere, har levert sitt viktigste resultat.

## Grunnlaget som legges fram

1. KPI-arket med baseline, dag 30 og dag 90.
2. De to spørreundersøkelsene, samme spørsmål begge ganger.
3. Retrospektivet med pilotteamene: hva stoppet dem, hva de ville gjort annerledes, hvilke prompter og instruksjoner som virket.
4. Listen over hull i styringen som piloten fant: DLP-regler som manglet, miljøer uten Dataverse, policyer som måtte endres.
5. Forslagene til endring i instruksjonsfiler og sonematrise.
6. Faktisk forbruk av Copilot-kreditter og Power Apps-lisenser mot anslaget.

## Spørreundersøkelsen

Kort, samme hver gang, på en skala fra én til fem:

1. Copilot gjorde det raskere å komme i gang med en oppgave.
2. Jeg forstår koden Copilot skrev før jeg merger den.
3. Jeg vet hva jeg ikke skal gi Copilot tilgang til.
4. Oppsettet av Code Apps (miljø, lisens, connectorer) sto i veien for meg.
5. Jeg ville anbefalt dette til et annet team.
6. Fritekst: det ene som bør endres.

GitHubs egen anbefaling er å trigge undersøkelsen ved definerte punkter i erfaringen, og å ta Copilot opp i sprint-retrospektivene i tillegg. Begge deler gir tallene en forklaring.

## Neste steg

[Plan 30-90-180](../strategi/30-90-180.md) for hva som følger etter beslutningen. [Fellesskap](../fellesskap/index.md) for hvordan piloten blir champions.

## Kilder

- GitHub Docs, Measuring the success of a GitHub Copilot trial: https://docs.github.com/en/copilot/tutorials/roll-out-at-scale (lest 2026-10-23)
- GitHub Docs, Driving Copilot adoption in your company (undersøkelser og retrospektiver): https://docs.github.com/en/copilot/tutorials/roll-out-at-scale/enable-developers/drive-adoption (lest 2026-10-23)
