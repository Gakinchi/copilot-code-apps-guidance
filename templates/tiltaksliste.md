# Tiltaksliste for innføring av Copilot og Code Apps: [Organisasjon]

> **Bruk av malen:** Dette er den sekvenserte arbeidslisten. Erstatt `[hakeparenteser]`. P0 er de neste 30 dagene, P1 dag 30 til 90, P2 dag 90 til 180, P3 etter 180 dager. Hvert punkt har eier, frist, avhengighet og en sjekk som sier at det er gjort. Slett punkter som ikke gjelder; legg til det samtalene avdekker.

**Dokumenteier:** [Navn / rolle]
**Versjon:** 1.0
**Dato:** [ÅÅÅÅ-MM-DD]
**Hører til:** Styringsplan v[N], Sonematrise v[N]

---

## P0, grunnlag (neste 30 dager)

### P0.1 Lisenser og tenant-innstillinger

| # | Oppgave | Eier | Frist | Avhengighet | Sjekk |
|---|---|---|---|---|---|
| P0.1.1 | Bekreft Managed Environments-lisens for organisasjonen | [Lisensansvarlig] | [dato] | Ingen | Antall dokumentert; omfang bekreftet |
| P0.1.2 | Begrens opprettelse av miljøer til Power Platform-admin, Global admin og D365-admin i PPAC | [Plattform-admin] | [dato] | Ingen | Innstillingen skjermdumpet; verifisert av annen admin |
| P0.1.3 | Begrens opprettelse av trial-miljøer | [Plattform-admin] | [dato] | P0.1.2 | Som over |
| P0.1.4 | Inventar over Power Platform-adminroller | [Plattform-admin] | [dato] | Ingen | Liste eksportert og gjennomgått |
| P0.1.5 | Inventar over Microsoft 365-SKU-er og Power Apps-lisenser per brukergruppe | [Lisensansvarlig] | [dato] | Ingen | Lisensposisjon dokumentert i styringsplanen §2.6 |
| P0.1.6 | Avklar GitHub Copilot-lisensform (Business eller Enterprise) og antall seter for piloten | [Lisensansvarlig + Copilot-admin] | [dato] | Ingen | Beslutning dokumentert med dato og kilde til prisside |
| P0.1.7 | Bekreft at sluttbrukerne i piloten har Power Apps Premium, pay-as-you-go eller App Pass | [Lisensansvarlig] | [dato] | P0.1.5 | Per bruker dokumentert |

### P0.2 Admin-dekning

| # | Oppgave | Eier | Frist | Avhengighet | Sjekk |
|---|---|---|---|---|---|
| P0.2.1 | Minst to navngitte Power Platform-admins | [IT-leder] | [dato] | Ingen | Navn dokumentert; reserve briefet |
| P0.2.2 | Minst to navngitte GitHub-organisasjonseiere med Copilot-ansvar | [IT-leder] | [dato] | Ingen | Navn dokumentert |
| P0.2.3 | Break-glass-prosedyre dokumentert | [IT-leder] | [dato] | P0.2.1 | Prosedyre gjennomgått av sikkerhet |
| P0.2.4 | Hvis regulert: PIM for admin-rollene | [Identitetsansvarlig] | [dato] | P0.2.1 | PIM-policy aktiv; logger til SIEM |

### P0.3 Standardmiljøet

| # | Oppgave | Eier | Frist | Avhengighet | Sjekk |
|---|---|---|---|---|---|
| P0.3.1 | Navngitt admin på standardmiljøet | [Plattform-admin] | [dato] | P0.2.1 | Dokumentert i styringsplanen |
| P0.3.2 | DLP for standardmiljøet: Microsoft 365-kjernen som Business; egendefinerte og nye connectorer blokkert | [Plattform-admin] | [dato] | P0.4 | Policy aktiv; testet med en kjent blokkert connector |
| P0.3.3 | Delingsgrenser i standardmiljøet | [Plattform-admin] | [dato] | Ingen | Verifisert i PPAC |
| P0.3.4 | Enable code apps av i standardmiljøet | [Plattform-admin] | [dato] | Ingen | Innstillingen verifisert |
| P0.3.5 | Baseline-inventar av standardmiljøet (apper, flyter, agenter, Code Apps, makere) | [Plattform-admin] | [dato] | Ingen | Eksport lagret som «før»-bilde |

