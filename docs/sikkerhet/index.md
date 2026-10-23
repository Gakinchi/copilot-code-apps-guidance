---
title: Sikkerhet
tags: [arkitekt, leder]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Sikkerhet

**Hvem denne delen er for:** arkitekten, sikkerhetsansvarlig og personvernombudet. Sikkerheten har to sider som må ses sammen: hva GitHub Copilot sender ut av maskinen når utvikleren jobber, og hva en Code App får gjøre når den kjører i brukerens nettleser.

| Side | Svarer på |
|---|---|
| [Dataflyt til modellen](dataflyt-til-modellen.md) | Hva som forlater maskinen med Copilot: prompt, kontekst, telemetri, og hva som ikke gjør det |
| [Copilot-policyer](copilot-policyer.md) | Innstillingene på organisasjons- og enterprise-nivå i GitHub: content exclusions, public code filter, modell- og plugin-tillatelser, audit log |
| [Hemmeligheter](hemmeligheter.md) | Hvor hemmeligheter ikke skal ligge: ikke i repo, ikke i `power.config.json`, ikke i environment variables, ikke i prompten |
| [Identitet og tilgang](identitet-tilgang.md) | Entra-grupper, maker-roller, Conditional Access, service principal for pipeline |
| [DLP og Code Apps](dlp-og-code-apps.md) | Beviset på at DLP stopper en Code App, og regelen om å forhåndsvise før du publiserer |

Det korte svaret på det vanligste spørsmålet: en Code App kjører med brukerens identitet og brukerens rettigheter, under miljøets DLP. Copilot endrer ikke det. Copilot endrer hva som finnes i repoet og hva som sendes til en modell under utvikling, og det er det de to første sidene handler om.
