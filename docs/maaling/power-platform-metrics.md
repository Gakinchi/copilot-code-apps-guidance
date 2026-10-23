---
title: Power Platform-metrikker
tags: [arkitekt]
verifisert: 2026-10-23
kilde: PÅ LEARN
---

# Power Platform-metrikker: inventar, bruk og helse

**Hvem denne siden er for:** CoE-lederen og Power Platform-administratoren som skal fylle K5, K6 og K11 i [KPI-arket](kpi-ark.md), og som trenger inventaret til [reaktiv styring](../styring/reaktiv-styring.md). Alt ligger i Power Platform admin center nå. CoE Starter Kit vedlikeholdes ikke lenger, og Microsoft peker til admin center som erstatning.

## De fire sidene i admin center

| Side | Gir | Brukes til |
|---|---|---|
| **Manage → Inventory** | Alle apper, flyter og agenter i tenanten, med eier, miljø, type og connectorer (preview). Oppdateres innen 15 minutter. CSV-eksport av hele inventaret | K5 (Code Apps per sone), foreldreløse apper, apper i default-miljøet |
| **Manage → Usage** (preview) | Aktive brukere per app siste 28 dager, flytkjøringer, agentøkter, og de tre mest brukte ressursene | Hvilke Code Apps som faktisk brukes, og av hvor mange |
| **Monitor** | Driftshelse: feil, ytelse, for apper og flyter | Code Apps som feiler i produksjon |
| **Actions** | Anbefalinger fra plattformen om risiko og beste praksis | Kvartalsgjennomgangen |

Tenant-level analytics må slås på under Tenant settings → Analytics før Usage og de eldre Power Apps-rapportene viser noe; det tar ett til to døgn før tallene kommer. Funksjonen er gratis.

## Code Apps i inventaret

Inventaret viser Code Apps som en egen apptype, sammen med canvas-, modelldrevne, vibe- og managed apps. Filtrer på typen for å få listen, og på miljøtype Default for å finne dem som ikke skulle vært der. Detaljpanelet har fanene Overview, Connectors og Usage per app.

!!! note "Connector-inventaret dekker ikke Code Apps ennå"
    Connectors-kolonnen (preview) lister støttede ressurstyper, og Code Apps står ikke på listen per 2026-10-23. For K11 (DLP-brudd) og connector-kartlegging av Code Apps må dere lese `power.config.json` i repoene, eller DLP-rapporten. Sjekk Learn-siden under for om listen er utvidet.

## Tilgang

Inventaret krever en Entra-rolle: Power Platform administrator, Global administrator, Dynamics 365 administrator eller Global reader ser alt. AI administrator og AI reader ser bare agenter og «agentiske apper», som inkluderer Code Apps, vibe apps og managed apps, men ikke canvas- og modelldrevne apper. Det kan være akkurat riktig for en Copilot-admin som skal følge piloten uten å se hele tenanten.

## Programmatisk

Samme data finnes gjennom Power Platform API-et (Inventory API), Power Platform for Admins V2-connectoren, `pac resource-query` (preview) og Azure Resource Graph. Én begrensning som rammer pipeliner: inventarspørringen støtter bare delegert brukerautentisering, ikke service principal, per 2026-10-23. Et ukentlig inventarskript må derfor kjøre som en bruker, ikke som pipelinens identitet. Skriptet kommer i [verktøykassen](../verktoykasse/skript.md) i milepæl 3.

## Fra admin center til KPI-ark

| KPI | Hentes fra |
|---|---|
| K5 Code Apps i inventaret per sone | Inventory, filtrert på type Code, gruppert på miljø mot sonematrisen |
| K6 Code Apps på solutions med connection references | Inventory gir appen; solution-tilhørighet sjekkes i maker-portalen eller via solution-eksport |
| K11 DLP-brudd og hendelser | DLP-policyenes rapport i admin center, pluss hendelseslogg; connector-inventaret når det dekker Code Apps |
| Apper uten eier | Inventory, filtrert på eiere som ikke lenger finnes i Entra |

## Managed Environments ukentlig digest

Managed Environments kan sende en ukentlig e-post med topp-apper, aktive makere og ressurser som kan ryddes. Slå den på per miljø under Edit Managed Environments → Usage insights, og la den gå til CoE-lederen. Det er det billigste tidlige varselet om apper som vokser uten at noen har sett dem.

## Neste steg

[Copilot-metrikker](copilot-metrics.md) for GitHub-siden. [Reaktiv styring](../styring/reaktiv-styring.md) for hva du gjør med inventaret.

## Kilder

- Microsoft Learn, Power Platform inventory: https://learn.microsoft.com/power-platform/admin/power-platform-inventory (lest 2026-10-23)
- Microsoft Learn, Discover what drives engagement by using the Usage page (preview): https://learn.microsoft.com/power-platform/admin/usage (lest 2026-10-23)
- Microsoft Learn, Tenant-level analytics: https://learn.microsoft.com/power-platform/admin/tenant-level-analytics (lest 2026-10-23)
- Microsoft Learn, Usage insights (weekly digest): https://learn.microsoft.com/power-platform/admin/managed-environment-usage-insights (lest 2026-10-23)
- Microsoft Learn, CoE Starter Kit transition to Power Platform admin center: https://learn.microsoft.com/power-platform/guidance/coe/starter-kit (lest 2026-10-23)
