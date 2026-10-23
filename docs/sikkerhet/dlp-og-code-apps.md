---
title: DLP og Code Apps
tags: [arkitekt]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# DLP gjelder Code Apps, og beviset for det

**Hvem denne siden er for:** arkitekten og sikkerhetsansvarlig som får spørsmålet «men gjelder DLP-policyene våre også apper utviklerne skriver selv?». Svaret er ja, og denne siden viser hvordan det ble testet, slik at du kan gjenta testen i din egen tenant før du stoler på det.

## Hva DLP er, på én linje

En DLP-policy (data loss prevention) i Power Platform deler connectorer i tre grupper: Business, Non-business og Blocked. En app eller flyt kan ikke kombinere connectorer fra Business og Non-business, og kan ikke bruke en Blocked connector i det hele tatt. Policyen settes per tenant eller per miljø og gjelder alle apptyper, inkludert Code Apps, fordi en Code App når datakildene sine gjennom de samme connectorene som en canvas-app.

## Testen som ble kjørt

Testen ble gjort i en tenant med en minimal DLP-policy som dekker to produksjonsmiljøer og unntar ett preview-miljø. Dropbox ble satt som Blocked. Så ble en Code App koblet til Dropbox og kjørt i et styrt miljø og i det unntatte miljøet.

| Steg | Handling | Sjekk |
|---|---|---|
| 1 | Logg inn mot et miljø som dekkes av policyen | `pa auth status` viser riktig konto og miljø |
| 2 | Initialiser en Code App i en tom mappe | `power.config.json` finnes med miljøets ID |
| 3 | Opprett en Dropbox-tilkobling i maker-portalen i samme miljø | Funn 1: lar portalen deg opprette en tilkobling for en blokkert connector? |
| 4 | Legg Dropbox til som datakilde | Funn 2: lykkes `pa app add data-source`, eller stoppes det her? |
| 5 | Start appen lokalt og åpne Local Play | Funn 3, hovedresultatet: laster appen, eller får brukeren en DLP-konflikt? |
| 6 | Publiser og åpne den publiserte appen | Samme sjekk i det publiserte løpet |
| 7 | Gjenta i miljøet som er unntatt fra policyen | Kontroll: appen skal laste der |

Resultatet: appen med den blokkerte connectoren stoppes i det styrte miljøet og laster i det unntatte. Med andre ord håndhever Power Platform DLP-policyen for Code Apps på samme måte som for canvas-apper, uavhengig av at koden er skrevet utenfor Studio og uavhengig av hvem eller hva som skrev den.

!!! note "Egen test, oktober 2026"
    Testen er dokumentert med skjermbilder i Dennis Chis workshop-materiale og gjentatt i oktober 2026. Policyen, miljønavnene og tilkoblings-ID-ene er fjernet fra denne siden. Gjenta testen i egen tenant; det tar under en time, og resultatet er det som overbeviser sikkerhetsavdelingen.

## Hva det betyr for innføringen

- Du trenger ingen egen sikkerhetsmekanisme for Code Apps. DLP-arbeidet du allerede gjør, dekker dem.
- Du må verifisere connector-tilgang **før** en workshop eller pilot. En utvikler som får en DLP-feil på første forsøk, konkluderer med at Code Apps ikke virker.
- Copilot kan foreslå en connector som er blokkert. Agenten kjenner ikke policyen. Legg DLP-reglene inn i repoets instruksjonsfil, slik at forslagene holder seg innenfor; se [Instruksjonsfiler](../arbeidsflyt/instructions-og-agents.md).

## Regelen om å forhåndsvise før du publiserer

En DLP-endring suspenderer flyter som bryter den, uten advarselsmodus. Eierne får én e-post per flyt. Før du publiserer en ny eller strammere policy, forhåndsvis effekten per miljø og gå gjennom listen over det som vil bli suspendert. Enten utvider du policyen slik at ufarlige connectorer havner i Business, eller du dokumenterer akseptert risiko per flyt med eierens signatur. Behandle det som en hard port, ikke et råd. [Tiltakslisten](../verktoykasse/maler/tiltaksliste.md) har forhåndsvisningen som eget punkt foran publiseringen.

## Skript

Et PowerShell-skript som gjenskaper demo-policyen i egen tenant ligger i [Skript](../verktoykasse/skript.md). Les det før du kjører det; det endrer DLP i tenanten du er logget inn i.

## Neste steg

[Hvem får bygge](../styring/hvem-faar-bygge.md) viser bryteren som avgjør om en Code App i det hele tatt får kjøre i et miljø. [Copilot-policyer](copilot-policyer.md) dekker den andre siden: hva Copilot får se og foreslå.

## Kilder

- Microsoft Learn, Data loss prevention policies: https://learn.microsoft.com/power-platform/admin/wp-data-loss-prevention (lest 2026-10-23)
- Microsoft Learn, Power Apps code apps overview, «Managed platform capability support», raden om DLP ved oppstart av app: https://learn.microsoft.com/power-apps/developer/code-apps/overview (lest 2026-10-23)
- Egen test: «DLP Enforcement Test», code-apps-workshop, oktober 2026 (ikke publisert; gjenta i egen tenant).
