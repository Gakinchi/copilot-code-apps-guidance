---
title: KPI-er
tags: [leder, arkitekt]
verifisert: 2026-10-23
kilde: GITHUB DOCS
---

# KPI-er: tallene vi måler, og hvor de hentes

**Hvem denne siden er for:** ledelsen som skal følge innføringen, og CoE-lederen som skal fylle ut KPI-arket. Regelen GitHub selv gir er den viktigste: mål en baseline før du begynner, ellers har du ingenting å sammenligne med etter 90 dager.

## Prinsippet

To typer tall:

- **Ledende** tall sier om innføringen skjer: seter aktivert, aktive brukere, apper opprettet, repoer med instruksjonsfiler. De beveger seg i løpet av uker.
- **Etterslepende** tall sier om den virker: tid fra oppgave til fungerende versjon, support-spørsmål, hendelser, apper i produksjon på solutions. De beveger seg i løpet av kvartaler.

Ledelsen ser begge; piloten styres på de ledende.

## KPI-ene

| # | KPI | Type | Kilde | Baseline | Mål etter 90 dager |
|---|---|---|---|---|---|
| K1 | Copilot-seter aktivert, andel av tildelte | Ledende | GitHub usage metrics (organisasjon eller enterprise) | 0 | 100 % av piloten |
| K2 | Aktive Copilot-brukere siste 28 dager, andel av seter | Ledende | GitHub usage metrics | 0 | 80 % |
| K3 | Copilot CLI-økter per utvikler per uke | Ledende | GitHub usage metrics | 0 | [etter pilot] |
| K4 | AI-kreditter brukt per utvikler per måned, mot plangrensen | Ledende | GitHub usage metrics / fakturering | 0 | Under grensen, med margin |
| K5 | Code Apps i inventaret, per miljø og sone | Ledende | Power Platform admin center, inventar; maker-portalen, Apps med typen Code | [tell] | [pilotens plan] |
| K6 | Andel Code Apps i sone 2 og 3 på solutions med connection references | Etterslepende | Inventar + solution-eksport | [tell] | 100 % |
| K7 | Andel Code App-repoer med `copilot-instructions.md` etter malen | Ledende | GitHub, søk i organisasjonen | 0 | 100 % |
| K8 | Tid fra oppgave opprettet til første fungerende versjon i Local Play | Etterslepende | Teamets oppgavesporing, målt på et utvalg oppgaver | [mål før pilot] | Halvert |
| K9 | Tid fra pull request åpnet til merget | Etterslepende | GitHub | [mål før pilot] | Redusert, ikke økt |
| K10 | Support-spørsmål om oppsett og «hvordan starter jeg» i kanalen | Etterslepende | Kanalen, telt per uke | [mål første uke] | Synkende etter uke 4 |
| K11 | DLP-brudd og hendelser knyttet til Code Apps | Etterslepende | Power Platform admin center, sikkerhet | 0 | 0 |
| K12 | Utviklere som svarer «Copilot gjør arbeidsdagen lettere» i undersøkelsen | Etterslepende | Spørreundersøkelse ved dag 30 og 90 | [spør før pilot] | Over 70 % |
| K13 | Andel ansatte med Copilot-sete som har fullført AI-kompetanse-opplæringen | Ledende | Læringsplattform / deltakerliste | 0 | 100 % |

## Slik henter du tallene

- **GitHub usage metrics** finnes for organisasjoner og enterprises med Copilot Business eller Enterprise, både i GitHub-grensesnittet og som API. Tallene dekker lisensaktivering, aktive brukere og bruk per funksjon. Eksakt hvilke felt som finnes endrer seg; [Copilot-metrikker](../maaling/copilot-metrics.md) holder det oppdatert.
- **Power Platform admin center** viser inventar per miljø, inkludert Code Apps, og bruksdata for apper. Maker-portalen viser apper per miljø med type.
- **Teamets egne tall** (K8, K9, K10) krever at noen teller. Velg ti representative oppgaver før piloten, mål dem, og mål ti etter. Det er nok til å se retning.
- **Undersøkelsen** (K12) kjøres ved definerte punkter, dag 30 og dag 90, med samme spørsmål begge ganger. GitHub anbefaler i tillegg å ta Copilot opp i sprint-retrospektivene, der tallene får en forklaring.

## Det tallene ikke sier

Antall aksepterte forslag, linjer kode eller prompter sier lite om verdi. Et team kan akseptere mye og levere dårligere. Hold deg til tallene over, og les dem sammen med det utviklerne sier i retrospektivene.

## Neste steg

[Plan 30-90-180](30-90-180.md) legger målepunktene inn i kalenderen. [KPI-ark](../maaling/kpi-ark.md) er malen du fyller ut.

## Kilder

- GitHub Docs, Measure and demonstrate the impact of GitHub Copilot: https://docs.github.com/en/copilot/tutorials/roll-out-at-scale (lest 2026-10-23)
- GitHub Docs, Driving Copilot adoption in your company (undersøkelser, retrospektiver, eksempler på mål): https://docs.github.com/en/copilot/tutorials/roll-out-at-scale/enable-developers/drive-adoption (lest 2026-10-23)
- Microsoft Learn, Gain insights into Power Platform adoption: https://learn.microsoft.com/power-platform/guidance/adoption/observability (lest 2026-10-23)
