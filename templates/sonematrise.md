# Sonematrise for Power Platform og Code Apps: [Organisasjon]

> **Bruk av malen:** Dette er det daglige oppslagsverket for administratorer og makere. Erstatt `[hakeparenteser]`. Juster connector-lister, delingsgrenser og ALM-krav etter beslutningene i styringsplanen. Regulerte organisasjoner kan dele sone 3 i standard og regulert.

**Dokumenteier:** [Navn / rolle]
**Versjon:** 1.0
**Dato:** [ÅÅÅÅ-MM-DD]
**Hører til:** Styringsplan v[N]

---

## Side om side

| Dimensjon | Sone 1, personlig | Sone 2, team | Sone 3, enterprise |
|---|---|---|---|
| **Formål** | Læring, eksperiment, prototyper | Delte arbeidslaster for en avdeling | Forretningskritisk, organisasjonsbredt eller regulert |
| **Typisk bruker** | Enhver maker | Avdelingsteam | IT-støttede produktteam |
| **Miljøtype** | Personlig utviklermiljø | Produksjon for avdelingen, Managed | Produksjon, Managed, Dev/Test/Prod-sett |
| **Opprettelse** | Environment routing, automatisk | Admin etter forespørsel | Admin etter formell godkjenning |
| **Eier** | Makeren selv | Navngitt teameier | Navngitt produkteier og operatør |
| **Connectorer** | [Microsoft 365-kjernen] | [Kjernen + godkjente avdelingsconnectorer] | [Allow-liste per arbeidslast] |
| **Egendefinerte connectorer** | Blokkert | Vurderes enkeltvis | Vurderes, styres under arbeidslasten |
| **Delingsgrense** | [Kun deg selv / maks N] | [Innenfor teamets Entra-gruppe] | [Innenfor navngitt brukergruppe] |
| **Ekstern deling** | Blokkert | [Blokkert / enkeltvis med godkjenning] | [Per arbeidslast, eksplisitt godkjenning] |
| **Solutions påkrevd** | Nei | Ja | Ja, håndhevet |
| **Publisher-prefiks** | N/A | Påkrevd, avdelingens | Påkrevd, arbeidslastens |
| **Environment variables** | N/A | Anbefalt | Påkrevd for alt som varierer |
| **Connection references** | N/A | Anbefalt | Påkrevd |
| **Pipelines** | N/A | Personlig pipeline ok | Egen pipeline-vert, påkrevd |
| **Solution checker** | N/A | Før promotering, advarsel | Før promotering, blokkering |
| **Godkjenning før prod** | N/A | N/A | Påkrevd, [navngitt godkjennergruppe] |
| **Audit** | Plattformens standard | Plattform + inventar ukentlig | Plattform + SIEM |
| **Support** | Beste innsats, fellesskap | Avdelingen, CoE ved eskalering | IT, formell SLA |

## Rader for Code Apps og GitHub Copilot

| Dimensjon | Sone 1, personlig | Sone 2, team | Sone 3, enterprise |
|---|---|---|---|
| **Enable code apps** | På for pilotens miljøer via environment group-regel; av for alle andre | På | På |
| **Hvem kjører `pa app push`** | Makeren selv, mot eget miljø | Teamets utviklere med Environment Maker-rolle | Kun pipelinen, med service principal og `--non-interactive` |
| **Repo** | Anbefalt | Påkrevd, i [organisasjonens GitHub] | Påkrevd, branch-beskyttelse, CI, secret scanning |
| **Instruksjonsfiler** | Anbefalt | Påkrevd: `copilot-instructions.md` og `AGENTS.md` etter malen | Påkrevd, versjonert og reviewet |
| **Review av AI-skrevet kode** | Egen gjennomlesning | Pull request med én reviewer | Pull request med to reviewere, tester grønne |
| **Copilot CLI / agent mode** | Tillatt | Tillatt | Tillatt, uten rett til å endre pipeline, miljø eller policyer |
| **Plugins fra markedsplassen** | Power Platform Skills tillatt, automatisk oppdatering ok | Tillatt, versjon notert i instruksjonsfilen | Tillatt, versjon låst, endring reviewet |
| **Content exclusions** | [etter organisasjonens policy] | [repoer med persondata eller hemmeligheter ekskludert] | [som sone 2, pluss regulerte repoer] |
| **Hemmeligheter** | Aldri i repo, config eller prompt | Samme | Samme, håndhevet med secret scanning |
| **Connector-overflate per app** | Under ti | Under ti; unntak begrunnes | Under ti; unntak godkjennes |
| **Copilot-generert kode mot Dataverse** | Fritt i eget miljø | Gjennom connection references | Gjennom connection references og environment variables, aldri hardkodede ID-er |

