---
title: Ordliste
tags: [leder, arkitekt, utvikler]
verifisert: 2026-10-23
kilde: PÅ LEARN
---

# Ordliste

Engelske termer slik produktene bruker dem, med norsk forklaring. Termene oversettes ikke i veiledningen; se [Språkpolicy](norge/sprakpolicy.md).

## GitHub Copilot

| Term | Forklaring |
|---|---|
| **GitHub Copilot** | Produktfamilien. I denne veiledningen brukes navnet om Copilot CLI og Copilot i VS Code. |
| **Copilot CLI** | Agenten i terminalen, kommandoen `copilot`. Leser repoet, planlegger, kjører kommandoer etter godkjenning, bruker plugins. |
| **Agent mode** | Modusen der Copilot utfører flerstegs oppgaver selv, i stedet for bare å foreslå kode. Finnes i CLI-en og i VS Code. |
| **Copilot Business / Copilot Enterprise** | De to organisasjonslisensene. Enterprise forutsetter GitHub Enterprise Cloud og gir mer styring og kontekst. |
| **Seat** | Én lisens tildelt én bruker. Seter tildeles og trekkes tilbake av organisasjonens eiere. |
| **Policy** | Innstillinger på organisasjons- eller enterprise-nivå som styrer hva Copilot får gjøre: modeller, forslag som matcher offentlig kode, plugins, MCP-servere. |
| **Content exclusion** | Filer eller repoer Copilot ikke får lese eller bruke som kontekst. |
| **copilot-instructions.md** | Fil i repoet (`.github/copilot-instructions.md`) med stående instruksjoner til Copilot for det repoet. |
| **AGENTS.md** | Åpen konvensjon for instruksjoner til kodeagenter, lest av flere verktøy, Copilot CLI inkludert. |
| **Prompt file** | En gjenbrukbar prompt lagret som fil (`.prompt.md`) som kan kjøres på nytt. |
| **Plugin / skill** | En pakke med ferdige arbeidsflyter som Copilot CLI kan installere fra en markedsplass. Power Platform Skills er Microsofts markedsplass. |
| **MCP** | Model Context Protocol, en standard for at en agent skal kunne snakke med et verktøy eller en datakilde. Flere Power Platform-plugins bruker det. |
| **Usage metrics** | GitHubs tall for Copilot-bruk per organisasjon: aktiverte seter, aktive brukere, aksepterte forslag. |

## Power Apps Code Apps og Power Platform

| Term | Forklaring |
|---|---|
| **Code App** | En app skrevet i kode (Vite, TypeScript, valgfritt rammeverk) som publiseres til Power Platform og kjører i brukerens nettleser med brukerens rettigheter. |
| **`pa`** | Power Apps CLI for Code Apps, pakken `@microsoft/power-apps-cli`. `pa app init`, `pa app run`, `pa app push`, `pa app add data-source`. |
| **`power.config.json`** | Filen `pa app init` skriver. Peker appen til miljøet og holder tilkoblingene. Inneholder ingen hemmeligheter, men heller ingen ting du redigerer for hånd. |
| **Local Play** | URL-en Vite-pluginen skriver ut når du kjører appen lokalt. Åpner appen i Power Apps-spilleren, koblet til din lokale dev-server. |
| **Environment** | En beholder i Power Platform med apper, data og tilkoblinger, og egne innstillinger. |
| **Personal developer environment** | Et miljø hver maker får til eget bruk, som regel via environment routing. |
| **Managed Environment** | Et miljø med ekstra styringsfunksjoner (delingsgrenser, usage insights, regler). Krever lisens. |
| **Environment group** | En samling miljøer som deler regler. Regelen «Power Apps code apps» settes her for mange miljøer på én gang. |
| **Environment routing** | Regelen som sender nye makere til et eget personlig miljø i stedet for standardmiljøet. |
| **Enable code apps** | Miljøinnstillingen som må være på for at Code Apps skal kjøre der. Standard av. |
| **Connector** | Koblingen mellom en app og en datakilde eller tjeneste: Dataverse, SharePoint, Office 365 Users og over tusen andre. |
| **Connection** | En konkret, autentisert bruk av en connector, eid av en bruker, med en ID. |
| **Connection reference** | En peker til en connection som kan rebindes per miljø. Det er slik en solution flytter mellom Dev, Test og Prod. |
| **Environment variable** | En verdi som varierer per miljø, for eksempel en SharePoint-site-URL. Refereres med `@envvar:` når en datakilde legges til. |
| **Solution** | Pakken som samler apper, tabeller, flyter og referanser for flytting mellom miljøer. |
| **Pipeline** | Power Platforms mekanisme for å flytte en solution fra Dev til Test til Prod med godkjenning. |
| **DLP** | Data loss prevention. Policy som deler connectorer i Business, Non-business og Blocked og hindrer at de blandes. |
| **Power Apps Premium / pay-as-you-go / App Pass** | Lisensformene en sluttbruker trenger for å kjøre en Code App. |
| **Maker** | Den som bygger apper i Power Platform. Krever rollen Environment Maker, System Customizer eller System Administrator i miljøet. |
| **Power Platform admin center (PPAC)** | Admin-senteret for miljøer, regler, DLP og lisenser. |
| **Delegation** | Om en spørring utføres i datakilden eller i appen. SharePoint delegerer bare deler; store lister krever filtrering på serversiden. |

## Copilot Managed Runtime

| Term | Forklaring |
|---|---|
| **Copilot Managed Runtime** | Et eget produkt i offentlig forhåndsvisning, også kalt Managed Apps. Eget repo per app, plattformen bygger, CLI-en heter `ms`. Dekkes ikke av denne veiledningen utover [Produktene, hva er hva](start/produktene.md). |

## Regulering

| Term | Forklaring |
|---|---|
| **EU AI Act** | EU-forordningen om kunstig intelligens, (EU) 2024/1689. Gjelder i Norge gjennom EØS. |
| **Deployer** | Den som bruker et AI-system i yrkesmessig sammenheng. Virksomheten din, når utviklerne bruker Copilot. |
| **Provider** | Den som utvikler og setter et AI-system på markedet. Microsoft og GitHub for Copilot. |
| **EU Data Boundary** | Microsofts forpliktelse om at kundedata for angitte tjenester lagres og behandles innenfor EU/EFTA. Ikke alle tjenester er omfattet. |
| **GDPR** | Personvernforordningen. Gjelder prompter som inneholder persondata like mye som appdata. |
