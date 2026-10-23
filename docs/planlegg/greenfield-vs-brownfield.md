---
title: Greenfield eller brownfield
tags: [arkitekt]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Greenfield eller brownfield: to inngangsveier

**Hvem denne siden er for:** arkitekten som har gjort [modenhetsvurderingen](modenhetsvurdering.md) og skal velge løp. Regelen er enkel: har virksomheten aktive apper eller flyter i Power Platform i dag, er det brownfield, og alt starter med inventar. Å hoppe over inventaret er den vanligste årsaken til dårlige styringsbeslutninger.

## Greenfield: ingen aktiv bruk

Ingen apper, eller bare et sovende standardmiljø. Da kan styringen designes før første app, og Copilot og Code Apps kan settes opp riktig fra dag én.

Løpet i fem steg:

1. **Discovery.** Organisasjonens form, ambisjon, begrensninger og appetitt. Lisensposisjonen er en del av dette, både Microsoft 365 og GitHub. Regulatorisk screening: EU AI Act gjelder fra første Copilot-sete.
2. **Strategi.** Tre soner, uansett størrelse. Små virksomheter kan la sone 2 og 3 dele environment group med strengere regler på sone 3-miljøene. Bestem standardmiljøets posisjon (Microsoft 365-connectorer, Code Apps av) og om environment routing skal på.
3. **Design.** Environment groups, regler, DLP-klassifisering, Copilot-policyer, ALM-krav per sone, instruksjonsfil-mal.
4. **Artefakter.** Styringsplan, sonematrise, tiltaksliste, Copilot-policy, KPI-ark, fra [verktøykassen](../verktoykasse/index.md).
5. **Utrullingsplan.** [Plan 30-90-180](../strategi/30-90-180.md) med [utrullingsplanen](utrullingsplan.md) for piloten.

Fordelen med greenfield for Code Apps: piloten kan starte i en environment group som er riktig fra starten, og ingen må flytte eksisterende apper.

## Brownfield: aktiv bruk finnes

Apper og flyter er i bruk, noen med forretningskritisk betydning, trolig uten solutions og med DLP som enten mangler eller er for permissiv. Utviklere bruker kanskje allerede Copilot uten rammer, og noen har kanskje publisert Code Apps til standardmiljøet.

Løpet i tre faser, i streng rekkefølge:

1. **Inventar.** Hva finnes, hvem eier det, hvor kjører det. Miljøer per type, Managed eller ikke, regioner, aktive mot sovende. Admin-roller. DLP-policyer og omfang. Solutions, prefikser, pipelines. Og nytt for dette løpet: Code Apps i inventaret (maker-portalen viser dem med typen Code), repoer med Copilot-bruk (usage metrics viser hvem), og hvilke policyer som faktisk er satt i GitHub-organisasjonen.
2. **Risikoer.** Gapet mellom dagens tilstand og sonemodellen, prioritert. Code Apps i standardmiljøet, apper uten eier, connectorer som bryter med den klassifiseringen dere vil ha, utviklere med Copilot uten content exclusions eller review.
3. **Plan.** Utbedring med eksplisitte omveier der den ideelle rettelsen er blokkert av lisens eller kapasitet. Omveiene dokumenteres i [styringsplanen](../verktoykasse/maler/styringsplan.md) §6 med dato for revurdering.

!!! warning "Forhåndsvis før du strammer DLP"
    I brownfield er den første DLP-innstrammingen det farligste steget: den suspenderer flyter som bryter den, uten advarsel. Forhåndsvis effekten per miljø, og få eiernes aksept før publisering. Se [DLP og Code Apps](../sikkerhet/dlp-og-code-apps.md).

## Det som er likt

Begge løpene ender i samme sett av artefakter og samme pilot. Forskjellen er hva som må ryddes først. I brownfield bør piloten ikke starte før inventaret er tatt og Code Apps-bryteren er bekreftet av i standardgruppen; ellers er piloten ikke avgrenset.

## Neste steg

Greenfield: [Roller og ansvar](roller.md), så [Soner](../styring/soner.md). Brownfield: [Reaktiv styring](../styring/reaktiv-styring.md) for inventarmetoden, så [Soner](../styring/soner.md).

## Kilder

- Microsoft Learn, Establish an environment strategy: https://learn.microsoft.com/power-platform/guidance/adoption/environment-strategy (lest 2026-10-23)
- Microsoft Learn, Management at scale: https://learn.microsoft.com/power-platform/guidance/adoption/govern-at-scale (lest 2026-10-23)
- Løpene bygger på greenfield- og brownfield-flyten i en governance-metode brukt på norske tenanter i 2026.
