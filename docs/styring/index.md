---
title: Styring
tags: [arkitekt]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Styring

**Hvem denne delen er for:** arkitekten og Power Platform-administratoren. Styring er der Code Apps skiller seg minst fra resten av Power Platform: de samme miljøene, de samme environment groups, den samme DLP-en og de samme sikkerhetsrollene gjelder. Det nye er én bryter per miljø, og at utviklerne jobber fra terminalen i stedet for Studio, slik at feil i styringen viser seg som kommandoer som feiler.

| Side | Svarer på |
|---|---|
| [Soner](soner.md) | Hvilke miljøer som er for hva, og hva som er tillatt i hver sone, med egne rader for Code Apps og AI-assistert bygging |
| [Miljøer og grupper](miljoer-og-grupper.md) | Managed Environments, environment groups, routing og personlige utviklermiljøer |
| [Hvem får bygge](hvem-faar-bygge.md) | Bryteren «Enable code apps», maker-roller og hvordan du holder piloten lukket |
| [Copilot i skala](copilot-i-skala.md) | GitHub-siden av styringen: organisasjon, enterprise, seter og policy-arv |
| [Reaktiv styring](reaktiv-styring.md) | Det du gjør etter lansering: inventar, drift, foreldreløse apper |
| [Beslutninger (ADR)](beslutninger.md) | Hvorfor veiledningen anbefaler det den gjør |

Rekkefølgen er lagd med vilje: soner først, så mekanismene som håndhever dem, så bryteren for Code Apps, så GitHub-siden, så det som skjer etterpå.
