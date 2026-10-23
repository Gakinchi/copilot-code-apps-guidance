---
title: GDPR og EU-datagrense
tags: [leder, arkitekt]
verifisert: 2026-10-23
kilde: GITHUB DOCS
---

# GDPR og EU-datagrense: hvor kode, prompter og appdata behandles

**Hvem denne siden er for:** personvernombudet, sikkerhetsansvarlig og ledelsen. Spørsmålet kommer alltid: «Hvor havner koden vår når utviklerne bruker Copilot?» Svaret er annerledes i 2026 enn det var i 2025, og det er forskjellig for de to produktene. Siden er veiledning, ikke juridisk rådgivning.

## To datastrømmer, to produkter

| | GitHub Copilot | Power Apps Code Apps |
|---|---|---|
| Hva sendes | Prompten, utdrag av koden og filene agenten leser som kontekst, kommandoutdata agenten får se | Appens egne data går gjennom connectorer, som i canvas-apper; selve appkoden lastes opp som kompilert bunt |
| Hvor behandles det | Modellendepunkter valgt av GitHub, i den regionen organisasjonen har satt | Power Platform-miljøets region (for Norge: EU) |
| Hvem er behandler | GitHub (Microsoft-datterselskap) | Microsoft |
| Styres av | GitHub-organisasjonens Copilot-innstillinger og databehandleravtalen med GitHub | Miljøets region, DLP og databehandleravtalen med Microsoft |

## GitHub Copilot og EU Data Boundary, status 2026

Fra 1. mai 2026 kan en organisasjon velge **EU-dataresidens for Copilot**. Da skjer all modellinferens og tilhørende databehandling innenfor EU Data Boundary, som omfatter EU-landene og EFTA, altså Norge, Island, Liechtenstein og Sveits. Alle generelt tilgjengelige Copilot-funksjoner er dekket, Copilot CLI inkludert, og modellene fra OpenAI og Anthropic er tilgjengelige fra regionale endepunkter. Google-modeller er ikke tilgjengelige med dataresidens. Prisen er en modellmultiplikator som er 10 prosent høyere.

!!! warning "Til verifisering i egen avtale"
    Kunngjøringen sier at enterprise- og organisasjonsadministratorer slår på dataresidens i Copilot-innstillingene. Hvilke GitHub-planer som kvalifiserer, og om det forutsetter GitHub Enterprise Cloud med dataresidens på ghe.com, må bekreftes mot GitHub Docs og avtalen deres før du lover det til personvernombudet. Sjekk også hva «associated data» omfatter i deres databehandleravtale.

Uten dataresidens slått på behandles forespørslene der GitHub har kapasitet, som kan være utenfor EØS. Da trenger overføringen et overføringsgrunnlag etter GDPR kapittel V, typisk EU-kommisjonens standardkontrakter via GitHubs databehandleravtale, og det er den vurderingen personvernombudet gjør.

## Hva GitHub beholder

GitHub Copilot for Business og Enterprise lagrer ikke prompter og forslag for modelltrening. Hva som beholdes for drift, feilsøking og misbruksdeteksjon, og hvor lenge, står i GitHubs dokumentasjon og i Trust Center. Les den sammen med personvernombudet; den er oppdatert oftere enn denne siden.

!!! note "Det prompten inneholder, er ditt ansvar"
    Databehandleravtalen regulerer hva GitHub gjør med dataene. Den regulerer ikke hva utviklerne limer inn. Persondata i en prompt, for eksempel en eksportert kundeliste brukt som testdata, er en behandling virksomheten er ansvarlig for. Det er R1 i [risikoregisteret](../strategi/risikoregister.md), og det løses med opplæring og content exclusions, ikke med avtalen.

## Code Apps og Power Platform

Power Platform i et EU-miljø er innenfor Microsofts EU Data Boundary-forpliktelse for de tjenestene som er omfattet. En Code App endrer ikke det: dataene går gjennom connectorene, under brukerens identitet, og lagres der de alltid har vært lagret. Den kompilerte appen ligger på et offentlig endepunkt uten IP-begrensning; derfor skal appen ikke bygge inn sensitive data, og Conditional Access brukes for å begrense hvem som kan åpne den.

To ting personvernombudet bør vite om Code Apps spesielt:

1. **Samtykkedialogen.** Første gang en bruker åpner en Code App, vises hvilke connectorer appen bruker, og brukeren samtykker. Admin kan undertrykke dialogen for Microsoft-connectorer. Det er en designbeslutning som bør dokumenteres.
2. **Telemetri.** Appens bruk og helse flyter til Power Platform admin center. Det er plattformens egen telemetri, under samme avtale som resten av Power Platform.

## Et annet produkt, en annen vurdering

Copilot Managed Runtime bruker Copilot Credits og modeller som kan ligge utenfor EU Data Boundary avhengig av tjeneste; EU/EFTA-tenanter har egne brytere for det. Det produktet dekkes ikke her. Vurder det separat hvis noen i virksomheten prøver det.

## Spørsmålene til leverandørene

Til GitHub, før piloten:

1. Hvilke planer og kontotyper kvalifiserer for Copilot-dataresidens i EU, og hva krever det av vår GitHub-konto?
2. Hva omfatter «associated data» som holdes i regionen, og hva holdes utenfor?
3. Hvilke data beholdes for drift og misbruksdeteksjon, hvor lenge, og hvor?
4. Hvilket overføringsgrunnlag gjelder for det som eventuelt behandles utenfor EØS?

Til Microsoft, om Power Platform:

1. Er alle tjenestene en Code App bruker (Power Apps, connectorene vi velger, telemetri) omfattet av EU Data Boundary for vår tenant?
2. Hvilke connectorer i vår DLP-policy sender data til tjenester utenfor EØS?

## Neste steg

[Dataflyt til modellen](../sikkerhet/dataflyt-til-modellen.md) viser teknisk hva som forlater maskinen under utvikling. [Copilot-policyer](../sikkerhet/copilot-policyer.md) viser innstillingene som styrer det.

## Kilder

- GitHub Changelog, Copilot data residency in US + EU and FedRAMP compliance now available, 13. april 2026 (oppdatert 24. april): https://github.blog/changelog/2026-04-13-copilot-data-residency-in-us-eu-and-fedramp-compliance-now-available (lest 2026-10-23)
- GitHub, Enterprise Cloud with data residency: https://github.com/enterprise/data-residency (lest 2026-10-23)
- GitHub Docs, Content exclusion: https://docs.github.com/en/copilot/concepts/security-governance-and-network-settings/content-exclusion (lest 2026-10-23)
- Microsoft Learn, Power Apps code apps system configuration (offentlig endepunkt, Conditional Access): https://learn.microsoft.com/power-apps/developer/code-apps/system-limits-configuration (lest 2026-10-23)
- Microsoft, EU Data Boundary: https://learn.microsoft.com/privacy/eudb/eu-data-boundary-learn (til verifisering mot egen tenant)
- Datatilsynet, overføring av personopplysninger til tredjeland: https://www.datatilsynet.no/ (til verifisering; lenk til konkret side når den er hentet)
