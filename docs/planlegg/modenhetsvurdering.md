---
title: Modenhetsvurdering
tags: [arkitekt, leder]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Modenhetsvurdering: hvor står vi i dag

**Hvem denne siden er for:** arkitekten som skal gjennomføre vurderingen, og ledelsen som får resultatet. Vurderingen følger Microsofts åtte adopsjonsfaser for Power Platform, med en niende dimensjon for GitHub Copilot. Den tar en formiddag med de riktige personene i rommet: Power Platform-admin, Copilot-admin (GitHub-eier), en utviklingsleder, lisensansvarlig og den som eier sikkerhet.

## Skalaen

| Nivå | Betyr |
|---|---|
| 0 | Finnes ikke, eller ingen vet |
| 1 | Finnes, men uformelt og personavhengig |
| 2 | Dokumentert og i bruk i deler av organisasjonen |
| 3 | Standard, håndhevet teknisk der det er mulig, målt |
| 4 | Forbedres jevnlig basert på måling |

Målet for piloten er nivå 2 på alt som angår piloten innen dag 90, ikke nivå 4 på alt.

## Dimensjonene

Svar på hvert spørsmål med nivå og én setning med bevis. «Vi har DLP» er ikke bevis; «tenant-policy publisert 2026-03, dekker alle miljøer unntatt to, klassifiseringsliste i styringsplanen» er.

### 1. Strategi
- Finnes en vedtatt grunn til å bruke Power Platform, og nå Copilot og Code Apps, med mål som kan måles?
- Finnes en baseline for noen av målene?

### 2. Planlegg
- Er roller navngitt: plattform-admin (to), Copilot-admin (to), CoE, champions, etterlevelse, personvernombud?
- Er lisensposisjonen kjent: Microsoft 365-SKU-er, Power Apps-lisenser, GitHub-plan og Copilot-seter?
- Er leveransemodellen bestemt: sentral, føderert eller hybrid?

### 3. Sikkerhet
- Er Copilot-policyene satt (CLI, modeller, MCP, public code, content exclusions), og vet dere at content exclusions ikke gjelder CLI-en?
- Er hemmeligheter ute av repoer og config-filer, med secret scanning på?
- Er Conditional Access satt for Power Apps?
- Har personvernombudet vurdert dataflyten til modellen og dataresidens?

### 4. Styring
- Finnes en sonemodell med environment groups og publiserte regler?
- Er standardmiljøet herdet, med Code Apps av?
- Er DLP på plass for hele tenanten, med klassifiseringsliste og forhåndsvisning før endringer?
- Er Code Apps slått på bare der det er ment, via regel?

### 5. Drift og ALM
- Brukes solutions, connection references og environment variables for det som flyttes mellom miljøer?
- Finnes pipeline fra Dev til Test til Prod, og en service principal for publisering?
- Har noen ansvar for å følge produktendringer (CLI-versjoner, plugin-versjoner) og oppdatere interne guider?

### 6. Beredskap og opplæring
- Finnes en læringssti per rolle, og en workshop-form som gir en fungerende app på en dag?
- Er AI-kompetanse (EU AI Act artikkel 4) dekket for de som bruker Copilot?

### 7. Fellesskap
- Finnes champions, en kanal med svar samme dag, og et sted å dele prompter og instruksjonsfiler?

### 8. Måling
- Finnes et KPI-ark med eier, og er Copilot usage metrics-policyen slått på?
- Måles tid fra oppgave til fungerende versjon på noen måte i dag?

### 9. GitHub Copilot i utviklingen (tillegg)
- Bruker utviklerne allerede Copilot, i IDE eller CLI, med eller uten rammer?
- Finnes instruksjonsfiler i repoene?
- Reviewes AI-skrevet kode som annen kode, med branch-beskyttelse?
- Er det avklart om Claude Code eller andre agenter er tillatt, og under hvilke regler?

## Greenfield eller brownfield

Svarene på dimensjon 4 og 5 avgjør inngangsveien. Har organisasjonen aktive apper og flyter i dag, selv om det bare er noen SharePoint-liste-apper, er det brownfield, og neste steg er inventar før noe annet. Har den ingenting, eller bare et sovende standardmiljø, er det greenfield, og styringen kan designes før første app. [Greenfield eller brownfield](greenfield-vs-brownfield.md) beskriver begge løpene.

## Resultatet

Ett ark med ni rader, nivå og bevis, og en prioritert liste over de tre til fem dimensjonene som må løftes til nivå 2 før piloten. Listen blir P0 i [tiltakslisten](../verktoykasse/maler/tiltaksliste.md). Malen for arket kommer i verktøykassen i milepæl 2; inntil da er tabellen over malen.

## Neste steg

[Roller og ansvar](roller.md) for å navngi eierne. [Pilotgruppe](pilotgruppe.md) for å velge hvor dere starter.

## Kilder

- Microsoft Learn, Power Platform adoption guidance (de åtte fasene): https://learn.microsoft.com/power-platform/guidance/ (lest 2026-10-23)
- Microsoft Learn, Assess your Power Platform adoption strategy: https://learn.microsoft.com/power-platform/guidance/adoption/take-assessment (lest 2026-10-23)
- Spørsmålene bygger på discovery- og inventarfasene i en governance-metode brukt på norske tenanter i 2026, utvidet med dimensjon 9.
