---
title: Seks måter å bygge en app
tags: [leder, arkitekt, utvikler]
verifisert: 2026-10-23
kilde: PÅ LEARN
---

# Seks måter å bygge en app i 2026, og når du velger hva

**Hvem denne siden er for:** alle som skal velge verktøy for en ny app, eller forklare valget for andre. Code Apps er ett av seks valg i Power Platform. Velger du det av riktig grunn, blir resten av veiledningen enkel. Velger du det fordi utviklerne liker React, får du en app som burde vært en canvas-app, eller omvendt.

## De seks måtene

| Apptype | Når den brukes | Utviklerstil | Hvem passer |
|---|---|---|---|
| **Canvas Apps** | Skjema over layout, raske maker-apper | Dra-og-slipp og Power Fx i Power Apps Studio | Power Platform-makere, ikke kodere |
| **Model-driven Apps** | Data først, rikt Dataverse-skjema | Konfigurasjon i Studio, lite kode | Enterprise-team som eier datamodellen |
| ↳ *Generative Pages* | *Ny side inne i en model-driven app, AI-generert React* | *Naturlig språk, eller kode via Copilot CLI / Claude Code* | *Team som vil ha moderne sider i en eksisterende app* |
| **Power Pages** | Eksterne nettsteder og kundeportaler | Lavkode, AI-generert kode, Code Sites i React/Angular/Vue | Når sluttbrukerne er utenfor din Entra-organisasjon |
| **Vibe** (vibe.powerapps.com) | Fra idé til app på minutter, plan, data og UI samlet | Naturlig språk, prompt først | Prototyping, demo, små linje-apper i fart |
| **Code Apps** | Full kontroll, kompleks UI, team som jobber kodeførst | VS Code, Vite, TypeScript, `pa`-CLI | Utviklere med React-investering eller kompleks logikk |

Copilot Managed Runtime er en sjuende vei, i offentlig forhåndsvisning, med eget repo per app og Microsoft 365 admin center som hjem. Se [Produktene, hva er hva](produktene.md). Den er ikke med i tabellen fordi denne veiledningen handler om Code Apps.

## Tre familier, ikke seks produkter

Tenk i tre kolonner i stedet for seks rader. Det er en tankehjelp, ikke et regelverk.

| Lavkode | Hybrid | Prokode |
|---|---|---|
| Studio først, ingen kode | AI genererer, kode tar over | Du skriver, agenter hjelper |
| Canvas Apps, Model-driven Apps, Power Pages | Generative Pages, Vibe | Code Apps |
| **Velg når** makeren eier hele bygget | **Velg når** du vil ha fart fra en prompt, men eie diff-en etterpå | **Velg når** UI-et er komplekst eller teamet bor i VS Code |

GitHub Copilot hører hjemme i de to kolonnene til høyre. I lavkode-kolonnen finnes Copilot inne i Studio, men det er et annet produkt og en annen lisens enn GitHub Copilot, og det dekkes ikke her.

## Spørsmålene som avgjør valget

Still dem i denne rekkefølgen. Det første «ja» avgjør som regel.

1. **Er sluttbrukerne utenfor organisasjonen?** Da er det Power Pages, uansett hvor god koden din er.
2. **Eier et Dataverse-skjema appen?** Mange tabeller, relasjoner, forretningsregler, sikkerhetsroller på radnivå: model-driven, eventuelt med Generative Pages for de sidene som trenger moderne UI.
3. **Er det et skjema eller en liste over en kjent datakilde, og eier makeren det selv?** Canvas.
4. **Er det en idé som skal vises fram i morgen?** Vibe, og bestem etterpå om den skal leve videre som Code App (eksporter og åpne i VS Code) eller skrives om.
5. **Krever UI-et et rammeverk, komponentbibliotek, egen state-håndtering eller testing som Studio ikke gir?** Code Apps.
6. **Har teamet allerede en React-, Vue- eller Angular-kodebase de vil gjenbruke?** Code Apps. Alle Vite-rammeverkene er testet; se [Rammeverk](../arbeidsflyt/rammeverk.md).

!!! warning "Det Code Apps ikke løser"
    En Code App kjører i brukerens nettleser med brukerens rettigheter. Den har ingen server-side der forretningsregler kan håndheves utenfor brukerens rekkevidde. Regler som må håndheves, hører hjemme i Dataverse (sikkerhetsroller, plug-ins), i en Power Automate-flyt eller i en Azure Function. Det gjelder uansett hvor flink Copilot er til å skrive frontend-kode.

## Disiplinen som overlever verktøyskiftet

AI endrer hvor fort en app blir til, ikke hva som gjør den riktig. Rekkefølgen er den samme som før: discovery, velg apptype, governance og ALM fra dag én. Connector-overflaten teller fortsatt; under ti connectorer per app er en god rettesnor, og den gjelder også når en agent legger dem til for deg.

## Sjekk status og geografi før du lover noe

Produktene endrer status fort, og tilgjengelighet i EU henger etter i perioder. Tabellen under er et øyeblikksbilde; verifiser på Microsoft Learn før et kundeløfte.

| Produkt | Status 2026-10-23 | EU / Norge |
|---|---|---|
| Canvas, Model-driven, Power Pages | Generelt tilgjengelig | Ja |
| Generative Pages | Generelt tilgjengelig via kodegenerering | Ja |
| Vibe (vibe.powerapps.com) | Forhåndsvisning | Verifiser |
| Code Apps | Generelt tilgjengelig | Ja, verifiser at miljøet har Code Apps slått på |
| Copilot Managed Runtime | Offentlig forhåndsvisning | Verifiser, og les [GDPR og EU-datagrense](../norge/gdpr-og-eu-datagrense.md) |

## Neste steg

Ledelsen går videre til [Forretningscase](../strategi/forretningscase.md). Arkitekten går til [Modenhetsvurdering](../planlegg/modenhetsvurdering.md). Utvikleren går til [Oppsett av maskinen](../arbeidsflyt/oppsett-maskin.md).

## Kilder

- Microsoft Learn, Power Apps code apps overview: https://learn.microsoft.com/power-apps/developer/code-apps/overview (lest 2026-10-23)
- Microsoft Learn, Create and edit generative pages with AI code generation tools: https://learn.microsoft.com/power-apps/maker/model-driven-apps/generative-page-external-tools (lest 2026-10-23)
- Microsoft Learn, Get started with the Power Pages plugin for GitHub Copilot CLI and Claude Code: https://learn.microsoft.com/power-pages/configure/create-code-site-using-claude-code (lest 2026-10-23)
- Tabellen bygger på foredraget «Power Platform: la oss gjøre det konkret» (Dennis Chi, 2026) og en code-first-workshop holdt for en norsk nettoperatør.
