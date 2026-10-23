---
title: Instruksjoner og agenter
tags: [utvikler, arkitekt]
verifisert: 2026-10-23
kilde: GITHUB DOCS
---

# Instruksjonsfiler og agenter: det Copilot vet før du spør

**Hvem denne siden er for:** utvikleren som setter opp repoet, og arkitekten som skal gjøre teamets regler til noe agenten faktisk leser. Alt som står i [Grenser](grenser.md) og [Review-regler](review-regler.md) er ubrukelig for agenten hvis det bare står i denne veiledningen. Det må stå i repoet, i filer Copilot leser automatisk.

!!! note "Til verifisering i lab"
    Malene under er skrevet fra reglene verifisert i veiledningens labkjøringer, men er ikke testet som sett i en lab-Code App ennå. Det gjøres i milepæl 3; siden får dato når det er gjort.

## Filene Copilot leser

| Fil | Gjelder | Leses av |
|---|---|---|
| `.github/copilot-instructions.md` | Hele repoet, alle forespørsler | Copilot CLI, IDE, coding agent, code review |
| `.github/instructions/<navn>.instructions.md` | Filene som matcher `applyTo`-mønsteret i front-matter | Samme; brukes sammen med repo-instruksjonene når stien matcher |
| `AGENTS.md` (også `CLAUDE.md`, `GEMINI.md`) | Alle agentverktøy; nærmeste fil i mappetreet vinner | Copilot CLI, coding agent, Claude Code |
| `.github/skills/<navn>/SKILL.md` | Gjenbrukbare arbeidsflyter, kalt med `/navn` | Copilot CLI, coding agent; `.claude/skills/` og `.agents/skills/` leses også |
| `.github/agents/<navn>.agent.md` | Egne agenter med eget verktøysett og egen kontekst | Copilot CLI (`/agent`), coding agent |

Prioritet: personlige instruksjoner først, så repoets, så organisasjonens. En egen agent spawnet som subagent får ikke repo-instruksjonene med mindre `include-custom-instructions: true` står i front-matter.

## Hva som hører hjemme i `copilot-instructions.md`

Fem seksjoner, i denne rekkefølgen, og under hundre linjer:

1. **Hva repoet er.** Code App, rammeverk, eier, miljø, og versjonene verifisert med dato.
2. **Kommandoer.** `pa`, ikke `npx power-apps` eller `pac code`. `--connection-ref` alltid. Dette er linjen som fjerner de vanligste feilforslagene.
3. **Koderegler.** Hash-ruting, `getContext()` etter første render, connectorer bare gjennom `generated/`, filtrering i spørringen, environment variables, autorisasjon utenfor UI, ingen stille feil, connector-grense.
4. **Do not.** Listen fra [Grenser](grenser.md): ingen nye connectorer eller pakker uten å spørre, ikke rør `power.config.json`, ingen hemmeligheter, push bare til Dev, aldri merge, ikke `--allow-all`.
5. **Arbeidsflyt.** Plan først, ett steg av gangen, tester som kan feile, lint før PR.

Malen ligger i repoet: `prompts/copilot-instructions.md`. Kopier, bytt ut hakeparentesene, og hold den oppdatert når versjonene endres ([Oppdateringstakt](../drift/oppdateringstakt.md)).

## `AGENTS.md`: kort, og pek videre

`AGENTS.md` leses av flere verktøy enn Copilot. Hold den på ti linjer: hva repoet er, «les `.github/copilot-instructions.md` først», og de seks reglene som ikke kan fravikes. Detaljene bor ett sted. Malen: `prompts/AGENTS.md`.

Bruker teamet Claude Code, leses den samme `AGENTS.md`; en egen `CLAUDE.md` trengs ikke med mindre dere vil ha Claude-spesifikke regler.

## Skills: arbeidsflyter som kommandoer

En skill er en mappe med `SKILL.md` (front-matter med `name` og `description`, så instruksjonene) og eventuelle skript. Den kalles med `/navn` i prompten. Bruk skills for det teamet gjør ofte og som har en rekkefølge som ikke må brytes.

Eksempelet i repoet, `prompts/skills/add-connector/SKILL.md`, gjør det [Grenser](grenser.md) krever når en connector skal inn: bekreft behovet, sjekk at en connection finnes, si fra om lisens, legg til med `--connection-ref`, verifiser `generated/`, og rapporter til PR-en. Det er den ene handlingen der en agent oftest går for fort fram.

Power Platform Skills-pluginen leverer sine egne skills, som `create-app`; de er beskrevet på [Skills og plugins](skills-og-plugins.md). Egne skills skal ikke gjenta dem, men legge teamets regler oppå.

## Egne agenter

En egen agent (`.github/agents/<navn>.agent.md`) er en subagent med eget verktøysett og egen kontekst, for eksempel en reviewer som bare leser og kommenterer. For piloten holder det med instruksjonsfilen og én skill. Vurder en review-agent når teamet har flere repoer og samme review-kommentarer går igjen.

## Stibaserte instruksjoner

`.github/instructions/generated.instructions.md` med `applyTo: "generated/**"` og teksten «Do not edit these files; run `pa app refresh data-source` instead» er det ene eksempelet som lønner seg fra dag én.

## Organisasjonsnivå

Instruksjoner kan også settes for hele GitHub-organisasjonen. De har lavest prioritet, men er stedet for regler som gjelder alle repoer: språk, hemmeligheter, «CLI-en er `pa`». [Copilot i skala](../styring/copilot-i-skala.md).

## Neste steg

[Prompter](prompter.md) for det som ikke er regler, men gjenbrukbare oppgaver. [Grenser](grenser.md) for innholdet i Do not-listen.

## Kilder

- GitHub Docs, Adding repository custom instructions: https://docs.github.com/en/copilot/how-tos/configure-custom-instructions/add-repository-instructions (lest 2026-10-23)
- GitHub Docs, Adding agent skills for GitHub Copilot CLI: https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-skills (lest 2026-10-23)
- GitHub Docs, Creating and using custom agents for GitHub Copilot CLI: https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/create-custom-agents-for-cli (lest 2026-10-23)
- GitHub Docs, Comparing Copilot customization features: https://docs.github.com/en/copilot/concepts/agents/copilot-cli/comparing-cli-features (lest 2026-10-23)
