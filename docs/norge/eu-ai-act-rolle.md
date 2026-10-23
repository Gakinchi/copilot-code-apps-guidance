---
title: EU AI Act, rollen som deployer
tags: [leder, arkitekt]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# EU AI Act: virksomheten er deployer, og det betyr noe konkret

**Hvem denne siden er for:** ledelsen, arkitekten og den som har ansvar for etterlevelse. Når en virksomhet tar i bruk GitHub Copilot og bygger apper med AI-hjelp, får den en rolle under EU AI Act. Siden forklarer hvilken, hva rollen krever, og fra når. Den er veiledning, ikke juridisk rådgivning; la juristene bekrefte for din virksomhet.

!!! warning "Til verifisering før du siterer datoer"
    Forordningen rulles ut i faser, og EU har diskutert justeringer av enkelte frister. Datoene under er fra forordningens tekst slik den ble vedtatt. Sjekk EU AI Act Service Desk og Microsofts Trust Center-side om EU AI Act før du setter en dato i en intern plan.

## Gjelder forordningen oss?

EU AI Act gjelder for den som tilbyr og den som bruker AI-systemer i EU-markedet, uansett hvor de holder til. For Norge gjelder forordningen gjennom EØS. Fem spørsmål avgjør hvor dypt det går:

1. **Har vi EU/EØS-eksponering?** Ansatte, kunder eller persondata i EØS. For en norsk virksomhet er svaret ja.
2. **Bruker vi AI-systemer i dag?** GitHub Copilot, Microsoft 365 Copilot, Copilot Studio-agenter, AI Builder, Azure OpenAI. Ja.
3. **Planlegger vi mer?** Ja, det er derfor du leser dette.
4. **Berører noen bruksområder Annex III?** Rekruttering, vurdering av ansatte, tilgang til vesentlige tjenester, kreditt, utdanning, kritisk infrastruktur. Hvis en app dere bygger med Copilot tar beslutninger i slike områder, er den høyrisiko, uansett at den ble skrevet fort.
5. **Møter noe AI-system sluttbrukere direkte?** En agent eller en chat i en app. Da gjelder åpenhetsplikten i artikkel 50.

## Rollen: deployer, ikke provider

Forordningen skiller mellom **provider**, den som utvikler og setter et AI-system på markedet, og **deployer**, den som bruker et AI-system i yrkesmessig sammenheng. Microsoft og GitHub er providere av Copilot. Virksomheten din er deployer når utviklerne bruker Copilot.

Appene utviklerne bygger med Copilot-hjelp er som regel ikke AI-systemer selv; de er vanlig programvare, og Copilot er verktøyet. Men en Code App som selv kaller en modell, for eksempel gjennom en connector til Azure OpenAI eller en Copilot Studio-agent, er et AI-system, og da er virksomheten deployer av den også. Legger dere en slik app ut til andre under eget navn, kan dere bli provider. Det er den grensen juristene må kjenne til.

## Hva deployer-rollen krever

| Artikkel | Hva | Gjelder fra | For oss betyr det |
|---|---|---|---|
| **Artikkel 4, AI-kompetanse** | Sørge for at ansatte som bruker eller overvåker AI-systemer har tilstrekkelig kompetanse | 2. februar 2025 | Opplæring for utviklere som bruker Copilot, for admin som styrer det, og for ledere som beslutter. Se [AI-kompetanse](../beredskap/ai-kompetanse.md) |
| **Artikkel 26, deployer-plikter for høyrisiko** | Bruke systemet etter providerens anvisning, navngitt menneskelig tilsyn, overvåke og rapportere hendelser, oppbevare logger, informere ansatte, konsekvensvurdering for grunnleggende rettigheter i visse tilfeller | 2. august 2026 | Bare hvis en app dere bygger faller i Annex III. Da er det appen, ikke Copilot, som utløser plikten |
| **Artikkel 50, åpenhet** | Brukere skal vite at de snakker med AI; AI-generert innhold skal merkes | 2. august 2026 | En Code App med chat eller agent må si det ved første kontakt |
| **Artikkel 72, markedsovervåking** | Provider overvåker etter lansering; deployer samarbeider | 2. august 2026 | Rapporteringsvei for feil i Copilot-verktøyet og i egne AI-apper |

For de fleste virksomheter som leser denne veiledningen er det **artikkel 4** som er operativ i dag. Den gjelder uavhengig av risikonivå, og den gjelder allerede.

## Det Copilot-bruken konkret krever av oss

1. **En opplæringsplan per rolle.** Utvikler: hvordan Copilot fungerer, hva den ikke vet, hvordan man reviewer det den skriver. Admin: policyene og loggene. Leder: begrensningene og risikoen. Dette er artikkel 4, og det er også det som gjør innføringen vellykket; GitHubs egen veiledning sier det samme uten å nevne forordningen.
2. **Dokumentert menneskelig kontroll i utviklingsløpet.** Review før merge, ingen push fra Copilot direkte til produksjon. Se [Review-regler](../arbeidsflyt/review-regler.md) og [Grenser](../arbeidsflyt/grenser.md). Det er ikke et lovkrav for Copilot som verktøy, men det er det første en tilsynsmyndighet vil spørre om hvis en app senere viser seg å være høyrisiko.
3. **En rutine for å klassifisere apper.** Når et team starter en ny Code App, stilles spørsmål 4 og 5 over. Svaret skrives i repoets README. Det tar to minutter og sparer en utredning.
4. **Et sted å finne providerens anvisninger.** Microsofts shared responsibility-dokumentasjon for EU AI Act og GitHubs dokumentasjon om Copilot. Lenkene står under Kilder.

## Neste steg

[GDPR og EU-datagrense](gdpr-og-eu-datagrense.md) dekker den andre forordningen som gjelder fra dag én: hvor data behandles. [AI-kompetanse](../beredskap/ai-kompetanse.md) gjør artikkel 4 om til en opplæringsplan.

## Kilder

- EUR-Lex, forordning (EU) 2024/1689 (AI Act): https://eur-lex.europa.eu/eli/reg/2024/1689/oj (lest 2026-10-23)
- EU AI Act Service Desk: https://ai-act-service-desk.ec.europa.eu/ (til verifisering av frister)
- Microsoft Trust Center, EU AI Act: https://www.microsoft.com/trust-center/compliance/eu-ai-act (lest 2026-10-23; sjekk innholdet før du siterer detaljer)
- Innholdet bygger på EU AI Act-referansen i en governance-metode brukt på norske tenanter i 2026 (deployer-rollen, screening-spørsmålene, artikkeloversikten).
