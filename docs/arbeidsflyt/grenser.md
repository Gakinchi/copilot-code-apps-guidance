---
title: Grenser
tags: [utvikler, arkitekt]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Grenser: hva Copilot ikke får gjøre i dette oppsettet

**Hvem denne siden er for:** utvikleren som skal vite hvor streken går, og arkitekten som skal skrive streken inn i instruksjonsfilen og policyene. Noen av grensene kan håndheves teknisk; de fleste er arbeidsregler teamet holder. Begge typer står her, merket.

## Grensene

| Agenten får ikke | Håndheves av | Hvorfor |
|---|---|---|
| Kjøre `pa app push` mot Test eller Prod | Teknisk: ingen Environment Maker i de miljøene; pipelinen har identiteten | Sone 3 krever pipeline og godkjenning. [Soner](../styring/soner.md) |
| Legge til en connector eller datakilde uten at du har godkjent det eksplisitt | Arbeidsregel, og instruksjonsfilen | En connector er en styringsbeslutning. Review fanger det, DLP stopper det, men du skal fange det før |
| Endre `power.config.json` for hånd | Arbeidsregel | Filen skrives av `pa`. Håndredigering gir en app som peker feil |
| Lese eller skrive hemmeligheter, `.env`, nøkler | Teknisk: ingen hemmeligheter i repoet; push protection. Arbeidsregel: aldri i prompt | [Hemmeligheter](../sikkerhet/hemmeligheter.md) |
| Endre DLP, environment groups, miljøinnstillinger eller deling | Teknisk: utvikleren har ikke admin-rolle; agenten arver utviklerens rettigheter | Agenten kan ikke gjøre mer enn deg. Sørg for at du ikke kan gjøre det heller, fra denne maskinen |
| Kjøre med `--allow-all` i et repo med brukere | Arbeidsregel | Godkjenning per handling er det som gjør at du leser. `--allow-all` er for engangsmapper |
| Merge en pull request | Teknisk: branch-beskyttelse | En agent åpner PR-er; mennesker merger |
| Installere plugins eller MCP-servere utenfor listen i instruksjonsfilen | Teknisk delvis: MCP-register i Copilot-policyen. Arbeidsregel for resten | [Copilot-policyer](../sikkerhet/copilot-policyer.md) |
| Love noe om preview-funksjoner i kode eller dokumentasjon | Arbeidsregel | R5 i [risikoregisteret](../strategi/risikoregister.md) |
| Bruke en modell utenfor policyen | Teknisk: modellpolicy i GitHub | Dataresidens og avtaler. [GDPR og EU-datagrense](../norge/gdpr-og-eu-datagrense.md) |

## Hvorfor agenten ikke er problemet

Agenten arver utviklerens identitet og rettigheter. Alt den kan gjøre galt mot plattformen, kunne utvikleren gjort. Den reelle forskjellen er hastighet og mengde: en agent som har lov til å pushe til prod, gjør det på sekunder, uten den pausen en utvikler tar. Grensene over er derfor først og fremst grenser for hva utviklerens konto kan, og så arbeidsregler for det kontoen kan, men ikke skal.

## Slik gjør du grensene til kontekst

Instruksjonsfilen skal ha grensene som en liste under «Do not», slik at agenten ser dem i hver økt. [Instruksjoner og agenter](instructions-og-agents.md) har teksten. Det hjelper ikke mot en agent som ignorerer dem, men det stopper de fleste forslagene før de kommer.

## Claude Code som alternativ

Claude Code har en tillatelsesmodell per verktøy og kommando som kan settes i prosjektets innstillinger, slik at «aldri `pa app push`» kan være en regel, ikke bare en setning. Bruk den der Claude Code er i bruk. Copilot CLI har hooks som kan sjekke kommandoer mot en liste; det er den tilsvarende mekanismen.

## Neste steg

[Instruksjoner og agenter](instructions-og-agents.md) for å skrive grensene inn. [Review-regler](review-regler.md) for det som slipper gjennom.

## Kilder

- GitHub Docs, Administer Copilot CLI for your enterprise: https://docs.github.com/en/copilot/how-tos/copilot-cli/administer-copilot-cli-for-your-enterprise (lest 2026-10-23)
- GitHub Docs, Overview of customizing GitHub Copilot CLI (hooks): https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/overview (lest 2026-10-23)
- Microsoft Learn, Publish code apps with a service principal: https://learn.microsoft.com/power-apps/developer/code-apps/how-to/use-service-principal (lest 2026-10-23)
