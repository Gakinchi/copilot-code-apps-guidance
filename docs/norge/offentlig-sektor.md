---
title: Offentlig sektor
tags: [leder, arkitekt]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Offentlig sektor: det som kommer i tillegg

**Hvem denne siden er for:** ledelsen og arkitekten i en statlig eller kommunal virksomhet, og konsulenten som skal hjelpe dem. Alt i resten av veiledningen gjelder også her. Denne siden tar det som kommer i tillegg: forvaltningslovens krav til begrunnelse og innsyn, Digdirs råd for ansvarlig KI, den norske KI-loven, NSMs grunnprinsipper, og anskaffelsesreglene når lisenser og kreditter skal kjøpes.

!!! warning "Til verifisering"
    Digdir-sidene under ble funnet i søk 2026-10-23, men kunne ikke hentes i sin helhet fra denne maskinen. Lenkene og titlene er bekreftet; innholdet er gjengitt etter søkesammendrag og skal leses på kilden før det siteres i et internt dokument. Regjeringens og Datatilsynets sider er hentet og lest.

## Hva Copilot og Code Apps er i en forvaltningskontekst

To ting må holdes fra hverandre, og de har forskjellige regler:

| Hva | Hva det er | Regler som slår inn |
|---|---|---|
| GitHub Copilot brukt av utviklere | Et verktøy i utviklingen. Koden som kommer ut, er virksomhetens kode | EU AI Act (virksomheten er deployer av et GPAI-basert system, se [EU AI Act-rolle](eu-ai-act-rolle.md)), GDPR for det utviklerne sender til modellen, arkivloven hvis prompter og svar er saksdokumenter |
| En Code App som bruker AI i runtime | En app som selv kaller en modell (for eksempel via en connector til Azure OpenAI) for å gi innbyggere eller saksbehandlere svar | Alt over, pluss forvaltningslovens krav til begrunnelse, krav om åpenhet mot innbyggeren, og mulig høyrisiko-klassifisering under KI-forordningen hvis appen påvirker vedtak |

De fleste Code Apps i piloten er av den første typen: interne verktøy skrevet med Copilot, uten AI i runtime. Da er det Copilot-bruken som må vurderes, ikke appen. Si det eksplisitt i risikoregisteret, så ingen vurderer en timeregistreringsapp som et høyrisikosystem.

## Den norske KI-loven

Regjeringen gjennomfører EUs KI-forordning i norsk rett gjennom en egen lov om kunstig intelligens. Høringen sommeren 2025 foreslo Nasjonal kommunikasjonsmyndighet (Nkom) som koordinerende KI-tilsyn, en nasjonal KI-sandkasse hos Digdir, og ikrafttredelse fra sensommeren 2026, samtidig med hoveddelen av forordningen i EU. EU vedtok endringer i forordningen i juli 2026 som utsetter kravene til høyrisikosystemer til desember 2027 og august 2028. Regjeringen sender derfor loven på ny høring høsten 2026, med ambisjon om å fremme den for Stortinget våren 2027.

For virksomheten betyr det:

- Pliktene som gjelder fra første Copilot-sete, AI-kompetanse (artikkel 4) og åpenhet, endres ikke av utsettelsen. Se [AI-kompetanse](../beredskap/ai-kompetanse.md).
- Klassifiseringen av egne apper gjøres nå, men fristene for høyrisiko-kravene er flyttet. Noter begge datoene i styringsplanen.
- Følg høringen høsten 2026; det er der tilsynsstrukturen fastsettes. Noen i virksomheten bør eie den oppgaven.

## Digdirs råd for ansvarlig KI

Digdir har en veiledning for ansvarlig bruk og utvikling av kunstig intelligens i offentlig sektor, lansert som «åpen beta», med råd om ansvar, likebehandling, åpenhet og risikovurdering, og en egen del om ansvarlig anskaffelse og bruk av generativ KI. Veiledningen skiller mellom rollene som tilbyder og bruker (deployer) etter KI-forordningen, og det er bruker-sporet som gjelder for Copilot.

Bruk den slik:

1. Les delen om generativ KI før piloten, og kryss av mot [Copilot-policyene](../sikkerhet/copilot-policyer.md). Der Digdir ber om noe policyene ikke dekker, legg det i [tiltakslisten](../verktoykasse/maler/tiltaksliste.md).
2. Bruk risikovurderingsdelen som sjekkliste for [risikoregisteret](../strategi/risikoregister.md). Radene R1, R3 og R8 er de som angår forvaltningen mest.
3. Følg KI Norge, det nasjonale senteret i Digdir, for sandkassen og for oppdaterte råd.

## Datatilsynet

Datatilsynets sandkasse for kunstig intelligens tar inn både offentlige og private virksomheter, og rapportene derfra er den beste norske kilden til hvordan personvernregelverket faktisk anvendes på KI. To er direkte relevante:

