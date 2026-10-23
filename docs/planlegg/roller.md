---
title: Roller og ansvar
tags: [arkitekt, leder]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Roller og ansvar

**Hvem denne siden er for:** arkitekten som skal fylle ut rolletabellen i [styringsplanen](../verktoykasse/maler/styringsplan.md), og ledelsen som skal vite hvem de spør om hva. Innføringen krysser to administrative verdener, GitHub og Power Platform, og den vanligste feilen er at ingen eier skjøten mellom dem.

## Rollene

| Rolle | Finnes ofte som | Eier |
|---|---|---|
| **Plattformeier** | IT-leder eller leder for applikasjonsplattform | Beslutningen, budsjettet, styringsplanen |
| **Power Platform-admin** | Eksisterende admin, minst to navngitte | Miljøer, environment groups og regler, DLP, routing, Code Apps-bryteren, inventar |
| **Copilot-admin** | Eier av GitHub-organisasjonen, minst to navngitte | Seter, Copilot-policyer, content exclusions, plugin-tillatelser, usage metrics, audit log |
| **CoE-leder** | Arkitekt eller teknisk leder | Modenhetsvurdering, styringsplan, maler, måling, kobling mellom de to adminene |
| **Adopsjonsleder** | Ofte samme person som CoE-leder i små virksomheter | Champions, kunngjøring, workshop, kanal, opplæring |
| **Champion** | En utvikler per team som er entusiastisk og vil hjelpe | Først ut, svarer på spørsmål i kanalen, deler prompter, gir tilbakemelding til CoE |
| **Teamleder / soneeier** | Utviklingsleder | Review-regler i teamet, repo-konvensjoner, hvem som pusher til hvilket miljø |
| **Utvikler** | | Bygger, reviewer, følger instruksjonsfilene og grensene |
| **Sikkerhet** | CISO eller sikkerhetsarkitekt | Conditional Access, identitet, hendelser, godkjenning av DLP-klassifisering |
| **Etterlevelse** | Compliance-ansvarlig | EU AI Act-rollen, klassifisering av apper, revisjonssvar |
| **Personvernombud** | DPO | Dataflyt til modellen, databehandleravtaler, spørsmål til Microsoft og GitHub |
| **Lisensansvarlig** | Innkjøp eller IT-økonomi | Copilot-seter, Power Apps-lisenser, Managed Environments, forbruk |

## RACI for de viktigste oppgavene

A = ansvarlig for at det skjer, U = utfører, K = konsulteres, I = informeres.

| Oppgave | Plattformeier | PP-admin | Copilot-admin | CoE | Adopsjon | Teamleder | Sikkerhet | Etterlevelse | DPO | Lisens |
|---|---|---|---|---|---|---|---|---|---|---|
| Vedta styringsplanen | A | K | K | U | K | K | K | K | K | K |
| Velge Copilot-plan og tildele seter | A | | U | K | I | K | | | | U |
| Sette Copilot-policyer og content exclusions | I | | U | K | | K | A | K | K | |
| Slå på Code Apps for piloten | I | U | | A | I | I | | | | |
| DLP-grunnlinje med forhåndsvisning | I | U | | K | | I | A | K | | |
| Vurdere dataflyt til modellen | I | | K | K | | | K | K | A/U | |
| EU AI Act-rolle og klassifiseringsrutine | I | | | K | | K | | A/U | K | |
| Rekruttere champions og holde workshop | I | | | K | A/U | K | | | | |
| Instruksjonsfiler og prompt-bibliotek | | | K | A | K | U | | | | |
| Review-regler og branch-beskyttelse | | | U | K | | A | K | | | |
| Pipeline og service principal for sone 3 | I | U | K | A | | K | K | | | |
| KPI-ark og pilotevaluering | A | K | K | U | K | K | | | | K |
| Lisenssamsvar og forbruk | I | K | K | | | | | | | A/U |

## Skjøten mellom GitHub og Power Platform

Tre ting faller mellom to stoler hvis ingen eier dem eksplisitt. Gi dem til CoE-lederen:

1. **Instruksjonsfilene.** De bor i GitHub, men innholdet er Power Platform-regler: hvilke connectorer, hvilken CLI, connection references. Copilot-admin eier ikke innholdet, Power Platform-admin eier ikke filene.
2. **Målingen.** Copilot-tallene kommer fra GitHub, app-tallene fra Power Platform admin center, og tiden fra oppgave til app fra teamet. Ett KPI-ark, én eier.
3. **Feilsøkingen.** «Det virker ikke» kan være et sete som ikke er aktivert, et miljø der Code Apps er av, en DLP-regel eller en plugin som mangler. Kanalen trenger én person som kan alle fire.

## I små virksomheter

Én person kan ha flere roller, men ikke alle. Minimum er at Power Platform-admin og Copilot-admin er to forskjellige personer med reserve, at noen utenfor utviklerteamet er etterlevelse, og at personvernombudet er involvert før piloten, ikke etter.

## Neste steg

[Pilotgruppe](pilotgruppe.md): menneskene og miljøene som starter. [Utrullingsplan](utrullingsplan.md): når hver rolle gjør hva.

## Kilder

- Microsoft Learn, Define roles and responsibilities: https://learn.microsoft.com/power-platform/guidance/adoption/roles (lest 2026-10-23)
- GitHub Docs, Driving Copilot adoption in your company (champions, intern kontaktperson): https://docs.github.com/en/copilot/tutorials/roll-out-at-scale/enable-developers/drive-adoption (lest 2026-10-23)
- Rolletabellen bygger på §8 i en governance-plan gjennomført for en norsk virksomhet i 2026, utvidet med Copilot-admin, champion og personvernombud.
