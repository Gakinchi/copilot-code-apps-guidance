---
title: Verktøykasse
tags: [arkitekt, leder, utvikler]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Verktøykasse

**Hvem denne delen er for:** den som skal lage noe, ikke bare lese. Malene er Markdown-filer i repoets `templates/`-mappe, ment å kopieres inn i virksomhetens eget repo og fylles ut. Sidene her viser dem slik de ser ut, med forklaring. Prompter og instruksjonsfiler ligger i `prompts/`, skript i `scripts/`.

## Maler

| Mal | Brukes av | Når | Kilde-fil |
|---|---|---|---|
| [Styringsplan](maler/styringsplan.md) | Arkitekten | Når sonemodell, DLP, roller og Copilot-policyer skal vedtas som ett dokument | `templates/styringsplan.md` |
| [Sonematrise](maler/sonematrise.md) | Admin og makere | Daglig oppslagsverk for hva som er tillatt i hvilken sone | `templates/sonematrise.md` |
| [Tiltaksliste](maler/tiltaksliste.md) | Prosjektleder og admin | Den sekvenserte arbeidslisten for de første 180 dagene og de løpende rutinene | `templates/tiltaksliste.md` |
| [Modenhetsvurdering](../planlegg/modenhetsvurdering.md) | Arkitekten | Formiddagen før piloten: ni dimensjoner, nivå 0 til 4, bevis per rad | Tabellen på siden |
| [Copilot-policy](maler/copilot-policy.md) | Copilot-admin | Når seter tildeles: hver innstilling med verdi, eier og dato | `templates/copilot-policy.md` |
| [KPI-ark](../maaling/kpi-ark.md) | CoE-lederen og ledelsen | Ukentlig i piloten, månedlig etterpå | Tabellen på siden |
| [Risikoregister](../strategi/risikoregister.md) | Ledelsen | Før piloten, og ved hver hendelse | Tabellen på siden |
| [Pilotevaluering](../maaling/pilot-evaluering.md) | Ledelsen og CoE-lederen | Dag 90: kriterier, grunnlag, beslutningsregel | Tabellen på siden |
| `copilot-instructions.md`, `AGENTS.md`, prompt-filer | Utvikleren | Kommer i milepæl 3 | |

De tre første er oversatt og utvidet fra en governance-metode som er brukt på norske tenanter i 2026. Utvidelsene er radene og punktene som gjelder Code Apps og GitHub Copilot; resten er Microsofts anbefalte modell.

## Skript

[Skript](skript.md) lister PowerShell-skriptene som følger med, hva de gjør og hva de endrer. Les hvert skript før du kjører det.

## Slik bruker du en mal

1. Kopier filen fra `templates/` inn i virksomhetens repo.
2. Erstatt alle `[hakeparenteser]` med virksomhetens navn, grupper og datoer.
3. Slett seksjoner som ikke gjelder; en plan som sier «ikke relevant» ti ganger blir ikke lest.
4. Legg dokumentet under versjonskontroll og noter versjon og dato i dokumenthistorikken nederst.

## Mal for beslutninger

Nye vedtak i [beslutningsloggen](../adr/index.md) følger samme form: status, kontekst, beslutning, alternativer som ble vurdert, konsekvenser. Kopier en eksisterende ADR og nummerer videre.