### P0.4 DLP-grunnlinje for hele tenanten

> **Forhåndsvis før du publiserer.** En DLP-endring suspenderer flyter som bryter den innen et døgn, uten advarselsmodus. Kjør forhåndsvisning per miljø før P0.4.2. Forutsier den suspensjoner, utvid policyen eller dokumenter akseptert risiko per flyt med eierens signatur. Hard port, ikke råd.

| # | Oppgave | Eier | Frist | Avhengighet | Sjekk |
|---|---|---|---|---|---|
| P0.4.0 | Forhåndsvis effekt av foreslått policy per miljø | [Plattform-admin] | [dato] | P0.4.1 | Rapport lagret; ingen uventede suspensjoner, eller akseptert risiko signert |
| P0.4.1 | Klassifiser connectorer (Business / Non-business / Blocked) | [Plattform-admin + sikkerhet] | [dato] | Ingen | Liste godkjent av sikkerhet |
| P0.4.2 | Publiser tenant-policyen | [Plattform-admin] | [dato] | P0.4.0, P0.4.1 | Policy aktiv; forhåndsvisning mot faktisk effekt sammenlignet innen 48 timer |
| P0.4.3 | Triage-prosess for nye connectorer | [Plattform-admin] | [dato] | P0.4.1 | Prosess dokumentert; første gjennomgang planlagt |
| P0.4.4 | DLP-test med en Code App og en blokkert connector | [Plattform-admin + én utvikler] | [dato] | P0.4.2 | Testen fra veiledningen gjentatt; resultatet dokumentert |

### P0.5 Entra-grupper for soner og pilot

| # | Oppgave | Eier | Frist | Avhengighet | Sjekk |
|---|---|---|---|---|---|
| P0.5.1 | Opprett `[PP-Sone1-Makere]`, `[PP-Sone2-Makere]`, `[PP-Sone3-Makere]`, `[PP-Sone3-Operatorer]`, `[PP-Sone3-Godkjennere]` | [Identitetsansvarlig] | [dato] | Ingen | Grupper med dokumenterte eiere |
| P0.5.2 | Opprett `[Copilot-Pilot]` og legg til pilotutviklerne | [Identitetsansvarlig] | [dato] | Ingen | Medlemmer bekreftet |
| P0.5.3 | Dokumenter gruppeforvaltning (hvem legger til og fjerner, takt) | [Identitetsansvarlig] | [dato] | P0.5.1 | Prosedyre dokumentert |

### P0.6 GitHub Copilot-grunnlag

| # | Oppgave | Eier | Frist | Avhengighet | Sjekk |
|---|---|---|---|---|---|
| P0.6.1 | Fyll ut Copilot-policy-malen: forslag som matcher offentlig kode, tillatte modeller, plugins og MCP-servere, content exclusions | [Copilot-admin + sikkerhet] | [dato] | P0.1.6 | Policy dokumentert og satt i GitHub-organisasjonen; skjermdump |
| P0.6.2 | Content exclusions for repoer med persondata eller hemmeligheter | [Copilot-admin] | [dato] | P0.6.1 | Liste over ekskluderte repoer |
| P0.6.3 | Tildel Copilot-seter til pilotgruppen | [Copilot-admin] | [dato] | P0.1.6, P0.5.2 | Seter aktivert; første innlogging bekreftet |
| P0.6.4 | Bekreft at markedsplassen `microsoft/power-platform-skills` er tillatt | [Copilot-admin] | [dato] | P0.6.1 | Plugin installert av én pilotutvikler |
| P0.6.5 | Mal for `copilot-instructions.md` og `AGENTS.md` lagt i organisasjonens malrepo | [CoE + én utvikler] | [dato] | Ingen | Malene finnes; første Code App-repo bruker dem |

### P0.7 Code Apps-grunnlag

