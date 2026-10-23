---
title: "ADR 0003: Code Apps og Copilot Managed Runtime er to produkter"
tags: [arkitekt]
verifisert: 2026-10-23
kilde: PRODUKTTEAM
---

# ADR 0003: Code Apps og Copilot Managed Runtime behandles som to produkter

**Status:** vedtatt 2026-10-23

## Kontekst

Copilot Managed Runtime, kalt Managed Apps i privat forhåndsvisning, gikk i offentlig forhåndsvisning 25. september 2026 og ligner Code Apps: Vite, connectorer, Power Platform-styring. Mange omtaler det som «Code Apps 2.0». Microsofts produktteam bekreftet 30. september 2026 at de er to produkter: Code Apps beholdes med egen backlog og egne Office Hours, får ikke den innebygde databasen eller mellomlaget, og SDK-ene slås ikke sammen.

## Beslutning

Veiledningen handler om Power Apps Code Apps og GitHub Copilot. Copilot Managed Runtime omtales på [Produktene, hva er hva](../start/produktene.md) og i rader som er eksplisitt merket. Ingen side bygger en fortelling rundt navnebyttet, og ingen side kaller det en ny versjon av Code Apps. Hver påstand navngir apptype og aktør.

## Konsekvenser

- Styringssider som gjelder Managed Runtime (tenant-bryteren i Microsoft 365 admin center, CLI-regelen for `ms app create`) står ikke i denne veiledningen; de lenkes fra produktsiden til forfatterens egne innlegg om det produktet.
- Hvis Microsoft senere slår produktene sammen, erstattes dette vedtaket av et nytt. Fram til da er regelen absolutt.
