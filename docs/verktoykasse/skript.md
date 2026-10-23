---
title: Skript
tags: [arkitekt]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Skript

**Hvem denne siden er for:** administratoren som skal gjenskape testene og rutinene i veiledningen i egen tenant. Skriptene ligger i repoets `scripts/`-mappe. Hvert av dem endrer noe i tenanten du er logget inn i, så les dem før du kjører dem, og kjør dem først i en test-tenant eller mot et miljø du kan ofre.

| Skript | Gjør | Endrer | Forutsetter |
|---|---|---|---|
| `New-DemoDlpPolicy.ps1` | Lager en minimal DLP-policy for hele tenanten med standardklassifisering General, blokkerer én connector (Dropbox) og unntar ett utviklermiljø. Grunnlaget for testen på [DLP og Code Apps](../sikkerhet/dlp-og-code-apps.md) | Oppretter en DLP-policy. Flyter som allerede bruker Dropbox blir suspendert | Modulen `Microsoft.PowerApps.Administration.PowerShell`, Power Platform-administrator, interaktiv innlogging |

Flere skript kommer i milepæl 3: inventar-eksport fra Power Platform admin center, oppsett av environment groups for soner, og en sjekk av standardmiljøet for Code Apps som ikke hører hjemme der.

## Før du kjører et skript som endrer DLP

Forhåndsvis effekten. En ny eller strammere policy suspenderer flyter som bryter den innen et døgn, uten advarselsmodus. Kjør forhåndsvisningen per miljø, les listen over hva som vil bli suspendert, og enten utvid policyen eller få eiernes aksept skriftlig. [Tiltakslisten](maler/tiltaksliste.md) har forhåndsvisningen som eget punkt, P0.4.0, foran publiseringen.

## Erstatt plassholderne

Skriptene bruker `[Organisasjon]` og `<environment-id-to-exclude>` som plassholdere. Miljø-ID-en finner du i Power Platform admin center under miljøets detaljer, eller i maker-portalen under **Session details**.