| # | Oppgave | Eier | Frist | Avhengighet | Sjekk |
|---|---|---|---|---|---|
| P0.7.1 | Opprett pilotens environment group med regelen «Power Apps code apps» På | [Plattform-admin] | [dato] | P0.5.2 | Gruppen finnes; regelen publisert |
| P0.7.2 | Flytt pilotutviklernes personlige miljøer inn i gruppen | [Plattform-admin] | [dato] | P0.7.1 | Miljøene listet i gruppen |
| P0.7.3 | Verifiser at Code Apps er av i standardgruppen | [Plattform-admin] | [dato] | P0.7.1 | `pa app init` fra en maker utenfor piloten feiler med forventet melding |
| P0.7.4 | Hurtigstart kjørt av én pilotutvikler fra tom mappe til publisert app | [Pilotutvikler] | [dato] | P0.6.3, P0.7.1 | App synlig i maker-portalen med typen Code |

### P0.8 Champions og baseline

| # | Oppgave | Eier | Frist | Avhengighet | Sjekk |
|---|---|---|---|---|---|
| P0.8.1 | Rekrutter champions, én per team i piloten (GitHub anbefaler 45 dager før lansering) | [Adopsjonsleder] | [dato] | Ingen | Navn og team dokumentert |
| P0.8.2 | Mål baseline for KPI-ene før piloten starter | [CoE] | [dato] | Ingen | KPI-arket fylt ut med «før»-verdier |
| P0.8.3 | Klassifiser pilotens planlagte apper mot EU AI Act (Annex III, artikkel 50) | [Etterlevelse + CoE] | [dato] | Ingen | Svar i hvert repos README |

### P0.9 Regulerte arbeidslaster (kun regulerte organisasjoner)

| # | Oppgave | Eier | Frist | Avhengighet | Sjekk |
|---|---|---|---|---|---|
| P0.9.1 | Identifiser regulerte data i Power Platform-miljøer | [Etterlevelse + plattform-admin] | [dato] | P0.3.5 | Liste over miljøer med regulerte data |
| P0.9.2 | Risikoklassifiser hver arbeidslast | [Etterlevelse] | [dato] | P0.9.1 | Klassifisering dokumentert |
| P0.9.3 | Bekreft avtalegrunnlaget med Microsoft og GitHub for regulerte data, inkludert hvor Copilot behandler data | [Juridisk / innkjøp] | [dato] | Ingen | Skriftlig bekreftelse |

---

## P1, utrulling av grunnlaget (dag 30 til 90)

### P1.1 Environment groups og regler

| # | Oppgave | Eier | Frist | Avhengighet | Sjekk |
|---|---|---|---|---|---|
| P1.1.1 | Opprett `[PP-Sone1-Personlig]` og publiser sone 1-regler | [Plattform-admin] | [dato] | P0 ferdig | Regler låst; testet på ett miljø |
| P1.1.2 | Opprett `[PP-Sone2-Team]` og publiser sone 2-regler, inkludert Power Apps code apps På | [Plattform-admin] | [dato] | P0 ferdig | Regler låst |
| P1.1.3 | Opprett `[PP-Sone3-Enterprise]` og publiser sone 3-regler | [Plattform-admin] | [dato] | P0 ferdig | Regler låst |

### P1.2 Environment routing

| # | Oppgave | Eier | Frist | Avhengighet | Sjekk |
|---|---|---|---|---|---|
| P1.2.1 | Slå på routing til sone 1-gruppen | [Plattform-admin] | [dato] | P1.1.1 | Testet med en ikke-admin-bruker |
| P1.2.2 | Maker welcome content for routede miljøer | [CoE] | [dato] | P1.2.1 | Innhold synlig på nytt miljø |

### P1.3 DLP-overlegg per sone

| # | Oppgave | Eier | Frist | Avhengighet | Sjekk |
|---|---|---|---|---|---|
| P1.3.1 | Sone 1-overlegg (Microsoft 365 bare) | [Plattform-admin] | [dato] | P0.4.2, P1.1.1 | Policy scopet til gruppen |
| P1.3.2 | Sone 2-overlegg | [Plattform-admin] | [dato] | P0.4.2, P1.1.2 | Som over |
| P1.3.3 | Sone 3-overlegg per arbeidslast | [Plattform-admin] | [dato] | P0.4.2, P1.1.3 | Som over |

### P1.4 Piloten bygger

