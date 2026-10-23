---
title: Oppsett av maskinen
tags: [utvikler]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Oppsett av maskinen

**Hvem denne siden er for:** utvikleren som skal gjøre hurtigstarten. Alt på siden gjøres én gang per maskin. Det tar et kvarter hvis lisensene er på plass, og det er lisensene som pleier å mangle, så sjekk dem først.

## Sjekk lisensene før du installerer noe

| Du trenger | Hvorfor | Slik sjekker du |
|---|---|---|
| Et GitHub Copilot-sete (Business eller Enterprise) | Copilot CLI nekter å logge inn uten | Åpne github.com, **Settings** > **Copilot**; står det at Copilot er aktivert via organisasjonen din, er du dekket |
| En konto i Power Platform med maker-rolle i et miljø der Code Apps er slått på | `pa app init` og `pa app push` feiler ellers | Åpne make.powerapps.com, velg miljøet, se at du får opprette apper. Spør admin om «Enable code apps» er på; se [Hvem får bygge](../styring/hvem-faar-bygge.md) |
| Power Apps Premium, pay-as-you-go eller App Pass for brukerne som skal kjøre appen | Appen kjører, men brukerne stoppes | Admin ser lisensene i Microsoft 365 admin center |
| Tilgang til connectorene du skal bruke | DLP kan blokkere dem i miljøet | Opprett en tilkobling i maker-portalen for connectoren; blir du stoppet, er det DLP, ikke deg |

!!! warning "Ikke anta lisens"
    Den vanligste grunnen til at en hurtigstart feiler på første forsøk er en lisens som ikke er tildelt, eller et miljø der Code Apps er av. Sjekk begge før du skriver en linje kode.

## Installer verktøyene

Rekkefølgen under er den hurtigstarten forutsetter.

1. **Node.js LTS.** Last ned fra nodejs.org, eller `winget install OpenJS.NodeJS.LTS`.
   Sjekk: `node --version` viser v22 eller nyere.

2. **Git.** `winget install Git.Git`.
   Sjekk: `git --version`.

3. **Visual Studio Code**, eller editoren du bruker. Copilot CLI trenger ingen editor, men du vil ha én.

4. **Power Apps CLI for Code Apps.**
   ```bash
   npm install --global @microsoft/power-apps-cli
   ```
   Sjekk: `pa --version` viser 1.3.0 eller nyere.

5. **GitHub Copilot CLI.** Velg én:
   ```bash
   winget install GitHub.Copilot
   npm install -g @github/copilot
   ```
   På macOS: `brew install copilot-cli`. Sjekk: `copilot --version`.

6. **Logg inn i Copilot.** Start `copilot`, skriv `/login` og følg nettleseren. Sjekk: `copilot` starter uten å spørre om innlogging neste gang.

7. **Logg inn i Power Platform.**
   ```bash
   pa auth login
   ```
   Sjekk: `pa auth status` viser kontoen din.

8. **Installer Power Platform Skills-pluginen for Code Apps.** Utenfor en Copilot-økt:
   ```bash
   copilot plugin marketplace add microsoft/power-platform-skills
   copilot plugin install code-apps-preview@power-platform-skills
   ```
   Inne i en Copilot-økt er det `/plugin marketplace add …` og `/plugin install …`. Sjekk: `copilot plugin list` viser `code-apps-preview@power-platform-skills`. Start Copilot på nytt etterpå.

!!! note "Verifisert 2026-10-23"
    Copilot CLI 1.0.61, `pa` 1.3.0, plugin 1.1.0. Pluginnavnet på Microsoft Learn er `code-apps-preview`; eldre workshop-materiale skriver `code-apps`. Bruk det Learn skriver, og sjekk `copilot plugin list` hvis noe mangler.

## Nettleserens spørsmål om lokalt nettverk

Når du kjører appen lokalt, åpner du en Local Play-URL på apps.powerapps.com som laster appen fra `localhost`. Chrome og Edge blokkerer slike kall fra offentlige sider til lokale adresser, og viser et spørsmål om **Local Network Access** første gang. Godta det. Uten det ser du en tom app og en feil i konsollen, og det er lett å tro at noe er galt med koden.

## Claude Code som alternativ

Den samme pluginen, de samme kommandoene og de samme prompt-filene fungerer i Claude Code. Start økten med `claude` i stedet for `copilot`, og installer pluginen med `claude plugin marketplace add microsoft/power-platform-skills` og `claude plugin install code-apps-preview@power-platform-skills`. Det krever en Claude-lisens (Claude Enterprise i en virksomhet). Resten av veiledningen skriver `copilot`; bytt ut navnet.

## Neste steg

[Hurtigstart](hurtigstart.md): fra tom mappe til publisert app.

## Kilder

- Microsoft Learn, Quickstart: Build a code app with GitHub Copilot: https://learn.microsoft.com/power-apps/developer/code-apps/how-to/quickstart-github-copilot (lest 2026-10-23)
- Microsoft Learn, Quickstart: Create a code app using the Power Apps CLI (Local Network Access-avsnittet): https://learn.microsoft.com/power-apps/developer/code-apps/how-to/npm-quickstart (lest 2026-10-23)
- GitHub Docs, Installing GitHub Copilot CLI: https://docs.github.com/en/copilot/how-tos/set-up/install-copilot-cli (lest 2026-10-23)
