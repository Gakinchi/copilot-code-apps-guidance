---
title: "ADR 0001: MkDocs Material som verktøy for siten"
tags: [arkitekt]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# ADR 0001: MkDocs Material som verktøy for siten

**Status:** vedtatt 2026-10-23

## Kontekst

Veiledningen skal ligne Microsoft Learn i lesbarhet: venstrenavigasjon med seksjoner, søk, bokser for forbehold, tabeller, diagrammer, og en adresse som kan lenkes til fra blogg og workshops. Innholdet er ren Markdown, skrevet og vedlikeholdt av én person med Python-verktøy fra før. En engelsk utgave kan komme senere.

## Beslutning

MkDocs Material, med `mkdocs-static-i18n` (norsk som standard, engelsk forberedt), `tags` for lesersporene, Mermaid via `pymdownx.superfences`, `glightbox` for skjermbilder, og `mkdocs build --strict` i CI med deploy til GitHub Pages.

## Alternativer som ble vurdert

- **Docusaurus:** gir det samme, men krever en React/MDX-byggkjede og en i18n-mappestruktur selv for ett språk. Ingen funksjon vi trenger som MkDocs mangler.
- **En seksjon på recursion.no (WordPress):** enklere å publisere, men uten navigasjonstre, versjonskontroll per side og mulighet for pull requests. Bloggen speiler utvalgte kapitler i stedet.

## Konsekvenser

- Alt innhold er Markdown i et git-repo; endringer er diff-bare og kan reviewes.
- Strict build gjør at en manglende side eller en død intern lenke stopper deployen.
- Mappenavn i `docs/` kan ikke kollidere med ISO-språkkoder når i18n er på; `om/` måtte hete `veiledningen/` (oromo har koden `om`).
