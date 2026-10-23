---
title: Drift
tags: [arkitekt, utvikler]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Drift

**Hvem denne delen er for:** arkitekten som skal sette opp ALM og pipeline, utvikleren som skal leve med dem, og administratoren som skal følge med etterpå. Drift for Code Apps er Power Platform-ALM med én ny mekanisme, `pa app push`, og ett nytt krav: koden lever i Git, ikke i plattformen.

| Side | Svarer på |
|---|---|
| [ALM for Code Apps](alm-for-code-apps.md) | Solutions, connection references, environment variables, pipelines, og hva Code Apps ikke støtter |
| [CI/CD](ci-cd.md) | GitHub Actions som bygger og publiserer med service principal, og hvorfor utviklere ikke pusher til prod |
| [Overvåking og kapasitet](overvaking-og-kapasitet.md) | Monitor, Usage, Dataverse-kapasitet, og hvor Copilot-tallene kommer inn |
| [Oppdateringstakt](oppdateringstakt.md) | Hvordan følge et produkt som endrer seg ukentlig uten at interne guider blir feil |

Den korte versjonen: legg appen i en solution fra første push i sone 2, bruk connection references og environment variables for alt som varierer, la pipelinen publisere i sone 3, og ha én person som følger produktendringer.
