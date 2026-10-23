---
title: Beslutninger
tags: [arkitekt]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Beslutninger: hvorfor veiledningen anbefaler det den gjør

**Hvem denne siden er for:** arkitekten som skal forsvare et valg internt, og den som vil være uenig med veiledningen på et informert grunnlag. Veiledningens egne vedtak ligger i [beslutningsloggen](../adr/index.md). Denne siden samler de faglige anbefalingene som ikke er vedtak om siten, men om hvordan en virksomhet bør styre Copilot og Code Apps, med begrunnelsen i én setning hver, og hvor du leser mer.

## Anbefalingene

| Anbefaling | Begrunnelse | Les mer |
|---|---|---|
| Code Apps av i default-miljøet, styrt via gruppe-regel | Default er det ene miljøet alle har tilgang til; en Code App der kan ikke avgrenses | [Hvem får bygge](hvem-faar-bygge.md) |
| Tre soner, også i små virksomheter | Skillet mellom «mitt», «vårt» og «virksomhetens» er det som avgjør hvor mye styring en app trenger | [Soner](soner.md) |
| Utviklere pusher aldri direkte til sone 3 | `pa app push` fra en laptop omgår review, pipeline og godkjenning | [ALM for Code Apps](../drift/alm-for-code-apps.md) |
| Forhåndsvis DLP før publisering, alltid | Innstramming suspenderer flyter uten advarsel | [DLP og Code Apps](../sikkerhet/dlp-og-code-apps.md) |
| Copilot-policyer settes før første sete tildeles | Policyer som settes etterpå endrer utvikleres arbeidsdag midt i piloten | [Copilot-policyer](../sikkerhet/copilot-policyer.md) |
| Content exclusions er ikke en sikkerhetskontroll for CLI | De gjelder ikke Copilot CLI, og utvikleren kan uansett lime inn hva som helst | [Dataflyt til modellen](../sikkerhet/dataflyt-til-modellen.md) |
| AI-skrevet kode reviewes som annen kode | Modellen har ikke ansvar; den som merger har | [Review-regler](../arbeidsflyt/review-regler.md) |
| Instruksjonsfil i hvert Code App-repo | Reglene om hash-ruting, `getContext()` og connector-grensen må gjentas til hver økt | [Instruksjoner og agenter](../arbeidsflyt/instructions-og-agents.md) |
| Baseline før pilot, ellers ingen pilot | Uten baseline kan evalueringen ikke skille effekt fra støy | [KPI-er](../strategi/kpier.md) |
| EU AI Act-rollen avklares før første sete | Virksomheten er deployer fra første bruk, og opplæringsplikten gjelder fra da | [EU AI Act-rolle](../norge/eu-ai-act-rolle.md) |
| Copilot CLI som primærsti, Claude Code som alternativ | Samme plugin og samme kommandoer; lisensen avgjør, ikke verktøyet | [Produktene](../start/produktene.md) |
| Copilot Managed Runtime behandles som eget produkt | Egen CLI, egen hosting, egen styring; sammenblanding gir feil beslutninger | [ADR 0003](../adr/0003-produktnavn.md) |

## Når du er uenig

Skriv en ADR i virksomhetens egen utgave: kontekst, beslutning, konsekvenser, og lenken til raden over du avviker fra. Da er avviket dokumentert, og neste arkitekt vet hvorfor. Malen ligger i [Verktøykassen](../verktoykasse/index.md).

## Neste steg

[Beslutningslogg](../adr/index.md) for veiledningens egne vedtak. [Styring](index.md) for oversikten.
