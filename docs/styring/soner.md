---
title: Soner
tags: [arkitekt]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Soner: hvilke miljøer som er for hva

**Hvem denne siden er for:** arkitekten som skal fylle ut [sonematrisen](../verktoykasse/maler/sonematrise.md). Sonemodellen er den samme som Microsofts anbefaling om miljøstrategi, delt i tre: personlig, team og enterprise. Denne siden legger til radene som Code Apps og AI-assistert bygging trenger, og forklarer hvorfor.

## Modellen

| Dimensjon | Sone 1, personlig | Sone 2, team | Sone 3, enterprise |
|---|---|---|---|
| Formål | Læring, eksperiment, prototyper for én person | Delte arbeidsflater for en avdeling | Forretningskritisk, organisasjonsbredt eller regulert |
| Miljøtype | Personlig utviklermiljø, opprettet av routing | Produksjonsmiljø for avdelingen, Managed | Dev/Test/Prod-sett, Managed |
| Hvem oppretter | Environment routing, automatisk | Admin etter forespørsel | Admin etter formell godkjenning |
| Eier | Makeren selv | Navngitt teameier | Navngitt produkteier og operatør |
| Connectorer | Microsoft 365-kjernen | Kjernen pluss godkjente avdelingsconnectorer | Allow-liste per arbeidslast |
| Deling | Kun deg selv, eller få navngitte | Innenfor teamets Entra-gruppe | Innenfor navngitt brukergruppe |
| Solutions | Nei | Ja | Ja, håndhevet |
| Pipelines | Nei | Personlig pipeline er greit | Egen pipeline-vert, påkrevd |
| Godkjenning før prod | Nei | Nei | Ja, navngitt godkjenner |

## Radene som er nye med Code Apps og Copilot

| Dimensjon | Sone 1, personlig | Sone 2, team | Sone 3, enterprise |
|---|---|---|---|
| **Enable code apps** | På for piloten, av for alle andre, styrt med environment group-regel | På | På, og kun via solution med pipeline |
| **Hvem kan kjøre `pa app push`** | Makeren selv, mot eget miljø | Teamets utviklere med Environment Maker-rolle | Kun pipelinen, med service principal; utviklere pusher aldri direkte |
| **Connection references og environment variables** | Valgfritt, men lær det her | Anbefalt | Påkrevd for alt som varierer mellom miljøer |
| **AI-assistert bygging med Copilot CLI** | Tillatt. Dette er der folk lærer | Tillatt, med instruksjonsfiler i repoet og review før merge | Tillatt, med samme review-regler som for kode skrevet for hånd, og uten rett til å endre pipeline eller miljøinnstillinger |
| **Plugin-markedsplass** | Power Platform Skills tillatt | Tillatt, versjoner låst i repoets instruksjonsfil | Tillatt, versjoner låst og endringer reviewet |
| **Repo** | Valgfritt, men anbefalt fra dag én | Påkrevd, i organisasjonens GitHub | Påkrevd, med branch-beskyttelse og CI |
| **Hemmeligheter** | Aldri i repo, aldri i `power.config.json`, aldri i prompt | Samme | Samme, og secret scanning slått på |

Rekkefølgen i tabellen er bevisst: Code Apps i sone 1 er der utviklerne lærer verktøyene uten å kunne skade noe, sone 2 er der de fleste apper lever, og sone 3 er der ingen pusher fra laptopen.

## Hvordan Copilot passer inn

GitHub Copilot ser ikke sonene. Den ser repoet, instruksjonsfilene og det utvikleren spør om. Sonen håndheves av Power Platform, i det øyeblikket `pa app push` treffer et miljø: er Code Apps av, eller connectoren blokkert av DLP, feiler kommandoen uansett hvor god koden er. Det er poenget med modellen: Copilot får skrive fritt, plattformen bestemmer hva som får kjøre.

To ting hører likevel hjemme på GitHub-siden, ikke i Power Platform: hvilke repoer Copilot får lese (content exclusions) og hvilke modeller og plugins organisasjonen tillater. Se [Copilot-policyer](../sikkerhet/copilot-policyer.md).

## Promotering mellom soner

En app som startet i sone 1 og får brukere utover makeren selv, skal opp i sone 2. For en Code App betyr det konkret:

1. Koden ligger i et repo i organisasjonens GitHub, ikke bare på laptopen.
2. Appen er lagt i en solution med publisher-prefiks, og datakildene bruker connection references.
3. Verdier som varierer mellom miljøer er environment variables, lagt til med `@envvar:` ved `pa app add data-source`.
4. `power.config.json` peker på teamets miljø, ikke makerens personlige.
5. Noen andre enn makeren har reviewet koden, også den delen Copilot skrev.

Promotering til sone 3 legger til pipeline, service principal for `pa app push --non-interactive`, og godkjenning før prod. [ALM for Code Apps](../drift/alm-for-code-apps.md) beskriver mekanikken.

## Neste steg

Fyll ut [sonematrisen](../verktoykasse/maler/sonematrise.md) med organisasjonens navn på grupper og connectorer, og gå til [Miljøer og grupper](miljoer-og-grupper.md) for mekanismene som håndhever den.

## Kilder

- Microsoft Learn, Establish an environment strategy: https://learn.microsoft.com/power-platform/guidance/adoption/environment-strategy (lest 2026-10-23)
- Microsoft Learn, Environment groups: https://learn.microsoft.com/power-platform/admin/environment-groups (lest 2026-10-23)
- Microsoft Learn, Power Apps code apps, ALM: https://learn.microsoft.com/power-apps/developer/code-apps/how-to/alm (lest 2026-10-23)
- Sonemodellen bygger på en governance-metode brukt på norske tenanter i 2026; de tre sonene er uendret, radene for Code Apps og Copilot er nye.
