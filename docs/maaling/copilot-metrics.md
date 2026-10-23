---
title: Copilot-metrikker
tags: [arkitekt]
verifisert: 2026-10-23
kilde: GITHUB DOCS
---

# Copilot-metrikker: hva GitHub kan fortelle deg, og hvordan du henter det

**Hvem denne siden er for:** CoE-lederen og Copilot-administratoren som skal fylle K1 til K4 i [KPI-arket](kpi-ark.md). GitHub gir både et grensesnitt og et API. API-et er det som gjør ukentlig rapportering gjennomførbar uten klikking.

## Forutsetningen

Policyen **Copilot usage metrics** må være satt til «Enabled everywhere» på enterprise-nivå, eller tilsvarende på organisasjonen, før rapportene finnes. Sett den i fase 1, ikke når ledelsen spør om tall.

## Rapportene

GitHubs metrics-API leverer rapporter som daglige snapshots og som 28-dagers aggregat, på organisasjons- og enterprise-nivå, og brutt ned på brukere, team og repoer.

| Endepunkt (organisasjon) | Gir |
|---|---|
| `GET /orgs/{org}/copilot/metrics/reports/organization-1-day` | Én dags bruk for organisasjonen |
| `GET /orgs/{org}/copilot/metrics/reports/organization-28-day/latest` | Siste 28 dager aggregert |
| `GET /orgs/{org}/copilot/metrics/reports/users-1-day` og `users-28-day/latest` | Per bruker |
| `GET /orgs/{org}/copilot/metrics/reports/user-teams-1-day` | Per team |
| `GET /orgs/{org}/copilot/metrics/reports/repos-1-day` | Per repo |

Enterprise-nivå har de samme under `/enterprises/{enterprise}/...`. Svaret inneholder nedlastingslenker til selve rapportfilene og rapportdatoen. Rapportene dekker bruk per Copilot-funksjon, inkludert coding agent og code review, og brukerengasjement. Data er tilgjengelige opptil ett år tilbake, og rapportene finnes fra 10. oktober 2025.

Tilgang krever organisasjonseier eller den finkornede rettigheten «View Organization Copilot Metrics», med scope `read:org` for et token; på enterprise-nivå eier, billing manager eller «View Enterprise Copilot Metrics», med `manage_billing:copilot` eller `read:enterprise`.

!!! note "Feltene endrer seg"
    Hvilke nedbrytninger som finnes per funksjon (fullføringer, chat, CLI, agent, modeller, språk) utvides jevnlig. Hent én rapport, se på feltene, og bygg arket på det du faktisk får. Lenken under går til API-referansen, som er kilden til enhver tid.

## Fra rapport til KPI-ark

| KPI | Hentes fra |
|---|---|
| K1 seter aktivert | Seteadministrasjonen i organisasjonen (antall tildelte, antall som har logget inn) |
| K2 aktive brukere siste 28 dager | `organization-28-day/latest`: engasjerte brukere mot tildelte seter |
| K3 CLI-økter per utvikler | `users-28-day/latest`, funksjonsnedbrytningen for Copilot CLI, der den finnes |
| K4 kreditter per utvikler | Faktureringsrapporten for premium-forespørsler, ikke metrics-API-et |

Et lite skript som henter 28-dagersrapporten hver mandag og legger tallene i arket, sparer CoE-lederen for en time i uken. Legg det i `scripts/` i virksomhetens repo; veiledningen får et eksempel i milepæl 3.

## Hva tallene ikke sier

Aktivitet er ikke verdi. En utvikler med mange økter kan slite; en med få kan ha løst oppgaven på første forsøk. Les metrics-tallene sammen med K8 (tid til fungerende versjon) og undersøkelsen (K12). GitHubs egen anbefaling er å koble bruk til resultater som raskere pull requests og færre «hvordan starter jeg»-spørsmål, ikke å rapportere bruk alene.

## Neste steg

[Power Platform-metrikker](power-platform-metrics.md) for app-siden av arket. [KPI-ark](kpi-ark.md) for å føre tallene.

## Kilder

- GitHub Docs, REST API endpoints for Copilot metrics: https://docs.github.com/en/rest/copilot/copilot-metrics (lest 2026-10-23)
- GitHub Docs, Measure and demonstrate the impact of GitHub Copilot: https://docs.github.com/en/copilot/tutorials/roll-out-at-scale (lest 2026-10-23)