| # | Oppgave | Eier | Frist | Avhengighet | Sjekk |
|---|---|---|---|---|---|
| P1.4.1 | Kunngjøring til piloten med lesestier og kanal (14 dager før workshop) | [Adopsjonsleder] | [dato] | P0.8.1 | Sendt |
| P1.4.2 | Workshop: fra idé til fungerende app på fire timer | [CoE + champions] | [dato] | P0.7.4 | Hvert team har en app i eget miljø |
| P1.4.3 | Lansering: kanal, wiki, prompt-bibliotek åpnet | [Adopsjonsleder] | [dato] | P1.4.2 | Kanal aktiv; wiki lenker til denne veiledningen |
| P1.4.4 | Første sone 2-app på solution med connection references | [Pilotteam] | [dato] | P1.1.2 | Appen flyttet mellom to miljøer uten kodeendring |
| P1.4.5 | Ukentlig gjennomgang av Copilot usage metrics og inventar i piloten | [CoE] | [dato] | P1.4.3 | Tall ført i KPI-arket hver uke |

### P1.5 Pipeline-grunnlag

| # | Oppgave | Eier | Frist | Avhengighet | Sjekk |
|---|---|---|---|---|---|
| P1.5.1 | Pipeline-vert opprettet | [Plattform-admin] | [dato] | P1.1.3 | Verten finnes |
| P1.5.2 | Service principal for `pa app push --non-interactive` i sone 3 | [Identitetsansvarlig + plattform-admin] | [dato] | P1.5.1 | Testpush fra CI lykkes |

### P1.6 Inventar og reaktiv styring

| # | Oppgave | Eier | Frist | Avhengighet | Sjekk |
|---|---|---|---|---|---|
| P1.6.1 | Fullt inventar fra PPAC, inkludert Code Apps per miljø | [Plattform-admin] | [dato] | Ingen | Eksport lagret |
| P1.6.2 | Rutiner for drift, foreldreløse apper og nye connectorer satt i kalenderen | [Plattform-admin] | [dato] | P1.6.1 | Første gjennomgang holdt |

---

## P2, løft og kapabilitet (dag 90 til 180)

### P2.1 Pilotevaluering og utvidelse

| # | Oppgave | Eier | Frist | Avhengighet | Sjekk |
|---|---|---|---|---|---|
| P2.1.1 | Pilotevaluering mot baseline (KPI-ark, spørreundersøkelse, retrospektiv) | [CoE + ledelse] | [dato] | P1.4.5 | Rapport levert; beslutning om utvidelse |
| P2.1.2 | Neste bølge team får seter, miljøer og onboarding | [Adopsjonsleder] | [dato] | P2.1.1 | Teamene aktive i kanalen |
| P2.1.3 | Oppdater styringsplan og sonematrise med lærdom fra piloten | [CoE] | [dato] | P2.1.1 | Ny versjon godkjent |

### P2.2 Kritiske arbeidslaster på ALM

| # | Oppgave | Eier | Frist | Avhengighet | Sjekk |
|---|---|---|---|---|---|
| P2.2.1 | Identifiser de fem viktigste arbeidslastene utenfor sone 3 | [CoE + forretning] | [dato] | P1.6.1 | Liste signert |
| P2.2.2 | Vurder hver: solution-struktur, avhengigheter, eier | [CoE + produkteiere] | [dato] | P2.2.1 | Vurdering per arbeidslast |
| P2.2.3 | Flytt dem til sone 3 med pipeline | [Produkteiere + CoE] | [dato] | P2.2.2 | Flyttet, validert, parallellkjørt, byttet over |

### P2.3 Solution checker

| # | Oppgave | Eier | Frist | Avhengighet | Sjekk |
|---|---|---|---|---|---|
| P2.3.1 | Advarselsmodus i sone 2 | [Plattform-admin] | [dato] | P1.1.2 | Aktiv |
| P2.3.2 | Blokkeringsmodus i sone 3 Test og Prod | [Plattform-admin] | [dato] | P2.2.3 | Aktiv; første kjøring testet |

### P2.4 Champion-program og fellesskap

