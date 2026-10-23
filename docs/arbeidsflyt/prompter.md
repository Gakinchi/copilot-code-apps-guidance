---
title: Prompter
tags: [utvikler]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Prompter: gjenbrukbare oppgaver for Code Apps

**Hvem denne siden er for:** utvikleren som vil slippe å formulere det samme hver dag, og champion-en som skal bygge teamets [prompt-bibliotek](../fellesskap/prompt-og-skill-bibliotek.md). Regler bor i [instruksjonsfilen](instructions-og-agents.md). Prompter er det du skriver i øyeblikket: oppgaven, med nok kontekst til at agenten gjør riktig ting første gang.

## Formen

En god prompt for en Code App-oppgave har fire deler:

1. **Hva** (én setning).
2. **Ferdig når** (akseptkriteriet).
3. **Begrensninger** (det som ikke står i instruksjonsfilen, men gjelder nå).
4. **Først plan** (til du stoler på at agenten gjør det uansett).

Skriv på engelsk til agenten; modellene og Power Platform-dokumentasjonen er engelske, og feilmeldingene du vil at den skal kjenne igjen, er det også.

## Prompter som er brukt i laben

**Ny funksjon med eksisterende datakilde**

```text
Add a department filter to the people list.
Done when: selecting "Økonomi" shows only people whose department equals Økonomi, and an empty result shows "Ingen treff".
Constraints: use the existing Office 365 Users service in generated/; filter in the query, not on the client; no new packages.
Plan first, no code yet.
```

**Forklar før du endrer**

```text
Before changing anything: explain how PeopleList.tsx loads data today, where getContext() is called, and what happens if it never resolves. Then propose the smallest change that fixes the loading state.
```

**Tester for en endring**

```text
Write tests for the department filter: one match, no match, and that the filter resets when the search text changes. Use the existing test setup. Each test must be able to fail; show me a deliberately broken version of the filter and confirm the test catches it.
```

**Review av egen diff før PR**

```text
Review the current diff against .github/copilot-instructions.md. List every place where it adds a connector, package, environment-specific constant, client-side filtering over a full table, or a catch that swallows errors. Do not fix anything; just list.
```

**Forberede PR-tekst**

```text
Draft the pull request description: the task in one sentence, the plan we followed, what deviated from the plan and why, and any new connector or data source the reviewer must check against DLP.
```

**Når noe er blokkert i plattformen**

```text
pa app push failed with "code apps not enabled". Do not retry or work around it. Explain what an admin must change (environment setting or environment group rule) and draft the message I send to the admin.
```

## Prompter som ikke virker

- «Gjør appen bedre.» Ingen akseptkriterium; agenten velger selv.
- «Fiks feilen.» Uten feilmeldingen og hva du forventet.
- «Legg til Dataverse.» En connector er en styringsbeslutning; bruk `/add-connector`-skillen i stedet.
- Alt som inneholder en nøkkel, et token eller en tilkoblingsstreng. [Hemmeligheter](../sikkerhet/hemmeligheter.md).

## Fra prompt til skill

En prompt teamet bruker hver uke, med samme rekkefølge hver gang, er en skill. Flytt den til `.github/skills/<navn>/SKILL.md` og kall den med `/navn`. [Instruksjoner og agenter](instructions-og-agents.md) viser formen; `prompts/skills/add-connector/` i repoet er eksempelet.

## VS Code: prompt-filer

Bruker teamet Copilot i VS Code i tillegg, kan de samme promptene lagres som `.github/prompts/<navn>.prompt.md` og kalles med `/navn` i Copilot Chat. Copilot CLI leser ikke prompt-filer; der er skills tilsvarende. Hold én kilde: skriv prompten som skill, og la prompt-filen peke på den hvis dere trenger begge.

## Claude Code som alternativ

Samme prompter. Claude Code leser `.claude/skills/` på samme måte som Copilot CLI leser `.github/skills/`, og begge leser `AGENTS.md`.

## Neste steg

[Prompt- og skill-bibliotek](../fellesskap/prompt-og-skill-bibliotek.md) for hvordan teamet deler dem. [Daglig loop](daglig-loop.md) for hvor i arbeidet de brukes.

## Kilder

- GitHub Docs, Adding agent skills for GitHub Copilot CLI: https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-skills (lest 2026-10-23)
- Promptene er brukt i labkjøringer og workshoper i 2026 med Copilot CLI 1.0.61 og `pa` 1.3.0.
