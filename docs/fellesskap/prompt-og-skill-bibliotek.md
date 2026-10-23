---
title: Prompt- og skill-bibliotek
tags: [arkitekt, utvikler]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Prompt- og skill-bibliotek

**Hvem denne siden er for:** champion-en som skal holde biblioteket, og utvikleren som skal bruke og bidra. Biblioteket er der det som virket, blir noe andre kan bruke: prompter, skills, instruksjonsfiler og egne agenter. Det starter lite, med det piloten lagde, og vokser ved at folk legger inn det de brukte denne uken.

## Hva som ligger der

| Type | Form | Hvor den bor | Eksempel |
|---|---|---|---|
| Prompt | Tekst, med «hva», «ferdig når» og begrensninger | Wikien, én side per prompt | Promptene på [Prompter](../arbeidsflyt/prompter.md) |
| Skill | Mappe med `SKILL.md`, kalt med `/navn` | Et felles repo, kopiert inn i app-repoene, eller delt som plugin | `add-connector` i `prompts/skills/` |
| Instruksjonsfil | `copilot-instructions.md` og `AGENTS.md` | Malen i det felles repoet; hver app har sin kopi | `prompts/copilot-instructions.md` |
| Egen agent | `.github/agents/<navn>.agent.md` | Det felles repoet | En review-agent for Code Apps-mønstrene |

## Det felles repoet

Ett repo i organisasjonens GitHub, for eksempel `copilot-bibliotek`, med:

```text
instructions/      malene for copilot-instructions.md og AGENTS.md, versjonert
skills/            én mappe per skill
agents/            egne agenter
prompts/           Markdown-filer med prompter, én per oppgave
README.md          hvordan bruke og bidra
```

Reglene for repoet er de samme som for en app: PR, review, LF. En skill som endres, reviewes av en champion, fordi den endrer hva agenten gjør i alle repoer som bruker den.

Når biblioteket er stabilt, kan det pakkes som en Copilot-plugin og installeres fra et internt repo. Da får alle samme versjon, og oppdateringer går én vei. Det er et dag 180-mål, ikke et pilot-mål.

## Hvordan noe kommer inn

1. Noen brukte en prompt eller skill som virket, og legger den i tråden «dette virket» i [kanalen](kanal-og-wiki.md).
2. Champion-en prøver den i et annet repo. Virker den der også, blir det en PR til biblioteket.
3. PR-en har: hva den gjør, når den brukes, hvilke versjoner den er testet med, og hvem som eier den.
4. Merge. Kanalen får en linje.

Prompter som bare virket én gang, i ett repo, blir i tråden. Biblioteket er for det som er gjentatt.

## Hvordan noe går ut

Hver oppføring har en dato. Ved kvartalsgjennomgangen ([Reaktiv styring](../styring/reaktiv-styring.md)) prøves de som er eldre enn 90 dager på nytt. De som ikke virker med gjeldende versjoner, fjernes eller rettes. Et bibliotek med døde oppføringer er verre enn ingen.

## Det som ikke skal dit

- Prompter med kundedata, miljø-ID-er eller noe fra et produksjonsmiljø.
- Skills som omgår [grensene](../arbeidsflyt/grenser.md), for eksempel en som pusher til prod.
- Instruksjonsfiler som er kopiert fra en annen virksomhet uten at noen har lest dem.

## Måling

Antall oppføringer er ikke et mål. Andel app-repoer med instruksjonsfil fra malen (K7) er. Og antall oppsettspørsmål i kanalen (K10), som skal synke når biblioteket virker.

## Neste steg

[Prompter](../arbeidsflyt/prompter.md) for det første innholdet. [Instruksjoner og agenter](../arbeidsflyt/instructions-og-agents.md) for formene.

## Kilder

- GitHub Docs, Adding agent skills for GitHub Copilot CLI: https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-skills (lest 2026-10-23)
- GitHub Docs, Creating a plugin for GitHub Copilot CLI: https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-creating (lest 2026-10-23)
