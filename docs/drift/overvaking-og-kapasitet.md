---
title: Overvåking og kapasitet
tags: [arkitekt]
verifisert: 2026-10-23
kilde: PÅ LEARN
---

# Overvåking og kapasitet

**Hvem denne siden er for:** Power Platform-administratoren og CoE-lederen etter at første Code App er i produksjon. Det er tre spørsmål som må kunne besvares hver uke: virker appene, hvem bruker dem, og hva koster de i kapasitet og lisens. Alle tre har et svar i Power Platform admin center; Copilot-siden har sitt eget.

## Virker appene: Monitor

**Monitor** i admin center viser driftshelse for apper og flyter: feil, ytelse og hendelser, for tenanten eller per miljø. Makere ser det samme for egne apper fra Power Apps. For en Code App er det her dere ser connector-feil og innlastingsproblemer som brukerne ellers melder i kanalen. Sett opp varsling til teamets kanal for apper i sone 3.

## Hvem bruker dem: Usage og Inventory

**Usage** (preview) viser aktive brukere per app siste 28 dager og de mest brukte ressursene. **Inventory** viser hver app med eier, miljø, type og sist endret. Begge er beskrevet i [Power Platform-metrikker](../maaling/power-platform-metrics.md). Tenant-level analytics må være slått på.

## Hva koster de: kapasitet og lisens

| Hva | Hvor | Hva du ser etter |
|---|---|---|
| Dataverse-kapasitet | Admin center → Resources → Capacity | Database, fil og logg per miljø. Personlige utviklermiljøer teller, og kan ryddes |
| Power Apps-lisenser | Microsoft 365 admin center, og admin center → Billing | Brukere som kjører Code Apps uten Premium; auto-claim-innstillingen |
| Pay-as-you-go | Azure Cost Management, og nedlastbar rapport i admin center | Forbruk per miljø og app, hvis dere har valgt meter-basert |
| Copilot premium requests | GitHub billing | Per bruker mot plangrensen; KPI K4 |

Lisensrapporten er den som overrasker: en Code App delt til en gruppe der noen mangler Premium, gir brukere som får feil ved oppstart. [Lisensmodell](../strategi/lisensmodell.md) forklarer alternativene; [reaktiv styring](../styring/reaktiv-styring.md) har rutinen.

## Ukentlig digest fra Managed Environments

Slå på usage insights per miljø, så får CoE-lederen en e-post hver uke med topp-apper, aktive makere og ressurser som kan ryddes. Det er lavterskel-overvåkingen som faktisk blir lest.

## Copilot-siden

Copilot har ingen driftsovervåking å snakke om; den er en klient. Det som overvåkes, er bruk og kostnad via usage metrics og billing. [Copilot-metrikker](../maaling/copilot-metrics.md). Audit log i GitHub-organisasjonen fanger policy-endringer og seteendringer, og leses månedlig.

## Neste steg

[Oppdateringstakt](oppdateringstakt.md) for den andre driftsoppgaven: å holde tritt med produktet. [Reaktiv styring](../styring/reaktiv-styring.md) for hva du gjør med det du ser.

## Kilder

- Microsoft Learn, Monitoring overview: https://learn.microsoft.com/power-platform/admin/monitoring/monitoring-overview (lest 2026-10-23)
- Microsoft Learn, Report on resource usage: https://learn.microsoft.com/power-platform/guidance/adoption/resource-usage (lest 2026-10-23)
- Microsoft Learn, Usage insights (weekly digest): https://learn.microsoft.com/power-platform/admin/managed-environment-usage-insights (lest 2026-10-23)
- Microsoft Learn, View usage and billing information (pay-as-you-go): https://learn.microsoft.com/power-platform/admin/pay-as-you-go-usage-costs (lest 2026-10-23)
