---
title: "ADR 0005: Lesersporene er tags, ikke mappestruktur"
tags: [arkitekt]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# ADR 0005: Lesersporene er tags, ikke mappestruktur

**Status:** vedtatt 2026-10-23

## Kontekst

Tre lesere, ledelsen, arkitekten og utvikleren, skal ha hver sin vei gjennom stoffet. Mange sider angår to av dem: lisensmodellen leses av leder og arkitekt, DLP av arkitekt og utvikler. En mappe per leser ville dublert sider eller tvunget hver side til å velge én leser.

## Beslutning

Mappene følger Microsofts faser (strategi, planlegg, sikkerhet, styring, drift, arbeidsflyt, beredskap, fellesskap, måling) pluss norske forhold og verktøykasse. Lesersporene er tags i front matter (`leder`, `arkitekt`, `utvikler`), rendret av tags-pluginen, og de tre sidene under *Start her* er kuraterte lesestier i rekkefølge med én setning om utbyttet per side.

## Konsekvenser

- En side kan tilhøre flere spor uten å finnes to ganger.
- Lesestiene må vedlikeholdes for hånd når sider kommer til; tag-indeksen fanger opp resten.
- Navigasjonen ligner Microsoft Learn, som er det lesere som allerede bruker Learn forventer.