---

## Sone 1, personlig produktivitet

### Hvem og hva

- **Brukere:** alle ansatte med Power Platform-tilgang. Nye makere lander her via environment routing.
- **Arbeidslaster:** personlig automatisering, prototyper, læring, første Code Apps med Copilot.
- **Levetid:** kort. Får en app brukere utover makeren selv, graduerer den til sone 2.

### Miljøkonfigurasjon

- **Environment group:** `[PP-Sone1-Personlig]`
- **Managed Environment:** på
- **Miljøtype:** personlig utviklermiljø
- **Dataverse:** [tillatt / begrenset / ikke som standard]
- **Enable code apps:** [på for piloten / av]

### Regler publisert på gruppen

- Delingsgrense: kan ikke dele med flere enn [N]
- Maker welcome content: på, lenker til sone 1-forventninger og vei til sone 2
- Power Apps code apps: [på / av]
- Connector-gruppe: Microsoft 365-kjernen
- Egendefinerte og premium-connectorer: blokkert uten lisens og godkjenning

### Makerens ansvar

- Bygg bare til eget bruk her
- Be om graduering når andre tar appen i bruk
- Ingen hemmeligheter i repo eller prompt
- Les onboarding-innholdet først

---

## Sone 2, teamsamarbeid

### Hvem og hva

- **Brukere:** avdelingsteam med navngitt eier.
- **Arbeidslaster:** delte apper og flyter for en avdeling; de fleste Code Apps lever her.

### Miljøkonfigurasjon

- **Environment group:** `[PP-Sone2-Team]`
- **Managed Environment:** på
- **Miljøtype:** produksjon, ett per avdeling eller per team
- **Enable code apps:** på

### Krav til en Code App i sone 2

1. Koden i et repo i [organisasjonens GitHub], med `copilot-instructions.md` etter malen.
2. Appen i en solution med avdelingens publisher-prefiks.
3. Datakilder gjennom connection references; miljøavhengige verdier som environment variables.
4. Pull request med review før `pa app push`.
5. Under ti connectorer.

---

## Sone 3, enterprise

### Hvem og hva

- **Brukere:** produktteam med IT-støtte.
- **Arbeidslaster:** forretningskritiske, organisasjonsbrede eller regulerte.

### Miljøkonfigurasjon

- **Environment group:** `[PP-Sone3-Enterprise]`
- **Managed Environment:** på
- **Miljøtype:** Dev/Test/Prod-sett
- **Enable code apps:** på

### Krav til en Code App i sone 3

Alt fra sone 2, pluss:

1. Pipeline fra Dev til Test til Prod med godkjenning før prod.
2. `pa app push` kjøres av pipelinen med service principal; ingen utvikler pusher direkte.
3. To reviewere og grønne tester før merge til main.
4. Conditional Access for lokasjon, siden app-ressursene ligger på et offentlig endepunkt.
5. Klassifisering mot EU AI Act dokumentert i repoets README.

---

## Standardmiljøets posisjon

Begrenset personlig produktivitet. Godkjente connectorer, delingsgrenser, navngitt admin, **Enable code apps av**. Ikke et sted for langlivede løsninger; de flyttes til riktig sone.

## Promoteringskriterier

| Fra | Til | Krav |
|---|---|---|
| Sone 1 | Sone 2 | Navngitt teameier; repo i organisasjonens GitHub; solution; connection references; review |
| Sone 2 | Sone 3 | Produkteier og operatør; pipeline; service principal; to reviewere; godkjenning før prod; klassifisering |

## Hurtigvalg: hvilken sone hører jeg hjemme i?

1. Bruker bare jeg appen? Sone 1.
2. Bruker avdelingen min appen, og har den en eier? Sone 2.
3. Stopper noe viktig hvis appen er nede, eller behandler den regulerte data? Sone 3.
