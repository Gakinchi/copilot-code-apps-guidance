---
title: Læringssti
tags: [leder, arkitekt, utvikler]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Læringssti per rolle

**Hvem denne siden er for:** CoE-lederen som setter opp opplæringen, og hver enkelt som skal vite hva som forventes av dem. Stien er per rolle, fordi en leder og en utvikler trenger forskjellige ting, og fordi artikkel 4 i EU AI Act gjelder dem begge.

## Utvikler

| Trinn | Innhold | Form | Tid | Bevis |
|---|---|---|---|---|
| 1. Grunnlag | Hva en Code App er, hva Power Platform gjør for den, hva Copilot gjør og ikke gjør | [Produktene](../start/produktene.md), [Seks måter](../start/seks-mater.md) | 1 time lesing | |
| 2. Maskinen | Oppsett, innlogging, plugin | [Oppsett av maskinen](../arbeidsflyt/oppsett-maskin.md), [Forutsetninger](forutsetninger.md) | 1 time | `pa auth status` og `copilot plugin list` viser riktig |
| 3. Første app | Hurtigstarten, selv, fra tom mappe | [Hurtigstart](../arbeidsflyt/hurtigstart.md) | 2 timer | App publisert i eget utviklermiljø |
| 4. Workshop | Fra idé til fungerende app med teamet | [Workshop-oppsett](workshop-oppsett.md) | 1 dag | App i teamets miljø, PR reviewet |
| 5. Reglene | Daglig loop, review, grenser, instruksjonsfil | [Daglig loop](../arbeidsflyt/daglig-loop.md), [Review-regler](../arbeidsflyt/review-regler.md), [Grenser](../arbeidsflyt/grenser.md) | 2 timer | Første PR med plan og avvik dokumentert |
| 6. Data | Delegering, connector-grenser, connection references | [Datakilder](../arbeidsflyt/datakilder.md), [ALM](../drift/alm-for-code-apps.md) | 2 timer | App med connection reference og environment variable |
| 7. AI-kompetanse | Hva modellen gjør med det du sender, hva den ikke vet, når du stopper | [AI-kompetanse](ai-kompetanse.md), [Dataflyt til modellen](../sikkerhet/dataflyt-til-modellen.md) | 1 time | Gjennomført i læringsplattformen |

Trinn 1 til 3 før workshopen. Trinn 5 til 7 innen 30 dager etter.

## Arkitekt og CoE

| Trinn | Innhold | Form | Tid |
|---|---|---|---|
| 1 | Hele utviklerstien, for å vite hva utviklerne møter | Over | 1 dag |
| 2 | Soner, grupper, bryteren, DLP | [Styring](../styring/index.md), [DLP og Code Apps](../sikkerhet/dlp-og-code-apps.md) | 3 timer |
| 3 | Copilot-policyer og GitHub-strukturen | [Copilot-policyer](../sikkerhet/copilot-policyer.md), [Copilot i skala](../styring/copilot-i-skala.md) | 2 timer |
| 4 | Måling og inventar | [Måling](../maaling/index.md) | 2 timer |
| 5 | Norske forhold | [Norge](../norge/index.md) | 2 timer |
| 6 | Modenhetsvurderingen, gjennomført | [Modenhetsvurdering](../planlegg/modenhetsvurdering.md) | En formiddag med de riktige folkene |

## Leder

| Trinn | Innhold | Form | Tid |
|---|---|---|---|
| 1 | Hva produktene er, og hva som er annerledes | [Start her: leder](../start/leder.md) | 20 min |
| 2 | Forretningscase, risiko, lisens | [Strategi](../strategi/index.md) | 1 time |
| 3 | Rollen under EU AI Act, og at opplæring er en plikt | [EU AI Act-rolle](../norge/eu-ai-act-rolle.md) | 30 min |
| 4 | Beslutningslisten og evalueringen | [Plan 30-90-180](../strategi/30-90-180.md), [Pilotevaluering](../maaling/pilot-evaluering.md) | 30 min |

Ledere trenger ikke bygge en app. De trenger å ha sett én bli bygget: 30 minutter på workshopen, i rommet.

## Admin (Power Platform og GitHub)

Admin følger arkitektstien trinn 2 til 4, og gjør i tillegg oppsettet i [Miljøer og grupper](../styring/miljoer-og-grupper.md) og [Copilot i skala](../styring/copilot-i-skala.md) i en test-tenant før pilot.

## Champion

Champion-en har gjort utviklerstien og er den første som svarer i kanalen. I tillegg: [Fellesskap](../fellesskap/index.md), og én time i uken satt av til å hjelpe andre, synlig i kalenderen.

## Hvordan det dokumenteres

Ett ark med navn, rolle, trinn og dato gjennomført. Det er samtidig dokumentasjonen av artikkel 4-plikten, og KPI K13 i [KPI-arket](../maaling/kpi-ark.md). Læringsplattformen kan holde det, eller et regneark; det viktige er at det finnes og er oppdatert.

## Neste steg

[Workshop-oppsett](workshop-oppsett.md) for trinn 4. [AI-kompetanse](ai-kompetanse.md) for trinn 7.

## Kilder

- GitHub Docs, Roll out GitHub Copilot at scale, Enable developers: https://docs.github.com/en/copilot/tutorials/roll-out-at-scale (lest 2026-10-23)
- Microsoft Learn, Power Platform adoption, Readiness: https://learn.microsoft.com/power-platform/guidance/adoption/training-strategy (lest 2026-10-23)
- Stien bygger på workshoper og læringsløp kjørt for norske utviklerteam i 2026.
