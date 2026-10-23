# Styringsplan for Power Platform og GitHub Copilot: [Organisasjon]

> **Bruk av malen:** Erstatt alle `[hakeparenteser]`. Slett seksjoner som ikke gjelder. Behold strukturen, men skriv i organisasjonens språk. Dette er et strategidokument som skal leses som ett sammenhengende argument for den valgte tilnærmingen, ikke en sjekkliste. Sjekklisten er tiltakslisten.

**Dokumenteier:** [Navn / rolle]
**Godkjennere:** [CIO / CTO / CISO / etterlevelsesleder / andre]
**Versjon:** 1.0
**Dato:** [ÅÅÅÅ-MM-DD]
**Revisjonstakt:** [Årlig / halvårlig]

---

## 1. Sammendrag

[Ett avsnitt: hvem organisasjonen er, hvilket problem planen løser, den valgte tilnærmingen i klartekst, forventet resultat de neste tolv månedene, og hva som står på spill hvis vi ikke handler. Skriv for en CIO som leser første avsnitt og så kanskje overskriftene.]

**Hovedbeslutninger i planen:**

- [Tre soner: personlig, team, enterprise]
- [Environment routing for alle nye makere / admin-styrt opprettelse]
- [DLP-grunnlinje for hele tenanten med overlegg per sone]
- [Solution-basert ALM obligatorisk fra sone 2]
- [GitHub Copilot: lisensform, policyer, hvem som får sete først]
- [Code Apps: slått på i pilotgruppen, av ellers; utvides etter pilotevaluering]
- [Center of Excellence etablert innen Q[N] / ikke nå]
- [Regulatorisk overlegg: EU AI Act, GDPR, eventuelt sektorkrav]

---

## 2. Kontekst og dagens situasjon

### 2.1 Om organisasjonen

[Antall ansatte, geografi, bransje, regulatorisk regime, IT-modell: sentral eller føderert.]

### 2.2 Dagens Power Platform-fotavtrykk
*(Brownfield; slett for greenfield)*

- **Miljøer:** [antall per type: produksjon / sandbox / developer / trial / default]
- **Managed Environments:** [antall]
- **Aktive makere siste 90 dager:** [anslag]
- **Aktive apper / flyter / agenter:** [tall fra inventaret]
- **Code Apps i dag:** [antall, i hvilke miljøer, hvem som bygget dem]
- **Forretningskritiske arbeidslaster:** [liste]
- **DLP-dekning:** [hele tenanten / delvis / ingen]
- **ALM-praksis:** [solutions i bruk for hvilke arbeidslaster / ingen]

### 2.3 Dagens bruk av GitHub Copilot

- **Lisens:** [Copilot Business / Copilot Enterprise / individuelle lisenser / ingen]
- **Seter tildelt:** [antall], **aktive siste 28 dager:** [antall]
- **Organisasjonspolicyer satt:** [ja / nei / delvis; hvilke]
- **Content exclusions:** [ja / nei]
- **Plugins og MCP-servere i bruk:** [liste]
- **Instruksjonsfiler i repoene:** [ja / nei / varierer]

### 2.4 Hva som virker og hva som ikke virker

[Kort og ærlig. Brownfield-organisasjoner har gjort ting riktig og ting galt; planen skal anerkjenne begge.]

### 2.5 Drivere for planen

[Hvorfor nå? Revisjonsfunn, Copilot-utrulling, utviklerteam som allerede bruker AI uten rammer, kundekrav, regulatorisk endring. Vær konkret.]

### 2.6 Lisensposisjon

- **Microsoft 365-SKU-er:** [E3 / E5 / F3 / Business Premium; antall per SKU]
- **Power Platform-lisenser:** [Power Apps Premium / per app / pay-as-you-go / App Pass; antall]
- **GitHub:** [GitHub Enterprise Cloud / Team / Free; Copilot Business / Enterprise; antall seter]
- **Azure-abonnement** for nøkkelhvelv, nettverk, SIEM: [tilgjengelig / ikke]

**Hva som er mulig med dagens lisenser:**

| Funksjon | Mulig i dag? | Merknad |
|---|---|---|
| Managed Environments | [Ja/Delvis/Nei] | [Hvilke brukergrupper dekkes] |
| Code Apps for sluttbrukere | [Ja/Nei] | [Premium, pay-as-you-go eller App Pass for hvilke brukere] |
| GitHub Copilot for utviklerne | [Ja/Nei] | [Business eller Enterprise; hvem får sete] |
| Copilot-policyer på enterprise-nivå | [Ja/Nei] | [Krever Copilot Enterprise og GitHub Enterprise Cloud] |
| Conditional Access på Power Apps | [Ja/Nei] | [Entra-lisens] |
| Purview-integrasjon | [Ja/Delvis/Nei] | |