| # | Oppgave | Eier | Frist | Avhengighet | Sjekk |
|---|---|---|---|---|---|
| P2.4.1 | Champion-opplæring (90-dagers plan) | [Adopsjonsleder] | [dato] | P0.8.1 | Første samling holdt |
| P2.4.2 | Ukentlige office hours for utviklere | [CoE] | [dato] | Ingen | Første holdt; oppmøte ført |
| P2.4.3 | Prompt- og skill-bibliotek med bidrag fra teamene | [CoE] | [dato] | P1.4.3 | Minst fem delte prompter i bruk |
| P2.4.4 | Show-and-tell: første interne demo av Code Apps bygget med Copilot | [Adopsjonsleder] | [dato] | P2.1.1 | Holdt; opptak i wiki |

### P2.5 AI-kompetanse (EU AI Act artikkel 4)

| # | Oppgave | Eier | Frist | Avhengighet | Sjekk |
|---|---|---|---|---|---|
| P2.5.1 | Opplæring per rolle gjennomført for alle med Copilot-sete | [Adopsjonsleder + etterlevelse] | [dato] | P2.1.2 | Deltakerliste; innhold arkivert |
| P2.5.2 | Rutine for klassifisering av nye apper innført i repo-malen | [Etterlevelse + CoE] | [dato] | P0.8.3 | Malen krever svar før første commit |

---

## P3, modning (etter 180 dager)

| # | Oppgave | Eier | Frist | Avhengighet | Sjekk |
|---|---|---|---|---|---|
| P3.1 | Beslutning: CoE Starter Kit eller native PPAC | [Plattformeier + CoE] | [dato] | P1.6 | Beslutning dokumentert |
| P3.2 | Kostnadsrapportering per forretningsenhet (seter, lisenser, forbruk) | [Plattform-admin + økonomi] | [dato] | Ingen | Første rapport levert |
| P3.3 | Årlig gjennomgang: sonematrise, DLP, Copilot-policyer, KPI-er, AI Act-attestasjon | [Plattformeier] | [dato] | Ingen | Agenda dokumentert; første gjennomgang holdt |
| P3.4 | Revurdering av hver omvei i styringsplanen §6 | [Eier per omvei] | [dato] | Ingen | Beslutning: fortsett / erstatt / ny omvei |
| P3.5 | Ny kjøring av hurtigstarten etter hver hovedversjon av `pa` eller pluginen; oppdater intern wiki | [CoE] | [løpende] | Ingen | Versjon og dato oppdatert |

---

## Løpende rutiner

### Ukentlig

| # | Oppgave | Eier |
|---|---|---|
| R.U.1 | Standardmiljøet: nye apper og flyter, Code Apps som ikke hører hjemme der | [Plattform-admin] |
| R.U.2 | Sikkerhetsanbefalinger i PPAC: gjennomgått, handlet eller utsatt | [Plattform-admin + sikkerhet] |
| R.U.3 | Copilot usage metrics: aktiverte seter uten bruk, nye brukere | [Copilot-admin] |
| R.U.4 | Overvåking: feilmønstre, degradering | [Plattform-admin] |

### Annenhver uke

| # | Oppgave | Eier |
|---|---|---|
| R.B.1 | Nye connectorer klassifisert under DLP | [Plattform-admin + sikkerhet] |
| R.B.2 | Foreldreløse apper og repoer: eiere som har sluttet, miljøer uten admin | [Plattform-admin] |

### Månedlig

| # | Oppgave | Eier |
|---|---|---|
| R.M.1 | Inventar-eksport sammenlignet med forrige måned | [Plattform-admin] |
| R.M.2 | Lisenssamsvar for Managed Environments og Copilot-seter | [Plattform-admin + lisensansvarlig] |
| R.M.3 | GitHub audit log: Copilot-policyendringer, nye plugins | [Copilot-admin] |
| R.M.4 | Helsesjekk av sone 3-arbeidslaster | [Plattform-admin + eiere] |

### Kvartalsvis

| # | Oppgave | Eier |
|---|---|---|
| R.K.1 | Styringsposisjon: soner, grupper, DLP og Copilot-policyer fortsatt riktige? | [Plattformeier + CoE] |
| R.K.2 | Reklassifisering av arbeidslaster mellom soner | [Plattformeier + eiere] |
| R.K.3 | KPI-gjennomgang med ledelsen | [CoE + ledelse] |
| R.K.4 | Stale-sjekk av intern wiki og instruksjonsfiler mot gjeldende CLI- og pluginversjoner | [CoE] |
