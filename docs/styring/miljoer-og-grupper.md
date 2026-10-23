---
title: Miljøer og grupper
tags: [arkitekt]
verifisert: 2026-10-23
kilde: PÅ LEARN
---

# Miljøer og grupper: mekanismene som håndhever sonene

**Hvem denne siden er for:** arkitekten og Power Platform-administratoren som skal sette opp det [sonematrisen](../verktoykasse/maler/sonematrise.md) beskriver. Fire mekanismer gjør jobben: Managed Environments, environment groups med regler, environment routing, og DLP. Denne siden tar de tre første; [DLP og Code Apps](../sikkerhet/dlp-og-code-apps.md) tar den siste.

## Managed Environments

Managed Environments er premium-funksjonaliteten som gir admin kontroll per miljø: begrensninger på deling, bruksinnsikt, solution checker-håndheving, maker-velkomst, og medlemskap i environment groups. Alle miljøer i sone 2 og 3 skal være Managed. Sone 1-miljøer blir det automatisk når de opprettes av routing i en gruppe som er Managed.

Lisens: Managed Environments krever at brukerne i miljøet har en betalt Power Platform-lisens (eller pay-as-you-go). Det er sjelden et problem for Code Apps, som uansett krever Premium for brukerne; se [Lisensmodell](../strategi/lisensmodell.md).

## Environment groups og regler

En environment group samler miljøer som skal ha samme regler. Regelen settes på gruppen og gjelder alle miljøene i den. Det er her Code Apps styres: regelen **Power Apps code apps** slår funksjonen på eller av for hele gruppen, og overstyrer miljøets egen innstilling.

Minimumsoppsettet for piloten:

| Gruppe | Miljøer | Regler som skiller seg |
|---|---|---|
| Standard | Default-miljøet | Code Apps **av**. Deling begrenset. Microsoft 365-connectorer |
| Personlige utviklermiljøer | Opprettes av routing | Code Apps **på** for pilotgruppen (egen gruppe) eller av for alle andre. Deling kun til seg selv |
| Team (sone 2) | Ett per avdeling | Code Apps på. Solutions anbefalt |
| Enterprise (sone 3) | Dev/Test/Prod-sett | Code Apps på. Solution checker håndhevet, deling kun til grupper |

!!! tip "To grupper for utviklermiljøer i piloten"
    Routing sender alle nye makere til samme gruppe. Skal bare piloten få Code Apps i sone 1, lag en egen gruppe for pilotens utviklermiljøer, flytt miljøene dit manuelt etter at routing har opprettet dem, og sett regelen der. Når Code Apps åpnes for alle, slås gruppene sammen. [Hvem får bygge](hvem-faar-bygge.md) viser klikkene.

Andre regler som er verdt å sette fra start: maker welcome content (lenke til kanalen og denne veiledningen), sharing limits, og usage insights til CoE-lederen.

## Environment routing

Routing gjør at en bruker som åpner maker-portalen første gang får sitt eget utviklermiljø i stedet for å lande i default. Det er den enkleste måten å tømme default-miljøet for nye apper. Routing krever at det finnes en Managed environment group å sende dem til, og kan begrenses til en sikkerhetsgruppe, slik at bare utviklere får personlige miljøer.

For Code Apps er routing nyttig på én måte til: `pa app init` spør etter miljø, og utvikleren velger sitt eget. Finnes det ikke, havner appen i default, der Code Apps skal være av. Da feiler `pa app push`, som er riktig.

## Personlige utviklermiljøer og Dataverse

Et personlig utviklermiljø har Dataverse, så Code Apps med Dataverse-tabeller kan bygges der. Det har en begrenset kapasitet og kan ikke brukes til produksjon. Utviklermiljøer som ikke brukes på en stund kan ryddes automatisk; det er en fordel, ikke et problem, så lenge koden ligger i et repo.

## Rekkefølgen når dere setter opp

1. Gjør default-miljøet Managed, og legg det i en gruppe med Code Apps av.
2. Lag gruppene for sone 2 og 3, og legg eksisterende miljøer i dem.
3. Lag gruppen for utviklermiljøer, og slå på routing mot den, begrenset til utviklerne.
4. Lag pilotgruppen, flytt pilotens utviklermiljøer dit, slå Code Apps på der.
5. Først nå: DLP. Se [DLP og Code Apps](../sikkerhet/dlp-og-code-apps.md).

Verktøykassen har et skript som gjør steg 1 til 4 med placeholders; se [Skript](../verktoykasse/skript.md).

## Neste steg

[Hvem får bygge](hvem-faar-bygge.md) for bryteren og rollene. [Reaktiv styring](reaktiv-styring.md) for hva som skjer når noen likevel bygger utenfor gruppene.

## Kilder

- Microsoft Learn, Managed Environments overview: https://learn.microsoft.com/power-platform/admin/managed-environment-overview (lest 2026-10-23)
- Microsoft Learn, Environment groups: https://learn.microsoft.com/power-platform/admin/environment-groups (lest 2026-10-23)
- Microsoft Learn, Environment routing: https://learn.microsoft.com/power-platform/admin/default-environment-routing (lest 2026-10-23)
- Microsoft Learn, Power Apps code apps overview (environment setting og group rule): https://learn.microsoft.com/power-apps/developer/code-apps/overview (lest 2026-10-23)
