---
title: Datakilder
tags: [utvikler]
verifisert: 2026-10-23
kilde: PÅ LEARN
---

# Datakilder: Dataverse og SharePoint gjennom connectorer

**Hvem denne siden er for:** utvikleren som skal få data inn i en Code App. Appen snakker ikke direkte med en database. Den går gjennom Power Platform-connectorer, med brukerens identitet, og CLI-en genererer typet TypeScript for hver datakilde. Det er likt for alle rammeverk.

## Slik legger du til en datakilde

```bash
pa app add data-source --connector dataverse --table account
pa app add data-source --connector "SharePoint" --connection-id <connection-id> --dataset <site-url> --table <list-name>
pa app add data-source --connector shared_office365users --connection-id <connection-id>
```

Kommandoen skriver genererte modeller og tjenester til `generated/` i prosjektet og registrerer datakilden i `power.config.json`. I koden kaller du for eksempel `AccountsService.getAll()`; tjenesten har ingen avhengighet til rammeverket, så den brukes likt fra en React-hook, en Vue-composable eller en Angular-service.

Uten `--connection-id` lister kommandoen tilkoblingene du har for connectoren og lar deg velge. `pa connection list` viser dem, `pa connection create --connector <id>` lager en ny uten å gå via portalen. Copilot gjør det samme for deg gjennom `create-app`-skillen, men kommandoene er verdt å kjenne når noe feiler.

## Tre ting som avgjør om det virker

1. **Brukeren må ha tilgang til dataene.** En Code App gir ikke tilgang; den bruker brukerens egen. Dataverse krever sikkerhetsroller, SharePoint krever tilgang til listen, og en bruker uten Dataverse-lisens stoppes uansett.
2. **Connectoren må være tillatt av DLP** i miljøet. Dataverse er en Premium-connector; SharePoint er Standard. Sjekk før du bygger; se [DLP og Code Apps](../sikkerhet/dlp-og-code-apps.md).
3. **Tilkoblingen tilhører den som laget den.** For ALM bruker du connection references i en solution, slik at appen rebindes til riktig tilkobling i hvert miljø. Verdier som varierer per miljø, for eksempel en SharePoint-site, refereres som environment variables med `@envvar:` når du legger til datakilden. Se [ALM for Code Apps](../drift/alm-for-code-apps.md).

## Grenser du planlegger rundt

| Grense | Verdi | Konsekvens |
|---|---|---|
| Connectorer per app | Under ti som rettesnor | Flere gir lengre lastetid og problemer ved lagring; samme press som for canvas-apper |
| Connection references per app | Under tjue | Samme grunn |
| SharePoint-delegering | Bare deler av spørringene utføres i kilden; ID-felt støtter kun `=` | Store lister må filtreres på serversiden eller deles opp; test med realistiske datamengder |
| Dataverse-valg og oppslag | Hentes gjennom den genererte tjenesten | Ingen Power Fx-funksjoner som `Choices()`; nedtrekk fylles fra tjenesten |

Feilsøking av delegering gjøres med Live Monitor under Advanced tools i maker-portalen.

## Dataverse-handlinger og flyter

Utover tabeller kan en Code App kalle Dataverse-handlinger og -funksjoner (`pa app add dataverse-api`) og instant-flyter i Power Automate (`pa app add flow`). Flyten må ligge i en solution og ha Power Apps-trigger, og brukerne trenger Dataverse-rettigheter til å kalle den. Det er der forretningsregler som må håndheves utenfor nettleseren hører hjemme.

## Hva Copilot trenger å vite

Legg inn i repoets instruksjonsfil hvilke connectorer appen får bruke, hvilke tabeller og lister som finnes, og regelen om connection references. Da foreslår agenten riktig datakilde første gang i stedet for å finne på en. Se [Instruksjonsfiler](instructions-og-agents.md).

## Neste steg

[Daglig loop](daglig-loop.md) viser hvordan datakildene inngår i arbeidet fra oppgave til push.

## Kilder

- Microsoft Learn, Add data sources to your code app: https://learn.microsoft.com/power-apps/developer/code-apps/how-to/connect-to-data (lest 2026-10-23)
- Microsoft Learn, Power Apps CLI command reference, `pa app add data-source`: https://learn.microsoft.com/power-apps/developer/code-apps/reference/cli (lest 2026-10-23)
- Microsoft Learn, Add Power Automate flows to a code app: https://learn.microsoft.com/power-apps/developer/code-apps/how-to/add-flows (lest 2026-10-23)
- Microsoft Learn, Use environment variables in code apps: https://learn.microsoft.com/power-apps/developer/code-apps/how-to/use-environment-variables (lest 2026-10-23)
