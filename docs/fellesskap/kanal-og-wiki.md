---
title: Kanal og wiki
tags: [arkitekt]
verifisert: 2026-10-23
kilde: GITHUB DOCS
---

# Kanal og wiki

**Hvem denne siden er for:** CoE-lederen som setter dem opp på lanseringsdagen, og alle som skal bruke dem. Kanalen er stedet å spørre. Wikien er stedet svarene bor. Begge åpnes samme dag som piloten får seter, og begge har en eier.

## Kanalen

Én kanal i Teams (eller det virksomheten bruker), åpen for alle med sete, pluss admin og CoE. Navn som sier hva den er: «Copilot og Code Apps».

| Regel | Hvorfor |
|---|---|
| Svar samme arbeidsdag; champion-ene har vakt | Et spørsmål uten svar i to dager er en utvikler som gikk tilbake til gamle vaner |
| Spørsmål skrives med versjoner og hva som er prøvd | [Feilsøking](../arbeidsflyt/feilsoking.md) har formen |
| Svar som gjelder flere, flyttes til wikien innen uken | Kanalen er flyktig; wikien varer |
| Ingen hemmeligheter, ingen miljø-ID-er i klartekst, ingen kundedata i skjermbilder | Kanalen leses av mange |
| Admin leser den daglig i piloten | DLP-feil og «code apps not enabled» skal ses av den som kan rette det |

Tråder for: spørsmål, «dette virket» (prompter og mønstre), og «endring i plattformen» (fra [Oppdateringstakt](../drift/oppdateringstakt.md)). Tre tråder, ikke ti.

## Wikien

Wikien er virksomhetens egen utgave av denne veiledningen: det som er spesifikt for dere. Den ligger der teamene allerede leser, og lenker hit for det generelle.

Minimum ved lansering:

| Side | Innhold |
|---|---|
| Start her | Lesestien per rolle, med lenker hit |
| Vårt oppsett | Miljønavn per sone, environment groups, hvem som er admin, hvem som er champion, kanalen |
| Våre regler | Sonematrisen og Copilot-policyen slik de er satt, med dato |
| Våre datakilder | Hvilke connectorer som er godkjent hvor, og hvem som eier dem |
| Feilsøking hos oss | Det som ikke står i [Feilsøking](../arbeidsflyt/feilsoking.md), med dato |
| Biblioteket | [Prompt- og skill-bibliotek](prompt-og-skill-bibliotek.md) |
| Endringslogg | Ukenotatet fra [Oppdateringstakt](../drift/oppdateringstakt.md) |

Hver side har en eier og en dato. Sider uten dato siste 90 dager er ikke til å stole på, og sier det selv.

## Hvis wikien er et repo

For utviklerteam fungerer et repo med Markdown bedre enn en wiki-side, fordi det kan reviewes og fordi agentene kan lese det. Selskapsutgaven av denne veiledningen er lagd for det: et privat repo som tar rammeverket inn som submodul og legger virksomhetens sider oppå. [Metode](../veiledningen/metode.md).

## Målingen

K10 i [KPI-arket](../maaling/kpi-ark.md) er antall oppsettspørsmål i kanalen per uke. Det skal synke. Synker det ikke, mangler noe i wikien eller i [Forutsetninger](../beredskap/forutsetninger.md).

## Neste steg

[Prompt- og skill-bibliotek](prompt-og-skill-bibliotek.md) for den delen av wikien som vokser raskest. [Champions](champions.md) for hvem som har vakt.

## Kilder

- GitHub Docs, Roll out GitHub Copilot at scale (launch with channel and wiki): https://docs.github.com/en/copilot/tutorials/roll-out-at-scale (lest 2026-10-23)
- Microsoft Learn, Power Platform adoption, Nurture (community): https://learn.microsoft.com/power-platform/guidance/adoption/nurture-best-practices (lest 2026-10-23)
