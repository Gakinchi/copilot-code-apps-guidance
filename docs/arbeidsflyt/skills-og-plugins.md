---
title: Skills og plugins
tags: [utvikler, arkitekt]
verifisert: 2026-10-23
kilde: PÅ LEARN
---

# Skills og plugins: Microsofts markedsplass for Power Platform

**Hvem denne siden er for:** utvikleren som skal velge riktig plugin, og arkitekten som skal bestemme om organisasjonen tillater markedsplassen. En plugin er en pakke med ferdige arbeidsflyter, kalt skills, som Copilot CLI kan kjøre som kommandoer. Microsoft vedlikeholder én markedsplass for Power Platform, og den dekker flere apptyper enn Code Apps.

## Markedsplassen

`microsoft/power-platform-skills` er et åpent GitHub-repo. Du legger det til én gang og installerer de pluginene du trenger.

```bash
copilot plugin marketplace add microsoft/power-platform-skills
copilot plugin install code-apps-preview@power-platform-skills
```

Inne i en Copilot-økt heter kommandoene `/plugin marketplace add …` og `/plugin install …`. Microsoft tilbyr også et installasjonsskript som registrerer markedsplassen, installerer alle pluginene og slår på automatisk oppdatering i de agentverktøyene det finner:

```powershell
iwr https://raw.githubusercontent.com/microsoft/power-platform-skills/main/scripts/install.js -OutFile install.js; node install.js; del install.js
```

Les skriptet før du kjører det i en virksomhet; det installerer `pac` CLI hvis den mangler og endrer agentverktøyenes konfigurasjon. Anbefalingen her er å installere pluginene enkeltvis, slik at repoets instruksjonsfil kan si hvilke som er i bruk.

## Pluginene og hva de gjelder

| Plugin | Apptype | Hva skills-ene gjør | Lest på Learn |
|---|---|---|---|
| `code-apps-preview` | Power Apps Code Apps | `create-app` fra en beskrivelse, legg til connector, legg til datakilde, deploy; orkestrerer `pa`-CLI-en for deg | Quickstart: Build a code app with GitHub Copilot |
| `model-apps` | Model-driven apps og generative pages | Bygg og rediger model-driven apps og AI-genererte sider i en eksisterende app; krever `pac` og Azure CLI innlogget | Build and edit model-driven apps with AI code generation tools |
| `power-automate` | Cloud flows | Egen MCP-server følger med pluginen; lager og endrer flyter | Get started with the Power Automate plugin |
| `power-pages` | Power Pages code sites | Lager code sites i React/Angular/Vue mot Power Pages | Get started with the Power Pages plugin |
| `mobile-app` (preview) | Native mobilapper | Fra mal til app på enhet med hot reload og deploy til miljøet | Quickstart: Build a native mobile app |
| `canvas-apps` | Canvas apps | Canvas Authoring MCP: kodeførst redigering av canvas-apper gjennom en kompileringsløkke | Power Platform Skills README |

!!! note "Copilot Managed Runtime har sin egen markedsplass"
    Pluginen for Copilot Managed Runtime heter `microsoft-managed-apps` og ligger i markedsplassen `microsoft/Managed-Apps`, ikke i `power-platform-skills`. Den orkestrerer `ms`-CLI-en. Det er et annet produkt; se [Produktene, hva er hva](../start/produktene.md).

## Slik ser `create-app` ut i praksis

1. Start `copilot` i en tom mappe.
2. Kjør `/code-apps-preview:create-app`. Agenten sjekker at Node, `pa` og innloggingen er på plass, og installerer det som mangler.
3. Beskriv appen i naturlig språk, og ta med miljø-ID-en: «Deploy to environment: <environment-id>».
4. Agenten identifiserer datakilder, UI og interaksjoner, stiller noen spørsmål og viser en plan.
5. Når du godkjenner planen, kjører agenten `pa`-kommandoene: scaffold, `pa app init`, legg til connectorer, skriv kode.
6. Agenten spør om du vil deploye. Svarer du ja, kjører den bygg og `pa app push`, og du får URL-en til appen i Power Apps.

[Hurtigstart](hurtigstart.md) viser hvert steg med terminalbilde fra en ekte kjøring.

## Hva pluginen ikke gjør

- Den slår ikke på Code Apps i miljøet. Det gjør en admin; se [Hvem får bygge](../styring/hvem-faar-bygge.md).
- Den omgår ikke DLP. En connector som er blokkert i miljøet, feiler ved kjøring; se [DLP og Code Apps](../sikkerhet/dlp-og-code-apps.md).
- Den gir ikke lisens til sluttbrukerne.
- Den vet ikke hva organisasjonen har bestemt. Det må stå i repoets instruksjonsfil; se [Instruksjonsfiler](instructions-og-agents.md).

## For arkitekten: tillate markedsplassen

GitHub Copilot-policyene på organisasjonsnivå kan begrense hvilke plugins og MCP-servere utviklerne får installere. Før piloten: sjekk at `microsoft/power-platform-skills` er tillatt, og skriv ned hvilke plugins og versjoner piloten bruker i [styringsplanen](../verktoykasse/maler/styringsplan.md). Automatisk oppdatering er praktisk på en utviklermaskin og uønsket i en pipeline; der låser du versjonen.

## Claude Code

Alle pluginene i markedsplassen fungerer i Claude Code med samme skills-navn: `claude plugin marketplace add microsoft/power-platform-skills` og `claude plugin install <plugin>@power-platform-skills`. Learn-sidene viser begge verktøyene.

## Neste steg

[Hurtigstart](hurtigstart.md) for å se `create-app` fra start til slutt. [Instruksjonsfiler](instructions-og-agents.md) for å fortelle agenten hva organisasjonen har bestemt.

## Kilder

- Microsoft Learn, Quickstart: Build a code app with GitHub Copilot: https://learn.microsoft.com/power-apps/developer/code-apps/how-to/quickstart-github-copilot (lest 2026-10-23)
- Microsoft Learn, Build and edit model-driven apps with AI code generation tools: https://learn.microsoft.com/power-apps/maker/model-driven-apps/model-driven-app-external-tools (lest 2026-10-23)
- Microsoft Learn, Get started with the Power Automate plugin for GitHub Copilot CLI and Claude Code: https://learn.microsoft.com/power-automate/power-automate-plugin-external-tools (lest 2026-10-23)
- Microsoft Learn, Get started with the Power Pages plugin: https://learn.microsoft.com/power-pages/configure/create-code-site-using-claude-code (lest 2026-10-23)
- Microsoft Learn, Quickstart: Build a native mobile app with the Power Platform mobile-app plugin (preview): https://learn.microsoft.com/power-apps/mobile/native-apps/quickstart-native-apps (lest 2026-10-23)
- Microsoft Learn, Quickstart: Build a Microsoft Copilot Managed Runtime app with GitHub Copilot (preview): https://learn.microsoft.com/microsoft-365/managed-apps/developer/quickstart-github-copilot (lest 2026-10-23)
- GitHub, microsoft/power-platform-skills: https://github.com/microsoft/power-platform-skills (lest 2026-10-23)
- Egen test 2026-10-23: `copilot plugin install code-apps-preview@power-platform-skills` ga versjon 1.1.0 med Copilot CLI 1.0.61.
