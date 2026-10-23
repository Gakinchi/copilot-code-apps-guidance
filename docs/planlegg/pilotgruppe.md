---
title: Pilotgruppe
tags: [arkitekt]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Pilotgruppe: hvem som starter, og hvordan du holder det avgrenset

**Hvem denne siden er for:** arkitekten som skal foreslå piloten for ledelsen, og admin som skal sette den opp teknisk. En pilot som er for stor drukner i support, en som er for liten gir ingen tall. Og en pilot som ikke er avgrenset teknisk, er ingen pilot; da er Code Apps på for alle.

## Hvem

| Velg | Fordi |
|---|---|
| Ett til tre team som allerede skriver TypeScript eller React | De trenger ikke lære rammeverket samtidig som verktøyet |
| Team med en reell app å bygge de neste 60 dagene | Piloter uten en ekte oppgave produserer demoer, ikke tall |
| Minst én champion per team | GitHubs anbefaling; noen må svare i kanalen når CoE ikke er der |
| Utviklere som vil, ikke utviklere som er pålagt | Første bølge setter tonen i kanalen |
| Fem til femten utviklere totalt | Nok til tall, lite nok til at CoE kan følge hver enkelt |

Ta med én person fra governance- eller admin-siden som pilotdeltaker, ikke bare som støtte. Den personen oppdager hva styringen mangler før resten av organisasjonen gjør det. I en workshop våren 2026 var det nettopp admin-teamet som kom med den beste bruksidéen: en Code App for sin egen styringsoversikt.

## Hva de bygger

En app som har brukere utover dem selv innen 60 dager, mot en datakilde organisasjonen allerede har (Dataverse eller SharePoint), uten premium-connectorer utover det. Målet med piloten er ikke appen; det er å få tall på K8, tid fra oppgave til fungerende versjon, og å finne hullene i styringen og instruksjonsfilene.

## Teknisk avgrensning

Piloten må være lukket i plattformen, ikke bare i et dokument. Oppskriften er den samme som i [Hvem får bygge](../styring/hvem-faar-bygge.md):

1. En Entra-sikkerhetsgruppe `[Copilot-Pilot]` med pilotutviklerne. Copilot-seter tildeles denne gruppen.
2. En environment group for piloten med regelen **Power Apps code apps** satt til På. Pilotutviklernes personlige utviklermiljøer flyttes inn, pluss ett delt pilotmiljø for apper som skal ha brukere.
3. Standardgruppen og standardmiljøet beholder Code Apps av.
4. DLP-overlegget for pilotgruppen tillater connectorene piloten trenger, og ingen andre.
5. Content exclusions i GitHub for repoer piloten ikke skal røre.

Sjekk: en utvikler utenfor piloten med maker-rolle i eget miljø får beskjed om at Code Apps ikke er aktivert når de prøver `pa app init`; en pilotutvikler lykkes.

!!! note "Et annet produkt, en annen bryter"
    Copilot Managed Runtime styres med egne brytere i Microsoft 365 admin center og egne regler for `ms`-CLI-en. De har ingen effekt på Code Apps-piloten, og Code Apps-regelen har ingen effekt på dem. Hvis noen i tenanten også prøver Managed Runtime, må den avgrenses separat.

## Hva piloten skal levere

| Leveranse | Frist | Til hvem |
|---|---|---|
| Baseline i KPI-arket | Før dag 1 | CoE |
| Ukentlig status: Copilot-bruk, apper i inventaret, spørsmål i kanalen | Hver uke | CoE, ledelsen i kortform |
| Første app i et teammiljø på solution med connection references | Dag 60 | Plattform-admin |
| Forslag til endringer i instruksjonsfilene og sonematrisen | Dag 75 | CoE |
| Undersøkelse dag 30 og dag 90 | Dag 30, dag 90 | Adopsjonsleder |
| Pilotevaluering med anbefaling | Dag 90 | Ledelsen |

[Pilotevaluering](../maaling/pilot-evaluering.md) har kriteriene.

## Det som pleier å gå galt

- **Lisensen kommer sent.** Bestill Copilot-seter og bekreft Power Apps-lisenser før dag 1, ikke i uke 2.
- **Piloten får et miljø uten Dataverse**, og den første appen trenger det. Sjekk miljøet før workshopen.
- **Champions blir supportavdeling.** Sett ukentlige office hours med CoE fra uke 1, slik at spørsmålene har et sted å gå.
- **Piloten bygger noe ingen skal bruke.** Da får du ingen tall på K8 og ingen app i sone 2. Velg oppgaven før du velger teamet.

## Neste steg

[Utrullingsplan](utrullingsplan.md) setter piloten inn i tidslinjen. [Hvem får bygge](../styring/hvem-faar-bygge.md) har den tekniske oppskriften i detalj.

## Kilder

- GitHub Docs, Measuring the success of a GitHub Copilot trial: https://docs.github.com/en/copilot/tutorials/roll-out-at-scale (lest 2026-10-23)
- GitHub Docs, Driving Copilot adoption in your company (champions): https://docs.github.com/en/copilot/tutorials/roll-out-at-scale/enable-developers/drive-adoption (lest 2026-10-23)
- Microsoft Learn, Rules for environment groups (Power Apps code apps): https://learn.microsoft.com/power-platform/admin/environment-groups-rules (lest 2026-10-23)
