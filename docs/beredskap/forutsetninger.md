---
title: Forutsetninger
tags: [utvikler]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Forutsetninger: sjekklisten før workshopen

**Hvem denne siden er for:** deltakeren uken før workshopen, og champion-en som samler bekreftelsene. Alt på listen skal være grønt før dagen. Det som ikke er det, meldes i kanalen med skjermbilde, så admin kan rette det i tide.

## På maskinen

| # | Sjekk | Kommando | Forventet |
|---|---|---|---|
| 1 | Node LTS | `node --version` | v24.x (eller versjonen i [Arbeidsflyt](../arbeidsflyt/index.md)) |
| 2 | Git | `git --version` | Hvilken som helst nyere |
| 3 | `pa`-CLI-en | `pa --version` | 1.3.x eller nyere |
| 4 | Copilot CLI | `copilot --version` | 1.0.6x eller nyere |
| 5 | Pluginen | `copilot plugin list` | `code-apps-preview@power-platform-skills` |
| 6 | En editor med terminal | | VS Code eller tilsvarende |

Installasjon: [Oppsett av maskinen](../arbeidsflyt/oppsett-maskin.md).

## Innlogget

| # | Sjekk | Kommando | Forventet |
|---|---|---|---|
| 7 | Power Platform | `pa auth status` | Din jobbkonto, riktig tenant |
| 8 | GitHub | `copilot` og `/login` | Innlogget; Copilot svarer |
| 9 | Nettleser | Åpne make.powerapps.com | Samme konto som i 7; utviklermiljøet ditt vises i miljøvelgeren |

## Tilganger

| # | Sjekk | Hvordan | Forventet |
|---|---|---|---|
| 10 | Copilot-sete | `copilot` starter uten feilmelding om lisens | |
| 11 | Utviklermiljø med Code Apps på | `pa app init` i en tom testmappe lister miljøet; avbryt etterpå | Miljøet vises |
| 12 | Connection for workshop-datakilden | `pa connection list` i samme mappe | Office 365 Users eller det admin har sagt |
| 13 | Repo i organisasjonens GitHub | Lenken fra champion-en åpner, og du kan klone | |

## Nettverk

| # | Sjekk | Hvordan |
|---|---|---|
| 14 | npm og GitHub nås fra lokalet | `npm view @microsoft/power-apps-cli version` fra lokalets nett |
| 15 | Local Play virker | Kjør hurtigstarten til steg 6 på forhånd, hjemme eller på kontoret, og godta Local Network Access |

## Lest

| # | Hva | Tid |
|---|---|---|
| 16 | [Produktene](../start/produktene.md) og [Seks måter](../start/seks-mater.md) | 30 min |
| 17 | [Hurtigstart](../arbeidsflyt/hurtigstart.md), og helst kjørt den | 2 timer |
| 18 | [Grenser](../arbeidsflyt/grenser.md) | 15 min |

## Bekreftelse

Legg skjermbilde av 5, 7 og 11 i kanalen senest to dager før. Champion-en krysser av. Tre deltakere med rødt på 11 betyr at admin har en jobb, ikke at workshopen går likevel.

## Neste steg

[Workshop-oppsett](workshop-oppsett.md) for dagen. [Feilsøking](../arbeidsflyt/feilsoking.md) hvis noe over er rødt.
