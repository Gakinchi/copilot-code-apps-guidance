---
title: Feilsøking
tags: [utvikler]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Feilsøking: kjente feil og omveier

**Hvem denne siden er for:** utvikleren som sitter fast, og CoE-lederen som ser samme spørsmål for tredje gang i kanalen. Listen er sortert etter hvor i løpet feilen oppstår. Alt er observert i labkjøringer eller workshoper med versjonene i [Arbeidsflyt](index.md); datoen i front-matter sier når listen sist ble gått gjennom.

## Oppsett og innlogging

| Symptom | Årsak | Omvei |
|---|---|---|
| `pa` finnes ikke | CLI-en er ikke installert globalt, eller terminalen er eldre enn installasjonen | `npm install --global @microsoft/power-apps-cli`, ny terminal |
| Agenten foreslår `npx power-apps` eller `pac code` | Modellen husker eldre dokumentasjon | Si at CLI-en er `pa`, og legg linjen i [instruksjonsfilen](instructions-og-agents.md) |
| `pa auth login` åpner feil konto | Flere kontoer i nettleseren | `pa auth status`, `pa auth switch`, eller `pa auth login --account <epost>` |
| Copilot CLI: pluginen vises ikke etter install | Økten var åpen under installasjonen | Avslutt og start `copilot` på nytt; `copilot plugin list` utenfor økten |
| Copilot CLI: «not available for your organization» | Policyen Copilot in the CLI er av | Copilot-admin; se [Copilot-policyer](../sikkerhet/copilot-policyer.md) |

## Init og datakilder

| Symptom | Årsak | Omvei |
|---|---|---|
| Miljøet vises ikke i listen ved `pa app init` | Du mangler maker-rolle, eller miljøet er i en annen tenant | `pa auth status`; be om Environment Maker; se [Identitet og tilgang](../sikkerhet/identitet-tilgang.md) |
| Code apps not enabled | Bryteren er av i miljøet eller gruppen | Admin; se [Hvem får bygge](../styring/hvem-faar-bygge.md) |
| Connectoren mangler i `pa connection list` | Ingen connection finnes, eller DLP blokkerer | `pa connection create`, eller sjekk DLP; se [DLP og Code Apps](../sikkerhet/dlp-og-code-apps.md) |
| `generated/` oppdateres ikke etter endring i tabellen | Typene er et øyeblikksbilde | `pa app refresh data-source --name <navn>` |

## Lokal kjøring

| Symptom | Årsak | Omvei |
|---|---|---|
| Tom side i Local Play | Nettleseren blokkerer public → local (Local Network Access) | Godta spørsmålet; i Chrome og Edge siden desember 2025 |
| Appen henger på innlasting | `await getContext()` før render | Hent kontekst etter første render; se [Review-regler](review-regler.md) |
| Virker lokalt, 404 på undersider etter push | `BrowserRouter` | Hash-ruting |
| Feil port | `pa app run` forventer Vite på porten i `power.config.json` | Juster `localAppUrl`, eller `PA_CLI_LOCAL_APP_URL` for én kjøring |
| Angular: bygg feiler i Code App-oppsettet | Angular er unntaket blant Vite-rammeverkene | Se [Rammeverk](rammeverk.md) |

## Push og publisering

| Symptom | Årsak | Omvei |
|---|---|---|
| Push feiler på solution-ID | Ikke en GUID, eller feil miljø | GUID fra URL-en i maker-portalen; se [ALM](../drift/alm-for-code-apps.md) |
| Push i pipeline: tilgang nektet | Appen er ikke delt med service principalen med `edit`, eller feil object ID | Del fra makerens maskin med Enterprise Application object ID; se [CI/CD](../drift/ci-cd.md) |
| Brukere ser samtykkevindu de ikke forstår | Normalt: connectorene listes første gang | Si det i delingsmeldingen |
| Bruker får feil ved oppstart etter deling | Mangler Premium, App Pass eller pay-as-you-go | [Lisensmodell](../strategi/lisensmodell.md) |
| Appen er borte fra Apps-listen | Feil miljø valgt i maker-portalen, eller appen er i en solution-visning | Velg miljøet i `power.config.json`; sjekk Inventory i admin center |

## Data

| Symptom | Årsak | Omvei |
|---|---|---|
| Listen stopper på 500 eller 2000 rader | Ikke-delegerbar spørring mot SharePoint | Filtrer i spørringen; ID-felt støtter bare `=`; se [Datakilder](datakilder.md) |
| Oppslagsfelt viser ID i stedet for navn | Choices ikke brukt | `Choices()`-mønsteret fra connectoren |
| Endringer vises ikke | Caching i connectoren eller i appen | Live Monitor i maker-portalen for å se kallene |

## Copilot-spesifikt

| Symptom | Årsak | Omvei |
|---|---|---|
| `copilot -p "/code-apps-preview:create-app …"` (ikke-interaktivt) skriver rå verktøykall og `rg`-feil til terminalen og lager ingenting | Sett 2026-10-24 med Copilot CLI 1.0.61: skillen er lagd for den interaktive økten | Kjør `copilot` interaktivt og skriv `/code-apps-preview:create-app` der |
| Agenten gjør mer enn du ba om | Oppgaven var for vid, eller `--allow-all` | Plan først; godkjenning per handling; se [Daglig loop](daglig-loop.md) |
| Agenten kjører i ring på samme feil | Den mangler kontekst den ikke kan få (for eksempel at connectoren er blokkert) | Stopp, sjekk plattformen selv, gi agenten svaret |
| Forslag bruker en pakke dere ikke har godkjent | Ingen regel i instruksjonsfilen | Legg til «Do not add npm packages without asking» |
| Content exclusions virker ikke i CLI | De gjelder ikke Copilot CLI | Hold filene ute av repoet; se [Copilot-policyer](../sikkerhet/copilot-policyer.md) |

## Når listen ikke hjelper

Skriv symptomet i teamets kanal med versjonene fra `pa --version` og `copilot --version`, og hva som allerede er prøvd. Løsningen legges inn her, med dato. [Kanal og wiki](../fellesskap/kanal-og-wiki.md).

## Neste steg

[Oppdateringstakt](../drift/oppdateringstakt.md) for hvorfor listen må dateres. [Kanal og wiki](../fellesskap/kanal-og-wiki.md) for hvor nye feil samles.

## Kilder

- Microsoft Learn, Power Apps CLI command reference: https://learn.microsoft.com/power-apps/developer/code-apps/reference/cli (lest 2026-10-23)
- Microsoft Learn, Power Apps CLI environment variables: https://learn.microsoft.com/power-apps/developer/code-apps/reference/environment-variables (lest 2026-10-23)
- Feilene er observert i labkjøringer med sju Vite-rammeverk og i workshoper i 2026; de som ikke er bekreftet på nytt innen 90 dager, fjernes.
