---
title: Forretningscase
tags: [leder]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Forretningscase: hvorfor Copilot og Code Apps sammen

**Hvem denne siden er for:** ledelsen som skal avgjøre om dette er verdt å starte, og den som skal skrive beslutningsgrunnlaget. Siden sier hva kombinasjonen gir, hva den erstatter, hvem den er for og hva den ikke er. Tallene som trengs for et faktisk business case kommer fra [KPI-er](kpier.md) og piloten, ikke fra denne siden.

## Problemet

De fleste virksomheter har to grupper som bygger apper, og en vegg mellom dem. Makerne bygger raskt i Power Apps Studio, innenfor plattformens styring, men treffer taket når appen trenger komplekst UI, egen logikk eller testing. Utviklerne bygger uten tak, i React og TypeScript, men utenfor plattformen, og må selv løse identitet, dataintegrasjon, deling, logging og tilgangsstyring, som plattformen allerede har.

AI-verktøy gjør begge gruppene raskere, og gjør veggen verre: flere apper, fortere, på begge sider, med mindre oversikt over hvor de kjører, hva de kobler seg til og hvem som bruker dem.

## Det kombinasjonen gir

**Code Apps** lar utviklerne bygge med sine egne verktøy og publisere til Power Platform, som gir appen Entra-innlogging, connectorer til data virksomheten allerede har, DLP, deling, Conditional Access og telemetri i admin-senteret. Utvikleren slipper å bygge det selv; admin slipper en app utenfor styringen.

**GitHub Copilot** gjør utvikleren raskere på nettopp den typen arbeid Code Apps består av: scaffold, datakoblinger, typede tjenester, UI-komponenter, tester. Med Microsofts plugin kjører Copilot CLI-kommandoene for utvikleren, fra beskrivelse til publisert app, og plattformen håndhever reglene uansett hva agenten foreslo.

Sammen gir de tre ting:

1. **Utviklere inn i plattformen uten å ta fra dem verktøyene.** Samme VS Code, samme Git, samme rammeverk, pluss en CLI og en plugin.
2. **Fart med styring intakt.** DLP, miljøer, lisenser og deling gjelder Code Apps som alt annet; se [DLP og Code Apps](../sikkerhet/dlp-og-code-apps.md). Det er ikke en egen plattform å styre.
3. **Én vei fra idé til produksjon.** Prototype i et personlig miljø, solution og connection references i teammiljøet, pipeline til produksjon. Copilot er med hele veien; plattformen bestemmer hva som får kjøre hvor.

## Hva det erstatter

| Før | Med Copilot og Code Apps |
|---|---|
| Egne React-apper hostet utenfor plattformen, med egen innlogging og egen integrasjon mot Dataverse eller SharePoint | Samme app publisert til Power Platform, med plattformens identitet og connectorer |
| Canvas-apper som har vokst forbi det Studio er laget for | Samme datakilder, fullt rammeverk, tester og versjonskontroll |
| Separate Azure Functions for logikk som bare trengte en flyt eller en Dataverse-handling | Flyter og Dataverse-handlinger kalt fra appen gjennom CLI-en |
| Utviklere som skriver all plattformkoblingen for hånd | Copilot skriver den, typet, fra connectorens beskrivelse |

Det erstatter ikke canvas-apper for makere, model-driven apps for datatunge løsninger, eller Power Pages for eksterne brukere. [Seks måter å bygge en app](../start/seks-mater.md) viser grensene.

## Hvem det er for

- Virksomheter med utviklere som allerede bygger linjeapper, og som vil ha dem inn under plattformens styring.
- Virksomheter med Power Platform-makere som har truffet taket, og utviklere som kan ta over uten å starte på nytt.
- IT-avdelinger som allerede styrer Power Platform og vil at AI-assistert utvikling skal skje innenfor den styringen, ikke ved siden av.

Det er ikke for virksomheter uten utviklere; da er Copilot Studio, vibe og canvas-apper riktige verktøy, og denne veiledningen er feil dokument.

## Hva det koster

Tre poster, i synkende rekkefølge etter hva som pleier å bli undervurdert:

1. **Tid til opplæring og nye vaner.** Utviklere som skal jobbe med en agent i stedet for en autofullføring, admin som skal lære Code Apps-bryteren og Copilot-policyene, ledere som skal lære å lese metrikkene. [AI-kompetanse](../beredskap/ai-kompetanse.md) gjør det til en plan.
2. **Lisenser.** Copilot-seter for utviklerne, Power Apps-lisenser for brukerne, Managed Environments for miljøene. [Lisensmodell](lisensmodell.md).
3. **Styring som må settes opp én gang.** Miljøer, environment groups, DLP, policyer, instruksjonsfiler. [Plan 30-90-180](30-90-180.md) viser at det meste skjer de første 30 dagene.

## Hva som kan gå galt

Kode og prompter som forlater virksomheten, hemmeligheter i prompter, apper bygget på preview-funksjoner som endrer seg, og regulatoriske plikter som ingen har tatt eierskap til. [Risikoregister](risikoregister.md) gir hver av dem en eier.

## Slik vet vi om det virker

Mål før piloten starter, mål under, og vurder etter 90 dager mot tall ledelsen har sett på forhånd: tid fra oppgave til første fungerende versjon, andel Copilot-seter i bruk, antall Code Apps i inventaret, antall apper på solutions, support-spørsmål. [KPI-er](kpier.md) definerer dem; [Pilotevaluering](../maaling/pilot-evaluering.md) er beslutningspunktet.

## Neste steg

[Lisensmodell](lisensmodell.md) for budsjettet, så [Risikoregister](risikoregister.md).

## Kilder

- Microsoft Learn, Power Apps code apps overview, «Key features», «Managed platform capability support»: https://learn.microsoft.com/power-apps/developer/code-apps/overview (lest 2026-10-23)
- Microsoft Learn, Quickstart: Build a code app with GitHub Copilot, «What just happened?»: https://learn.microsoft.com/power-apps/developer/code-apps/how-to/quickstart-github-copilot (lest 2026-10-23)
- GitHub Docs, Driving the downstream impact of GitHub Copilot: https://docs.github.com/en/copilot/tutorials/roll-out-at-scale (lest 2026-10-23)
- Erfaringen bak siden: code-first-workshops med norske virksomheter i 2026, der team gikk fra idé til fungerende app på fire timer med Copilot CLI og Code Apps.