**Løft som er lagt fram for beslutning:** [Hvor lisensgrensene stopper designet, hvilket løft som ville åpne det, for hvem, i hvilket omfang. Innspill til innkjøp, ikke en ensidig anbefaling.]

---

## 3. Målbildet: styringsmodellen

### 3.1 Sonemodellen

Planen følger Microsofts anbefalte modell med tre soner, definert av hva slags arbeid som hører hjemme der, hvilke kontroller som gjelder, og hvordan løsninger driftes.

**Sone 1, personlig produktivitet.** [To-tre setninger. Entra-grupper som gir tilgang. Personlige utviklermiljøer og environment routing. Her lærer utviklerne Copilot og Code Apps uten å kunne skade noe.]

**Sone 2, teamsamarbeid.** [To-tre setninger. Solution-basert ALM, navngitte eiere, typiske arbeidslaster. Code Apps i repo i organisasjonens GitHub, review før merge.]

**Sone 3, enterprise.** [To-tre setninger. Full ALM, pipeline-basert promotering, godkjenning før prod. `pa app push` kun fra pipeline med service principal. Regulerte tilleggskontroller hvis aktuelt.]

Detaljer per sone står i den tilhørende **sonematrisen**.

### 3.2 Standardmiljøets posisjon

[Behandles som begrenset personlig produktivitet. Godkjente connectorer, delingsgrenser, navngitt admin, Code Apps av. Ikke et sted for langlivede løsninger.]

### 3.3 Identitet og tilgang

[Entra-sikkerhetsgrupper per sone. PIM for admin-roller hvis regulert. Minst to navngitte tenant-administratorer. Conditional Access som dekker Power Apps. Service principal for pipeline-publisering av Code Apps.]

### 3.4 Rapportering og innsyn

[Power Platform admin center: inventar, overvåking, sikkerhet. GitHub: Copilot usage metrics og audit log. Hvem ser på hva, hvor ofte.]

### 3.5 Endringshåndtering

[Utrullingsringer: ring 0 plattformteam, ring 1 piloten, ring 2 bred utrulling. Beslutningsrett: plattformeier, soneeiere, løsningseiere. Takt for endringsgjennomgang.]

### 3.6 GitHub Copilot

- **Lisensform og tildeling:** [Business / Enterprise; hvem får sete, i hvilken rekkefølge, hvem godkjenner]
- **Organisasjonspolicyer:** [forslag som matcher offentlig kode, modeller som er tillatt, plugins og MCP-servere som er tillatt, content exclusions for hvilke repoer; se Copilot-policy-malen]
- **Instruksjonsfiler:** [krav til `copilot-instructions.md` og `AGENTS.md` i hvert Code App-repo; hva de minst skal inneholde]
- **Review:** [ingen merge uten menneskelig review; samme regler for AI-skrevet kode som for annen kode]
- **Grenser:** [hva Copilot ikke får gjøre: ikke push til prod, ikke endre pipeline eller miljøinnstillinger, ingen hemmeligheter i prompt]
- **Alternative agentverktøy:** [Claude Code tillatt / ikke; samme policyer gjelder]

### 3.7 Code Apps

- **Hvor Code Apps er slått på:** [miljøer og environment groups; regelen «Power Apps code apps»]
- **Hvem får publisere:** [maker-roller per sone; service principal i sone 3]
- **ALM-krav:** [solutions, connection references, environment variables fra sone 2]
- **Connector-overflate:** [under ti connectorer per app; unntak krever begrunnelse]

---

## 4. Regulatorisk og etterlevelse

### 4.1 Gjeldende regelverk

[GDPR, EU AI Act, eventuelt NIS2, sikkerhetsloven, sektorkrav. Én linje per regelverk om hvilken del av organisasjonen som er i scope.]

### 4.2 Sky og datalokasjon

[Hvilken Microsoft-sky, hvilke regioner for miljøene, hvor GitHub Copilot behandler data, EU Data Boundary-status per tjeneste. Hvorfor.]

### 4.3 EU AI Act

- **Rolle:** [deployer for GitHub Copilot og for egne AI-apper; provider hvis vi leverer AI-apper til andre]
- **Artikkel 4, AI-kompetanse:** [opplæringsplan per rolle; se beredskapsdelen]
- **Klassifisering av apper:** [rutine: hver ny app vurderes mot Annex III og artikkel 50 ved oppstart; svaret i repoets README]
- **Høyrisiko-apper:** [ingen identifisert / liste med tiltak etter artikkel 26]

### 4.4 Tilleggskontroller for sone 3

[Nøkkelhåndtering, Lockbox, IP-brannmur, audit log til SIEM, Purview-etiketter. Hva som gjelder for Code Apps spesielt: Conditional Access for lokasjon, siden app-ressursene ligger på et offentlig endepunkt.]

### 4.5 Etterlevelseskart

