---
title: Reaktiv styring
tags: [arkitekt]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Reaktiv styring: det som skjer etter lansering

**Hvem denne siden er for:** CoE-lederen og Power Platform-administratoren. Proaktiv styring er sonene, gruppene og DLP-en. Reaktiv styring er det dere gjør når virkeligheten avviker: apper uten eier, Code Apps i feil miljø, utviklere som har sluttet, repoer som ikke lenger stemmer med det som kjører. Det er ikke en feil at det skjer. Det er en feil hvis ingen ser det.

## Inventaret

Inventaret er listen over alt som kjører, hvem som eier det og hvor. For Code Apps har det tre kilder som må leses sammen:

| Kilde | Gir | Hvordan |
|---|---|---|
| Power Platform admin center | Apper per miljø, type, eier, sist endret, delt med | Miljø → Resources → Apps; Code Apps vises med typen Code. Eksport til CSV |
| GitHub-organisasjonen | Repoer med `power.config.json`, sist commit, hvem som bidrar | Kodesøk i organisasjonen på filnavnet |
| Copilot usage metrics | Hvem som faktisk bruker Copilot, og hvor mye | Se [Copilot-metrikker](../maaling/copilot-metrics.md) |

Avviket mellom første og andre kilde er det interessante: en Code App i inventaret uten et repo i organisasjonen betyr at koden ligger på en laptop. Et repo uten app betyr at noen bygger utenfor plattformen, eller har sluttet.

Inntil videre: eksporter inventaret til CSV fra Inventory-siden i admin center, månedlig, og sammenlign med forrige eksport. Et skript som gjør det samme fra terminalen kommer i [Skript](../verktoykasse/skript.md) i milepæl 3. Se [Power Platform-metrikker](../maaling/power-platform-metrics.md) for hva inventaret inneholder.

## Signalene å reagere på

| Signal | Betyr ofte | Reaksjon |
|---|---|---|
| Code App i default-miljøet | Bryteren ble slått på manuelt, eller gruppe-regelen mangler | Bekreft regelen, kontakt eieren, flytt eller slett |
| App uten eier (eieren har sluttet) | Deling til enkeltperson, ikke gruppe | Tildel ny eier via admin center, og del til gruppe |
| App delt med «alle» i sone 2 | Noen omgikk sharing limits, eller miljøet er ikke Managed | Begrens delingen, sjekk gruppen |
| Repo uten commit på 90 dager, app i bruk | Vedlikeholdes ikke, eller koden ligger et annet sted | Spør eieren; arkiver eller overfør |
| Flyter suspendert etter DLP-endring | DLP ble publisert uten forhåndsvisning | Les [DLP og Code Apps](../sikkerhet/dlp-og-code-apps.md); kontakt eierne samme dag |
| Copilot-sete uten aktivitet på 28 dager | Utvikleren bruker det ikke, eller har byttet rolle | Spør før dere trekker setet; se [Lisensmodell](../strategi/lisensmodell.md) |

## Rutinen

**Ukentlig i piloten, månedlig etterpå:** kjør inventarskriptet, sammenlign, og gå gjennom signalene over. En time for CoE-lederen.

**Kvartalsvis:** gjennomgå environment groups og reglene, og lisensposisjonen. Fjern miljøer som ikke er i bruk. Sjekk at instruksjonsfil-malen fortsatt stemmer med CLI- og plugin-versjonene; se [Oppdateringstakt](../drift/oppdateringstakt.md).

**Ved hendelse:** DLP-brudd, nøkkel på avveie, app som ikke skulle vært delt. Håndter, og skriv én linje i [risikoregisteret](../strategi/risikoregister.md) om hva som kunne stoppet det tidligere.

## Når reaktiv styring blir proaktiv

Hvert signal som dukker opp mer enn to ganger, er en regel som mangler. Tre Code Apps i default på tre måneder betyr at gruppe-regelen ikke dekker alle miljøene. Oppdater [sonematrisen](../verktoykasse/maler/sonematrise.md), sett regelen, og flytt signalet fra lista over.

## Neste steg

[Beslutninger](beslutninger.md) for hvorfor veiledningen anbefaler dette. [Drift](../drift/index.md) for ALM og overvåking.

## Kilder

- Microsoft Learn, Management at scale (reactive governance): https://learn.microsoft.com/power-platform/guidance/adoption/govern-at-scale (lest 2026-10-23)
- Microsoft Learn, Manage app resources (change owner): https://learn.microsoft.com/power-platform/admin/admin-manage-apps (lest 2026-10-23)
- Inventarmetoden bygger på en governance-metode brukt på norske tenanter i 2026.
