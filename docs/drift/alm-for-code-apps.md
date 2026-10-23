---
title: ALM for Code Apps
tags: [arkitekt, utvikler]
verifisert: 2026-10-23
kilde: PÅ LEARN
---

# ALM for Code Apps: solutions, referanser og pipelines

**Hvem denne siden er for:** arkitekten som bestemmer hvordan apper flyttes mellom miljøer, og utvikleren som skal gjøre det riktig fra første push. Prinsippene er Power Platforms vanlige: solution som enhet, connection references for tilkoblinger, environment variables for verdier som varierer, pipelines for promotering. Det nye er at kildekoden ikke ligger i solutionen.

## To ting som lever hver for seg

| Hva | Hvor | Flyttes hvordan |
|---|---|---|
| Kildekoden (TypeScript, Vite, tester) | Git-repoet i organisasjonens GitHub | Branches, pull requests, CI |
| Den publiserte appen (bundle, metadata, binding til connections) | Power Platform-miljøet, i en solution | Solution-eksport og -import, eller Power Platform Pipelines |

Code Apps støtter ikke Power Platforms Git-integrasjon og ikke Solution Packager for selve koden. Det er ikke en mangel å jobbe rundt; koden skal uansett leve i Git med vanlige verktøy. Solutionen bærer appen som et artefakt, ikke som kilde.

## Solution fra første push

`pa app push` legger appen i en solution automatisk når miljøet har Dataverse. Ved første publisering velger CLI-en miljøets **preferred solution**, eller Default-solutionen hvis ingen er satt. Sett preferred solution i hvert sone 2- og sone 3-miljø før piloten, så havner appene riktig uten at utviklerne må huske noe.

For å styre eksplisitt:

```console
pa app push --solution-id <solution-guid>
```

Solution-ID må være en GUID; navn aksepteres ikke. I en pipeline settes `PA_CLI_SOLUTION_ID` som miljøvariabel i stedet. Ved senere push uten `--solution-id` beholder appen solution-tilhørigheten sin.

En app som allerede er publisert uten solution, legges til i maker-portalen: Solutions → solutionen → Add existing → App → Code app.

## Connection references

En datakilde lagt til med `pa app add data-source` binder appen til en bestemt connection-ID i `power.config.json`. Connection-ID-er er miljøspesifikke, så en app som importeres til Test ville pekt på Dev-connectionen. Connection references løser det: appen refererer til et logisk navn, og hvert miljø binder navnet til sin egen connection ved import. Pipelines sjekker at referansene er bundet før deploy.

Legg til datakilden med referanse fra starten:

```console
pa app add data-source --connector <connector> --connection-ref <logisk_navn> ...
```

Det er den ene regelen som skiller en app som kan promoteres fra en som må bygges om. [Sonematrisen](../verktoykasse/maler/sonematrise.md) krever det i sone 3 og anbefaler det i sone 2.

## Environment variables

Verdier som varierer mellom miljøer, SharePoint-site, listenavn, API-URL, legges i Power Platform environment variables og refereres med `@envvar:`-prefikset når datakilden legges til. Verdien løses fra målmiljøet ved kjøring. Ikke bruk dem til hemmeligheter; verdiene kan eksporteres med solutionen. [Hemmeligheter](../sikkerhet/hemmeligheter.md) har alternativene.

## Pipelines

Når appen er i en solution med connection references og environment variables, er promotering Dev → Test → Prod en vanlig Power Platform Pipeline, med preflight-sjekk av avhengigheter og referanser. Pipelines krever Managed Environments i målmiljøene, som sonemodellen uansett forutsetter.

Koden bygges og publiseres til Dev av GitHub Actions ([CI/CD](ci-cd.md)); solutionen flyttes videre av Power Platform Pipelines. To pipeliner, to ansvar: den ene eier koden, den andre eier miljøene.

## Det som ikke støttes

- Git-integrasjon i Power Platform for Code Apps.
- Solution-navn i `--solution-id`; bare GUID.
- Publisering uten Dataverse gir en app uten solution, som ikke kan promoteres. Sone 1-miljøer uten Dataverse er greit for læring, ikke for noe som skal videre.

## Claude Code som alternativ

Samme kommandoer, samme regler. Instruksjonsfilen skal si at `--connection-ref` alltid brukes ved `add data-source`, uansett hvilken agent som kjører kommandoen. [Instruksjoner og agenter](../arbeidsflyt/instructions-og-agents.md).

## Neste steg

[CI/CD](ci-cd.md) for pipelinen som bygger og publiserer. [Soner](../styring/soner.md) for hvilke krav som gjelder hvor.

## Kilder

- Microsoft Learn, ALM for code apps: https://learn.microsoft.com/power-apps/developer/code-apps/how-to/alm (lest 2026-10-23)
- Microsoft Learn, Connect to data, use connection references: https://learn.microsoft.com/power-apps/developer/code-apps/how-to/connect-to-data (lest 2026-10-23)
- Microsoft Learn, Use environment variables in code apps: https://learn.microsoft.com/power-apps/developer/code-apps/how-to/use-environment-variables (lest 2026-10-23)
- Microsoft Learn, Power Apps CLI environment variables: https://learn.microsoft.com/power-apps/developer/code-apps/reference/environment-variables (lest 2026-10-23)
- Microsoft Learn, Pipelines in Power Platform: https://learn.microsoft.com/power-platform/alm/pipelines (lest 2026-10-23)
