---
title: "ADR 0004: Hver side bærer verifisert-dato og kildemerke"
tags: [arkitekt]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# ADR 0004: Hver side bærer verifisert-dato og kildemerke

**Status:** vedtatt 2026-10-23

## Kontekst

Code Apps-CLI-en skiftet navn og pakke to ganger på et halvt år; i oktober 2026 fantes sju publiserte guider med kommandoer som ikke lenger virket. Lesere kan ikke se på en side om den ble sjekket i går eller i fjor, og forfatteren kan ikke huske det.

## Beslutning

Front matter på hver side har `verifisert: YYYY-MM-DD` og `kilde:` med ett av merkene PÅ LEARN, GITHUB DOCS, EGEN TEST, SETT I PREVIEW, PRODUKTTEAM, UTKAST. Avvik fra hovedmerket markeres inne i siden med bokser. Kommandoer publiseres først etter en kjøring i lab med versjonsnummer på siden. `tools/stale-check.py` lister sider eldre enn 90 dager og kjøres før hver utgivelse. Et merke løftes aldri fra fellesskap eller preview til dokumentert uten lenke.

## Konsekvenser

- Vedlikehold er en synlig plikt: listen fra stale-check er arbeidslisten.
- En side kan være korrekt og likevel «gammel»; da er jobben å sjekke på nytt og oppdatere datoen, ikke å skrive om.
- Bidragsytere må oppgi kilde med dato for faktaendringer.
