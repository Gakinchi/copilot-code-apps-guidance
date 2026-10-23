---
title: Daglig loop
tags: [utvikler]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Daglig loop: oppgave, plan, prompt, review, test, push

**Hvem denne siden er for:** utvikleren som har kjørt [hurtigstarten](hurtigstart.md) og nå skal jobbe med en ekte Code App over uker. Hurtigstarten viste at agenten kan bygge en app fra null. Den daglige loopen handler om det motsatte: små, kontrollerte endringer i en app som allerede har brukere, der du vet hva som skjedde og hvorfor.

## Loopen

| Steg | Du | Copilot | Varer |
|---|---|---|---|
| 1. Oppgave | Skriver oppgaven som én setning med akseptkriterium | | 2 min |
| 2. Plan | Ber om plan, ikke kode. Leser den. Retter den | Foreslår filer som endres, og hvorfor | 5 min |
| 3. Prompt | Godkjenner planen, ett steg av gangen | Skriver koden, viser diff per fil | 10 til 30 min |
| 4. Les diffen | Leser hver fil før du sier ja til neste | Venter | Like lenge som steg 3 |
| 5. Kjør | `pa app run`, Local Play, prøv endringen som bruker | Kan kjøre tester og lint på forespørsel | 5 min |
| 6. Tester | Ber om tester for det som ble endret, leser dem også | Skriver tester | 10 min |
| 7. Pull request | Åpner PR med planen fra steg 2 som beskrivelse | Kan skrive utkast til PR-tekst | 5 min |
| 8. Review | En annen leser, etter [review-reglene](review-regler.md) | | Avhenger |
| 9. Merge og push | Merge; CI bygger og publiserer til Dev | | Automatisk |

Loopen er bevisst lagt opp slik at steg 2 og 4 tar tid. Det er der forståelsen sitter. En utvikler som hopper over dem, har en app ingen i teamet kan forklare om tre måneder.

## Steg 1: oppgaven

Skriv oppgaven før du åpner Copilot. Én setning om hva, én om hvordan du vet at det er ferdig:

```text
Legg til et filter på avdeling i kollegalisten.
Ferdig når: velger jeg «Økonomi», vises bare kolleger med department = Økonomi, og tom liste gir meldingen «Ingen treff».
```

Oppgaver som ikke kan skrives slik, er for store. Del dem.

## Steg 2: plan, ikke kode

```text
Lag en plan for denne oppgaven. Ikke skriv kode ennå. List filene som må endres og hvorfor, og si om det trengs en ny connector eller datakilde.
```

Det siste spørsmålet er det viktigste. En plan som vil legge til en connector, er en plan som må innom [DLP](../sikkerhet/dlp-og-code-apps.md) og kanskje admin, før koden skrives. Fang det her, ikke i `pa app push`.

Les planen som om en kollega skrev den. Spør hvorfor hvis noe er uklart. Rett den. Først så: «Gjennomfør steg 1 av planen.»

## Steg 3 og 4: ett steg, én diff

La agenten gjøre ett steg av planen om gangen, og les diffen før neste. Godkjenning per handling er standard i Copilot CLI; ikke slå på `--allow-all` i et repo med brukere. Spør når noe i diffen er ukjent:

```text
Forklar hvorfor du endret useEffect-avhengighetene i PeopleList.tsx.
```

Et svar du ikke forstår, er en endring du ikke merger.

## Steg 5: kjør det selv

`pa app run` og Local Play, i samme nettleserprofil som Power Platform. Prøv oppgaven slik brukeren ville gjort det, inkludert det tomme tilfellet og det store datasettet. Delegering og connector-grenser viser seg her, ikke i enhetstestene; se [Datakilder](datakilder.md).

## Steg 6: tester

```text
Skriv tester for filteret: ett treff, ingen treff, og at filteret nullstilles når søket endres. Bruk den testoppsettet som allerede finnes i repoet.
```

Les testene like nøye som koden. En test som bare bekrefter at koden gjør det koden gjør, er ikke en test.

## Steg 7 til 9: PR, review, merge

PR-beskrivelsen er planen fra steg 2 pluss hva som avvek. Reviewer følger [review-reglene](review-regler.md). Etter merge bygger CI og publiserer til Dev; promotering videre er [pipelinen](../drift/ci-cd.md), ikke deg.

## Når du stopper og leser i stedet

- Agenten foreslår en ny connector, en ny npm-pakke eller en endring i `power.config.json`.
- Agenten vil endre noe utenfor planen.
- Diffen er større enn du kan lese på ti minutter.
- Agenten sier «dette burde virke» i stedet for å vise at det virker.
- Du er på vei til å lime inn noe fra et annet system i prompten. Se [Hemmeligheter](../sikkerhet/hemmeligheter.md).

## Claude Code som alternativ

Samme loop. Claude Code har plan-modus innebygd, som gjør steg 2 til en eksplisitt tilstand; i Copilot CLI er det en prompt-vane. Review-reglene og grensene er de samme.

## Neste steg

[Review-regler](review-regler.md) for steg 8. [Instruksjonsfiler](instructions-og-agents.md) for å gjøre reglene her til noe agenten vet fra start.

## Kilder

- GitHub Docs, Using GitHub Copilot CLI: https://docs.github.com/en/copilot/how-tos/copilot-cli/use-copilot-cli/overview (lest 2026-10-23)
- Loopen bygger på workshoper og daglig bruk av Copilot CLI med Code Apps i 2026.
