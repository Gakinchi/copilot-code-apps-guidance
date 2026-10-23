# Copilot-policy for GitHub: [Organisasjon]

> **Bruk av malen:** Én rad per innstilling som angår bruken av GitHub Copilot i virksomheten. Erstatt `[hakeparenteser]`. Verdien er det som faktisk er satt i GitHub, ikke det som er ønsket; ønsket verdi hører hjemme i tiltakslisten. Hver rad har én eier og en dato for siste vurdering. Gjennomgås kvartalsvis, og ved hver ny Copilot-funksjon GitHub lanserer.

**Dokumenteier:** [Navn / rolle, normalt Copilot-administrator]
**Versjon:** 1.0
**Dato:** [ÅÅÅÅ-MM-DD]
**Hører til:** Styringsplan v[N], §3.6
**Nivå policyene er satt på:** [Enterprise `[navn]` / Organisasjon `[navn]`]
**Plan:** [Copilot Business / Copilot Enterprise]

---

## 1. Tilgang og seter

| Innstilling | Verdi | Eier | Sist vurdert | Merknad |
|---|---|---|---|---|
| Setetildeling | [Team `[navn]` / Utvalgte brukere / Alle] | [Navn] | [Dato] | Piloten: ett team som speiler pilotgruppen |
| Seter uten aktivitet trekkes etter | [N dager / aldri] | [Navn] | [Dato] | Spør utvikleren før setet trekkes |
| Copilot in the CLI | [På / Av] | [Navn] | [Dato] | Må være på for primærstien i veiledningen |
| Copilot coding agent (cloud) | [På / Av] | [Navn] | [Dato] | Av i piloten |
| Copilot code review | [På / Av] | [Navn] | [Dato] | |

## 2. Modeller og data

| Innstilling | Verdi | Eier | Sist vurdert | Merknad |
|---|---|---|---|---|
| Tillatte modeller | [Liste / standard] | [Navn] | [Dato] | Kun generelt tilgjengelige i piloten |
| Preview-modeller | [På / Av] | [Navn] | [Dato] | |
| EU data residency | [På / Av / Ikke tilgjengelig på planen] | [Navn] | [Dato] | Avtalesjekk gjort [dato] |
| Suggestions matching public code | [Blokkert / Tillatt med referanse] | [Navn] | [Dato] | Beslutning fra juridisk [dato] |
| Premium request-grense per bruker | [Standard / Egen grense] | [Navn] | [Dato] | Se KPI K4 |

## 3. Kontekst og utvidelser

| Innstilling | Verdi | Eier | Sist vurdert | Merknad |
|---|---|---|---|---|
| Content exclusions | [Repoer / stier] | [Navn] | [Dato] | Gjelder ikke Copilot CLI |
| MCP servers | [Tillatt / Blokkert / Kun register] | [Navn] | [Dato] | Power Platform Skills-serverne i registeret |
| Plugins / custom agents | [Tillatt liste] | [Navn] | [Dato] | `microsoft/power-platform-skills` v[versjon] |
| Copilot Extensions (tredjepart) | [På / Av] | [Navn] | [Dato] | |
| Knowledge bases (Enterprise) | [På / Av] | [Navn] | [Dato] | |

## 4. Innsyn og logg

| Innstilling | Verdi | Eier | Sist vurdert | Merknad |
|---|---|---|---|---|
| Usage metrics | [Enabled everywhere / ...] | [Navn] | [Dato] | Må være på før KPI-arket kan fylles |
| Hvem ser metrics | [Roller / navn] | [Navn] | [Dato] | |
| Audit log leses | [Månedlig / ukentlig] av [navn] | [Navn] | [Dato] | |

## 5. Andre agentverktøy

| Verktøy | Status | Lisens via | Eier | Sist vurdert | Merknad |
|---|---|---|---|---|---|
| Claude Code | [Tillatt / Ikke tillatt / Pilot] | [Claude Enterprise / ingen] | [Navn] | [Dato] | Styres ikke av GitHub-policyene over |
| [Annet] | | | | | |

## 6. Arbeidsregler som ikke kan settes som policy

| Regel | Gjelder | Hvor den står |
|---|---|---|
| `--allow-all` kun i engangsmapper for testing | Alle utviklere | Instruksjonsfil-malen, [lenke] |
| Hemmeligheter limes aldri inn i prompt | Alle utviklere | [lenke] |
| AI-skrevet kode reviewes før merge | Alle repoer i sone 2 og 3 | Branch-beskyttelse + [lenke] |
| Ingen `pa app push` til sone 3 fra laptop | Alle utviklere | Pipeline + [lenke] |

---

**Endringslogg**

| Dato | Endring | Av |
|---|---|---|
| [Dato] | Første versjon | [Navn] |
