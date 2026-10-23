---
title: "ADR 0002: Norsk prosa, engelske produkttermer"
tags: [arkitekt]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# ADR 0002: Norsk prosa, engelske produkttermer

**Status:** vedtatt 2026-10-23

## Kontekst

Målgruppen er norske virksomheter: ledere, arkitekter og utviklere som leser norsk fortere enn engelsk og som skal ta beslutninger på norsk. Produktene, dokumentasjonen, feilmeldingene og admin-senteret er engelske. Oversatte termer finnes ikke på Microsoft Learn og kan ikke søkes etter.

## Beslutning

Prosa på norsk bokmål. Produktnavn, UI-etiketter, kommandoer, pakkenavn, filnavn og juridiske begreper fra forordningene (deployer, provider) på engelsk, slik produsenten eller forordningen skriver dem. Prompter og instruksjonsfiler til Copilot på engelsk. Ordlisten gir den norske forklaringen.

## Konsekvenser

- Setninger blir blandede («slå på **Enable code apps** under **Settings**»). Det er tilsiktet.
- Alle som bidrar må følge [Språkpolicy](../norge/sprakpolicy.md); en PR som oversetter en term, avvises.
- En engelsk utgave kan lages fra samme kilde uten at termene endres, bare prosaen.
