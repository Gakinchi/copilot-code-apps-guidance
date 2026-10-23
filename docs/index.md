---
title: Hjem
tags: [leder, arkitekt, utvikler]
verifisert: 2026-10-23
kilde: EGEN TEST
hide:
  - toc
---

# GitHub Copilot og Power Apps Code Apps: veiledning for innføring

Denne veiledningen beskriver hvordan en norsk virksomhet tar i bruk GitHub Copilot sammen med Power Apps Code Apps, fra beslutningen om å starte til utviklernes daglige arbeid. Den følger samme inndeling som Microsofts [Power Platform guidance](https://learn.microsoft.com/power-platform/guidance/) og GitHubs [Roll out GitHub Copilot at scale](https://docs.github.com/en/copilot/tutorials/roll-out-at-scale), men dekker kombinasjonen av de to produktene, som ingen av dem gjør alene, og tar hensyn til norske forhold: EU AI Act, GDPR og EU-datagrensen, lisensiering og språk.

Alt som står her er enten lest på Microsoft Learn eller GitHub Docs, eller kjørt i en lab før det ble skrevet. Hver side har en dato og en kildemerking. Les [Metode og kildemerking](veiledningen/metode.md) for hva merkene betyr.

## Hvem er du?

<div class="grid cards" markdown>

-   :material-briefcase-outline: **Ledelsen**

    ---

    Du skal beslutte om, når og for hvem. Du trenger forretningscase, risiko, lisensmodell, KPI-er og en plan for de første 180 dagene.

    [Lesesti for ledelsen](start/leder.md)

-   :material-sitemap-outline: **Arkitekten og CoE-lederen**

    ---

    Du skal lede innføringen. Du trenger modenhetsvurdering, roller, styring av miljøer og DLP, Copilot-policyer, utrullingsplan og drift.

    [Lesesti for arkitekten](start/arkitekt.md)

-   :material-code-braces: **Utvikleren**

    ---

    Du skal bygge Code Apps med Copilot i hverdagen. Du trenger oppsett, hurtigstart, den daglige loopen, instruksjonsfiler, review-regler og grenser.

    [Lesesti for utvikleren](start/utvikler.md)

</div>

## De to produktene i én setning hver

- **GitHub Copilot** er en AI-assistent for utviklere. I denne veiledningen betyr det først og fremst Copilot CLI, agenten du kjører i terminalen, og Copilot i Visual Studio Code. Lisensen heter Copilot Business eller Copilot Enterprise.
- **Power Apps Code Apps** er apper du skriver i kode (Vite, TypeScript, et rammeverk du velger) og publiserer til Power Platform, som gir dem identitet, connectorer, DLP, deling og telemetri. Utvikleren bruker CLI-en `pa`.

Copilot Managed Runtime, også kalt Managed Apps, er et tredje og separat produkt. Det forklares på [Produktene, hva er hva](start/produktene.md), og ellers ikke.

## Hvordan veiledningen er bygget

| Del | Svarer på | Speiler |
|---|---|---|
| Strategi | Hvorfor, hva det koster, hva som kan gå galt, hvordan vi måler | Microsoft «Strategy», GitHub «Downstream impact» |
| Planlegg | Hvem gjør hva, hvilken leveransemodell, hvem får lisens, hvordan vi ruller ut | Microsoft «Plan», GitHub «Assigning licenses» |
| Sikkerhet | Hva som forlater maskinen, policyer, hemmeligheter, identitet, DLP | Microsoft «Security», GitHub «Governing at scale» |
| Styring | Miljøer, soner, hvem som får bygge, reaktiv styring | Microsoft «Governance» |
| Drift og ALM | Solutions, pipelines, CI/CD, overvåking, oppdateringstakt | Microsoft «Operations» |
| Arbeidsflyt | Utviklerens hverdag med Copilot og `pa` | GitHub «Enabling developers» |
| Beredskap og opplæring | Læringssti, workshop, AI-kompetanse | Microsoft «Readiness» |
| Fellesskap | Champions, kanal, deling av prompter | Microsoft «Community», GitHub «Drive adoption» |
| Måling | KPI-ark, Copilot-metrikker, Power Platform-metrikker, pilotevaluering | GitHub «Measure impact», «Trial success» |
| Norske forhold | EU AI Act, GDPR, offentlig sektor, språk | Egen del |
| Verktøykasse | Maler, prompter og skript du kan kopiere | Microsoft «Toolkits» |

## Status

Veiledningen bygges i milepæler. Milepæl 1 er skjelettet, produktsidene, utviklerens hurtigstart verifisert ved kjøring, styring av soner og hvem som får bygge, DLP-beviset og EU AI Act-rollen. Sider merket «Kommer» er planlagt, ikke skrevet. [Beslutningsloggen](adr/index.md) forteller hvorfor ting er som de er.
