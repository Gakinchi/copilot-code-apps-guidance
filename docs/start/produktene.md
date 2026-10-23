---
title: Produktene, hva er hva
tags: [leder, arkitekt, utvikler]
verifisert: 2026-10-23
kilde: PÅ LEARN
---

# Produktene, hva er hva

**Hvem denne siden er for:** alle. Navnene i dette landskapet forvirrer selv folk som jobber med det daglig, og en feil i navnet blir en feil i lisensen, i styringen eller i løftet til kunden. Les denne siden før du bruker ordene i et møte.

## GitHub Copilot er flere ting

| Navn | Hva det er | Hvem bruker det |
|---|---|---|
| **GitHub Copilot CLI** (`copilot`) | En agent du kjører i terminalen. Den leser repoet, kjører kommandoer, installerer plugins og utfører flerstegs oppgaver etter at du har godkjent planen. Det er denne veiledningen bruker som primært verktøy. | Utvikleren |
| **Copilot i Visual Studio Code** | Chat og agent-modus inne i editoren, med samme plugins via utvidelser. | Utvikleren |
| **Copilot Business** | Lisensen for en organisasjon på GitHub. Gir seter, policyer på organisasjonsnivå og usage metrics. | Innkjøp og admin |
| **Copilot Enterprise** | Lisensen for en GitHub Enterprise-konto. Samme som Business pluss enterprise-styring, flere organisasjoner under ett tak og mer kontekst fra kodebasen. | Innkjøp og admin |

Lisenssiden forklarer forskjellen i detalj: [Lisensmodell](../strategi/lisensmodell.md). Innstillingene som styrer hva Copilot får se og gjøre: [Copilot-policyer](../sikkerhet/copilot-policyer.md).

## Power Apps Code Apps

En **Code App** er en app du skriver selv i kode, med Vite, TypeScript og et rammeverk du velger, og publiserer til Power Platform. Plattformen gir appen Microsoft Entra-innlogging, tilgang til connectorer (Dataverse, SharePoint og over tusen andre), DLP-håndheving, deling, Conditional Access og telemetri i admin-senteret. Appen kjører i brukerens nettleser med brukerens rettigheter. Code Apps er generelt tilgjengelig.

Tre deler gjør en Vite-app til en Code App:

1. SDK-pakken `@microsoft/power-apps`, som koden din importerer for å kalle connectorer.
2. Vite-pluginen `@microsoft/power-apps-vite`, som kobler `npm run dev` til plattformen under utvikling.
3. Filen `power.config.json`, som peker appen til miljøet ditt.

Utvikleren styrer alt med CLI-en **`pa`** fra pakken `@microsoft/power-apps-cli`: `pa app init`, `pa app run`, `pa app push`, `pa app add data-source`. Den gamle npm-kommandoen `npx power-apps` finnes ikke lenger, og `pac code` er avviklet. Begge dukker fortsatt opp i eldre blogger og slides; ikke bruk dem.

!!! note "Verifisert ved kjøring 2026-10-23"
    CLI 1.3.0, Node 24, Vite 8. Kommandoene over er kjørt fra tom mappe til publisert app i en lab. [Hurtigstart](../arbeidsflyt/hurtigstart.md) viser hvert steg.

## Copilot Managed Runtime er et tredje produkt

**Copilot Managed Runtime**, også kalt Managed Apps, gikk i offentlig forhåndsvisning 25. september 2026. Det er ikke en ny versjon av Code Apps. Produktteamet har bekreftet at Code Apps beholdes, med egen backlog og egne Office Hours, at Code Apps ikke får den innebygde databasen eller mellomlaget, og at de to SDK-ene ikke slås sammen.

Praktiske forskjeller som gjør at du ikke kan blande dem:

| | Code Apps | Copilot Managed Runtime |
|---|---|---|
| CLI | `pa` | `ms` |
| npm-pakker | `@microsoft/power-apps*` | `@microsoft/managed-apps*` |
| Publisering | Du bygger lokalt og laster opp med `pa app push` | Du pusher en commit, plattformen bygger fra repoet |
| Admin-hjem | Power Platform admin center | Microsoft 365 admin center |
| Lisens for sluttbruker | Power Apps Premium, pay-as-you-go eller App Pass | Power Apps Premium eller Copilot Credits via spending policy |
| Status | Generelt tilgjengelig | Offentlig forhåndsvisning |

Denne veiledningen handler om Code Apps. Der en side nevner Copilot Managed Runtime, står det eksplisitt.

## Regelen for hver påstand

Hver setning i veiledningen som sier «appen gjør X» eller «admin må Y» skal også si **hvilken apptype** (canvas, model-driven, Code App, managed app) og **hvem aktøren er** (en maker i Studio, en utvikler med `pa`, en forretningsbruker). Det er regelen som holder navnene fra hverandre, og den gjelder også når du skriver internt.

## Neste steg

[Seks måter å bygge en app](seks-mater.md) plasserer Code Apps blant de andre valgene, slik at du velger den av riktig grunn.

## Kilder

- Microsoft Learn, Power Apps code apps overview: https://learn.microsoft.com/power-apps/developer/code-apps/overview (lest 2026-10-23)
- Microsoft Learn, Power Apps CLI command reference: https://learn.microsoft.com/power-apps/developer/code-apps/reference/cli (lest 2026-10-23)
- Microsoft Learn, Quickstart: Build a code app with GitHub Copilot: https://learn.microsoft.com/power-apps/developer/code-apps/how-to/quickstart-github-copilot (lest 2026-10-23)
- Microsoft Learn, Copilot Managed Runtime: https://learn.microsoft.com/microsoft-365/managed-apps/ (lest 2026-10-23)
- GitHub Docs, Copilot plans: https://docs.github.com/en/copilot/get-started/plans (til verifisering før lisenssiden skrives)
