---
title: Oppdateringstakt
tags: [arkitekt, utvikler]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Oppdateringstakt: å følge et produkt som endrer seg ukentlig

**Hvem denne siden er for:** den ene personen i CoE som får ansvaret for å følge produktendringer, og arkitekten som skal bestemme hva som skal låses. Både Code Apps og Copilot endrer seg oftere enn interne guider kan oppdateres. Det er ikke et problem hvis endringene fanges ett sted og guidene er daterte.

## Hva som endrer seg, og hvor fort

| Komponent | Takt (erfart 2026) | Konsekvens når det glipper |
|---|---|---|
| `@microsoft/power-apps-cli` (`pa`) | Flere ganger i måneden | Kommandoer og flagg i interne guider blir feil; pipeline som ikke pinner versjon kan endre oppførsel |
| `@microsoft/power-apps` (SDK) og `@microsoft/power-apps-vite` | Månedlig | Brudd ved `npm update` uten å lese changelog |
| Power Platform Skills-pluginen (`code-apps-preview`) | Ukentlig i perioder | Skill-navn og oppførsel endres; `create-app` kan gi en annen mal enn forrige uke |
| GitHub Copilot CLI | Ukentlig | Nye flagg, endrede standardvalg for godkjenning, nye policyer å sette |
| Admin center (Inventory, Usage, environment group-regler) | Løpende | Skjermbilder i guider stemmer ikke; ny regel finnes uten at noen har vurdert den |
| Lisens- og prisvilkår | Noen ganger i året | Business case og KPI K4 må regnes om |

## Rutinen

**Én eier.** Navngitt i [styringsplanen](../verktoykasse/maler/styringsplan.md). Én time i uken.

**Kildene, i rekkefølge:**

1. Release notes for `pa`-CLI-en og SDK-en på npm, og Learn-siden What's new in Power Apps. Code Apps har ingen egen what's new-side per 2026-10-23; CLI-referansen på Learn er den beste indikatoren på hva som er nytt.
2. Changelog for Copilot CLI, og GitHub Changelog filtrert på Copilot.
3. Microsofts månedlige Code Apps-oppdatering (Office Hours eller release plan).
4. Power Platform release planer for bølgen, for environment group-regler og admin center.

**Det som skrives ned:** ett daterte notat per uke i virksomhetens repo (`docs/changelog/ÅÅÅÅ-UU.md`), med tre felt: hva endret seg, hva det betyr for oss, hva som må oppdateres. Ingen endring er også et notat.

**Det som gjøres:**

- Instruksjonsfil-malen oppdateres når CLI- eller plugin-versjonen låst i den, endres. Versjonen står i filen.
- Hurtigstarten kjøres på nytt ved hovedversjon av CLI-en eller pluginen, med nye skjermbilder. Det er den eneste måten å vite at guiden stemmer.
- Pipelinens pinnede versjoner oppdateres i en egen pull request, etter at labkjøringen er grønn.
- Nye admin center-regler og Copilot-policyer vurderes og føres i [Copilot-policy-malen](../verktoykasse/maler/copilot-policy.md) eller sonematrisen, med dato.

## Hva som låses, og hva som flyter

| Lås | Hvorfor |
|---|---|
| CLI-versjon i pipelinen | Reproduserbare bygg |
| Plugin-versjon i instruksjonsfilen | Alle i teamet får samme skill-oppførsel |
| Node LTS-versjon i repoet (`.nvmrc` eller `engines`) | Samme bygg lokalt og i CI |

| Flyt | Hvorfor |
|---|---|
| Copilot CLI på utviklermaskinene | Sikkerhetsrettelser og policystøtte kommer raskt; la den oppdatere seg |
| Modellvalg innenfor policyen | Utviklerne lærer hva som virker for hvilke oppgaver |

## Preview-funksjoner

Alt som er merket preview, inkludert pluginen `code-apps-preview`, kan endre seg uten varsel. Regelen i [risikoregisteret](../strategi/risikoregister.md) R5: preview brukes i sone 1 og 2, ikke i sone 3, og aldri i et løfte til en kunde. Kildemerkingen i denne veiledningen (SETT I PREVIEW) finnes for å gjøre det synlig.

## Denne veiledningen

Hver side har `verifisert:`-dato. Sider eldre enn 90 dager listes av `tools/stale-check.py` og re-verifiseres eller merkes. Hurtigstarten kjøres på nytt ved hovedversjoner. [Metode](../veiledningen/metode.md) beskriver resten.

## Neste steg

[Hurtigstart](../arbeidsflyt/hurtigstart.md) er siden som oftest må kjøres på nytt. [Feilsøking](../arbeidsflyt/feilsoking.md) samler kjente avvik per versjon.

## Kilder

- Microsoft Learn, What's new in Power Apps: https://learn.microsoft.com/power-apps/whats-new (lest 2026-10-23)
- Microsoft Learn, Power Apps CLI command reference: https://learn.microsoft.com/power-apps/developer/code-apps/reference/cli (lest 2026-10-23)
- npm, @microsoft/power-apps-cli: https://www.npmjs.com/package/@microsoft/power-apps-cli (lest 2026-10-23)
- GitHub Changelog, Copilot: https://github.blog/changelog/label/copilot/ (lest 2026-10-23)
- Taktene i tabellen er erfart gjennom labkjøringer og workshops i 2026, ikke dokumentert av leverandørene.
