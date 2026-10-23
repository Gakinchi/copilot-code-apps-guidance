---
title: Hemmeligheter
tags: [utvikler, arkitekt]
verifisert: 2026-10-23
kilde: PÅ LEARN
---

# Hemmeligheter: hvor de ikke skal ligge

**Hvem denne siden er for:** utvikleren som setter opp et Code App-repo, og arkitekten som skal sette reglene. En Code App er en Vite-app som kjører i brukerens nettleser. Alt som ligger i bundelen kan leses av brukeren. Det er den første regelen, og alle de andre følger av den.

## Fire steder hemmeligheter havner, og hvorfor de ikke skal

| Sted | Hva som skjer | Regel |
|---|---|---|
| Repoet (`.env`, config-filer, kode) | Alle med lesetilgang ser den, Copilot leser den som kontekst, og historikken husker den etter sletting | Aldri. Secret scanning på i organisasjonen, push protection på |
| `power.config.json` | Filen skrives av `pa`-CLI-en og inneholder miljø-ID, app-ID og connection-ID-er. Det er identifikatorer, ikke hemmeligheter, men filen skal ikke inneholde noe mer | Commit den, men legg aldri nøkler i den |
| Environment variables i Power Platform | Verdier kan eksporteres med solutionen. Microsoft sier selv at de ikke skal brukes til hemmeligheter | Bruk dem til URL-er, listenavn og miljøspesifikke verdier, aldri til nøkler |
| Prompten til Copilot | Det du limer inn sendes til modellen. Content exclusions hindrer ikke det du selv limer inn, og gjelder ikke Copilot CLI | Lim aldri inn nøkler, tokens eller passord i en prompt, heller ikke for «å teste» |

## Hva en Code App bruker i stedet

En Code App snakker ikke med API-er direkte med egne nøkler. Den kaller connectorer gjennom Power Platform, og hver connector har en **connection** som eies av en bruker eller en service principal. Nøkkelen, hvis connectoren trenger en, ligger i connection-objektet på plattformsiden, ikke i appen. Brukeren autentiserer med egen identitet, og appen får bare det brukeren får.

Det betyr i praksis:

- Datakilder legges til med `pa app add data-source`, som binder appen til en connection-ID i `power.config.json`. Appen ser aldri selve legitimasjonen.
- Trenger appen et eksternt API med nøkkel, lager dere en custom connector med nøkkelen i connectorens sikkerhetsoppsett, og appen kaller connectoren.
- Trenger dere en hemmelighet i en pipeline (for eksempel service principal-sekreten til `pa app push`), ligger den i GitHub Actions secrets eller Azure Key Vault, aldri i workflow-filen.

## Secret scanning og push protection

GitHub secret scanning finner kjente nøkkelformater i repoet, og push protection stopper pushen før hemmeligheten havner i historikken. Begge slås på per repo eller for hele organisasjonen under Code security. For Copilot-utvikling er push protection den viktigste, fordi en modell som får beskjed om å «få det til å virke» kan foreslå å hardkode en verdi den fant i en loggfil. Push protection fanger det før det blir et problem.

Instruksjonsfilen i repoet skal ha én linje om dette, slik at Copilot ikke foreslår det i utgangspunktet. [Instruksjoner og agenter](../arbeidsflyt/instructions-og-agents.md) har malen.

## Når det likevel har skjedd

1. Roter nøkkelen først. Sletting fra repoet er ikke nok; historikken har den.
2. Fjern den fra historikken hvis repoet er privat og lite, eller aksepter at den er brent og gå videre.
3. Sjekk om Copilot-økten der den ble limt inn ble lagret i noe en annen kan lese (delte økter, logger).
4. Skriv en linje i [risikoregisteret](../strategi/risikoregister.md) om hvordan det skjedde.

## Claude Code som alternativ

Samme regler. Claude Code leser prosjektfiler som kontekst på samme måte, og en ignore-fil er ikke en erstatning for å holde hemmeligheter ute av repoet.

## Neste steg

[Identitet og tilgang](identitet-tilgang.md) for hvem som eier connections og hvordan pipelinen autentiserer. [Repo-konvensjoner](../arbeidsflyt/repo-konvensjoner.md) for hva som committes.

## Kilder

- Microsoft Learn, Use environment variables in code apps: https://learn.microsoft.com/power-apps/developer/code-apps/how-to/use-environment-variables (lest 2026-10-23)
- Microsoft Learn, ALM for code apps (environment variables og solutions): https://learn.microsoft.com/power-apps/developer/code-apps/how-to/alm (lest 2026-10-23)
- GitHub Docs, About push protection: https://docs.github.com/en/code-security/secret-scanning/introduction/about-push-protection (lest 2026-10-23)
- GitHub Docs, Content exclusions for Copilot: https://docs.github.com/en/copilot/how-tos/configure-content-exclusion (lest 2026-10-23)