| Kontroll | Implementering | Krav |
|---|---|---|
| DLP for hele tenanten | [klassifisering] | [GDPR art. 32 / NIS2 / sektorkrav] |
| Copilot content exclusions | [hvilke repoer] | [GDPR, forretningshemmeligheter] |
| Menneskelig review før merge | [branch-beskyttelse] | [AI Act art. 26 dokumentasjon hvis høyrisiko] |
| ... | ... | ... |

### 4.6 Roller og godkjenninger

[Hvem eier etterlevelse for Power Platform og Copilot. Personvernombudets rolle. Signeringstakt.]

---

## 5. Utrullingsplan, sammendrag

Den sekvenserte arbeidslisten står i tiltakslisten. Her er fasene.

### Fase 1, grunnlag (dag 1 til 30)
[Tenant-kontroller, standardmiljø herdet, DLP-grunnlinje, environment groups per sone, Copilot-policyer satt, pilotgruppe valgt, champions rekruttert.]

### Fase 2, første bølge (dag 30 til 90)
[Piloten bygger. Første sone 2-arbeidslaster på ALM. Workshop. Lansering med kanal og wiki. Første måling mot baseline.]

### Fase 3, bredere utrulling (dag 90 til 180)
[Flere team. Champion-program. Pipeline for sone 3. Pilotevaluering og beslutning om utvidelse.]

### Fase 4, modning (etter 180 dager)
[Kontinuerlig forbedring, kostnadsoptimalisering, årlig gjennomgang, avvikling av gamle arbeidslaster.]

### Kritiske avhengigheter

[Lisensinnkjøp, Entra-grupper, Conditional Access-design, SIEM-kapasitet, signering fra forretningsenheter.]

---

## 6. Omveier og begrensninger

| Ideell tilnærming | Begrensning | Omvei | Hensikt bevart | Revurderes |
|---|---|---|---|---|
| [Managed Environments for hele tenanten] | [Lisens ikke budsjettert for alle] | [Kun sone 2 og 3; sone 1 styres med DLP og inventar-rutine] | [Personlig utvikling styres, bare grovere] | [Q4 2026] |
| ... | ... | ... | ... | ... |

---

## 7. Suksessmål

Måles kvartalsvis mot baseline fra før piloten. KPI-arket har definisjonene og kildene.

- [Andel nye apper i andre miljøer enn standard: 95 % innen Q4]
- [DLP-dekning: 100 % av miljøene innen Q1]
- [Copilot: aktiverte seter i bruk siste 28 dager: 80 %]
- [Code Apps i sone 2 og 3 på solutions med connection references: 100 %]
- [Tid fra oppgave til første fungerende versjon i piloten: halvert mot baseline]
- [Hendelser knyttet til Power Platform eller Copilot: null datatap]

---

## 8. Roller og ansvar

| Rolle | Person | Ansvar |
|---|---|---|
| Plattformeier / Power Platform-admin | [Navn] | Tenant-innstillinger, environment groups og regler, DLP, routing, overvåking, Code Apps-bryteren |
| Reserve plattform-admin | [Navn] | Break-glass, ukentlig rotasjon |
| Copilot-admin (GitHub-organisasjonseier) | [Navn] | Seter, policyer, content exclusions, usage metrics, audit log |
| Sone 1-eier | [Navn / rolle] | Rammer for personlig produktivitet, onboarding av makere |
| Sone 2-eier | [Navn / rolle] | Standarder for teammiljøer, løsningsreview |
| Sone 3-eier | [Navn / rolle] | Enterprise-standarder, ALM-håndheving, godkjenninger |
| Etterlevelse | [Navn / rolle] | Regulatorisk samsvar, revisjonssvar, AI Act-klassifisering |
| Sikkerhet | [Navn / rolle] | Conditional Access, identitet, hendelseshåndtering |
| Personvernombud | [Navn] | GDPR, databehandleravtaler, spørsmål til Microsoft og GitHub |
| CoE-leder | [Navn / rolle] | CoE-drift, champion-program |
| Adopsjons- / fellesskapsleder | [Navn / rolle] | Opplæring, champions, kommunikasjon, workshop |

---

## 9. Ordliste

Se veiledningens ordliste. Legg til organisasjonens egne begreper her.

---

## 10. Vedlegg

- **Vedlegg A:** Sonematrise
- **Vedlegg B:** Tiltaksliste
- **Vedlegg C:** Copilot-policy
- **Vedlegg D:** DLP-policyer (JSON)
- **Vedlegg E:** Environment group-regler (JSON)
- **Vedlegg F:** Skript
- **Vedlegg G:** Referanser til Microsoft Learn og GitHub Docs, med dato

---

## Dokumenthistorikk

| Versjon | Dato | Forfatter | Endringer |
|---|---|---|---|
| 0.1 | [dato] | [navn] | Første utkast |
| 1.0 | [dato] | [navn] | Godkjent av [godkjennere] |