- **Copilot og integrert KI** (juni 2025, med NTNU): hvordan en virksomhet blir «Copilot-klar». Handler om Microsoft 365 Copilot, men spørsmålene om tilgangsstyring, databehandleravtale og hva som sendes til modellen er de samme for GitHub Copilot. Les den sammen med [GDPR og EU-datagrense](gdpr-og-eu-datagrense.md).
- **Samtaleroboter på offentlige virksomheters nettsider** (mai 2026, med Helsedirektoratet): slike løsninger er ikke anonyme, samtykke er et mulig grunnlag, og tiltakene må testes før lansering. Gjelder Code Apps med AI i runtime rettet mot innbyggere.

## NSMs grunnprinsipper

NSMs grunnprinsipper for IKT-sikkerhet (versjon 2.1, 2024) er rammen de fleste offentlige virksomheter måler seg mot. De fire kategoriene passer rett inn i veiledningen:

| NSM-kategori | Hvor i veiledningen |
|---|---|
| Identifisere og kartlegge | [Modenhetsvurdering](../planlegg/modenhetsvurdering.md), [Reaktiv styring](../styring/reaktiv-styring.md) (inventaret) |
| Beskytte og opprettholde | [Identitet og tilgang](../sikkerhet/identitet-tilgang.md), [Hemmeligheter](../sikkerhet/hemmeligheter.md), [DLP og Code Apps](../sikkerhet/dlp-og-code-apps.md) |
| Oppdage | [Copilot-metrikker](../maaling/copilot-metrics.md), audit log i [Copilot-policyer](../sikkerhet/copilot-policyer.md) |
| Håndtere og gjenopprette | Hendelsesrutinen i [Reaktiv styring](../styring/reaktiv-styring.md) |

Skal virksomheten dokumentere etterlevelse, er det enkleste å legge NSM-prinsippnummeret inn som en kolonne i tiltakslisten.

## Anskaffelse

Copilot-seter og Power Apps-lisenser er anskaffelser. For statlige virksomheter går de normalt gjennom eksisterende rammeavtaler for Microsoft-lisenser; GitHub-lisenser er ikke alltid dekket av samme avtale, og må sjekkes. Pay-as-you-go for Power Apps og premium requests i Copilot er forbruksbasert og trenger et budsjettak. [Lisensmodell](../strategi/lisensmodell.md) har tallene; anskaffelsesregelverket avgjør prosessen.

Konsulentbistand til piloten er en egen anskaffelse. Krev at leverandøren leverer i virksomhetens egen GitHub-organisasjon og egne miljøer, ikke i sine, slik at inventaret og repoene er virksomhetens fra dag én.

## Arkiv og innsyn

Prompter og svar fra Copilot er normalt ikke saksdokumenter; de er arbeidsverktøy, på linje med utkast i en editor. Koden som committes, er det. En Code App som brukes i saksbehandling, produserer dokumenter som arkiveres etter vanlige regler, uavhengig av hvordan appen ble skrevet. Få arkivansvarlig til å bekrefte dette for virksomheten, og skriv det ned.

## Neste steg

[EU AI Act-rolle](eu-ai-act-rolle.md) for forordningen i detalj. [GDPR og EU-datagrense](gdpr-og-eu-datagrense.md) for dataflyten. [Risikoregister](../strategi/risikoregister.md) for å føre inn det denne siden har lagt til.

## Kilder

- Regjeringen, Lov om kunstig intelligens i Norge sendes nå på høring (2025-06-30): https://www.regjeringen.no/no/aktuelt/lov-om-kunstig-intelligens-i-norge-sendes-na-pa-horing/id3113732/ (lest 2026-10-23)
- Regjeringen, Tung vil sende KI-loven med endringer på høring (2026-08-04): https://www.regjeringen.no/no/aktuelt/tung-vil-sende-ki-loven-med-endringer-pa-horing/id3169693/ (lest 2026-10-23)
- Digdir, Veiledning for ansvarlig bruk og utvikling av kunstig intelligens: https://www.digdir.no/kunstig-intelligens/veiledning-ansvarlig-bruk-og-utvikling-av-kunstig-intelligens/4601 (funnet 2026-10-23, ikke hentet)
- Digdir, Ansvarlig anskaffelse og bruk av generativ kunstig intelligens i offentlig sektor: https://www.digdir.no/kunstig-intelligens/ansvarlig-anskaffelse-og-bruk-av-generativ-kunstig-intelligens-i-offentlig-sektor/4670 (funnet 2026-10-23, ikke hentet)
- Datatilsynet, Sandkasse for kunstig intelligens: https://www.datatilsynet.no/regelverk-og-verktoy/sandkasse-for-kunstig-intelligens/ (lest 2026-10-23)
- Datatilsynet, Datatilsynet forklarer Copilot og integrert KI (2025-06-24): https://www.datatilsynet.no/aktuelt/aktuelle-nyheter-2025/datatilsynet-forklarer-copilot-og-integrert-ki/ (lest 2026-10-23)
- Datatilsynet, Samtaleroboter på offentlige virksomheters nettsider (2026-05-27): https://www.datatilsynet.no/aktuelt/aktuelle-nyheter-2026/samtaleroboter-pa-offentlige-virksomheters-nettsider/ (lest 2026-10-23)
- NSM, Grunnprinsipper for IKT-sikkerhet 2.1: https://nsm.no/grunnprinsipper-ikt (lest 2026-10-23)
