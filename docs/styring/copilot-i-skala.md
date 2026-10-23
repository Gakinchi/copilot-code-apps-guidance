---
title: Copilot i skala
tags: [arkitekt, leder]
verifisert: 2026-10-23
kilde: GITHUB DOCS
---

# Copilot i skala: GitHub-siden av styringen

**Hvem denne siden er for:** arkitekten og den som eier GitHub-organisasjonen. Power Platform styrer hva som får kjøre; GitHub styrer hva Copilot får gjøre under utvikling. De to må henge sammen, men de administreres av forskjellige folk i forskjellige portaler, og det er ofte der det glipper.

## Strukturen

| Nivå | Hva det er | Hva som settes der |
|---|---|---|
| Enterprise | Paraplyen over flere organisasjoner. Finnes med GitHub Enterprise Cloud | Policyer som arves nedover, Copilot Enterprise-funksjoner, enterprise-wide metrics, EU data residency |
| Organisasjon | Der repoene og teamene bor | Copilot-seter, policyer for organisasjonen (innenfor det enterprise tillater), content exclusions, team |
| Team | Gruppe av medlemmer i organisasjonen | Setetildeling, repo-tilgang, speiling av pilotgruppen |
| Repo | Koden | Instruksjonsfiler, branch-beskyttelse, secret scanning, hvem som kan merge |

Med Copilot Business trenger dere bare en organisasjon. Med Copilot Enterprise trenger dere en enterprise-konto, og policyene settes der først. Enterprise kan velge «No policy», som delegerer til organisasjonen, eller sette verdien og låse den.

## Seter

Seter tildeles i organisasjonen, til enkeltbrukere, team eller hele organisasjonen. For piloten: ett team som speiler pilotgruppen, setetildeling til teamet, ingen andre. Når piloten utvides, legges nye team til. Setet faktureres fra tildeling, ikke fra første bruk, så «tildel til alle, så ser vi» koster fra dag én. Seter som ikke har vært brukt på 28 dager, vises i usage metrics; se [Copilot-metrikker](../maaling/copilot-metrics.md).

## Policyene som må være satt før piloten

Listen er fra [Copilot-policyer](../sikkerhet/copilot-policyer.md); her er den i rekkefølgen en administrator møter den:

1. **Copilot CLI**: på. Uten den finnes ikke primærstien i denne veiledningen.
2. **Modeller**: hvilke som er tillatt. Standardvalget holder for piloten; lås listen i policy-malen.
3. **Suggestions matching public code**: blokkert, med mindre juridisk har sagt noe annet.
4. **MCP servers og plugins**: på, fordi Power Platform Skills er en plugin. Det åpner samtidig for alle andre plugins; instruksjonsfilen i repoet må liste de godkjente.
5. **Content exclusions**: for repoer eller stier som ikke skal leses av Copilot i IDE. Husk at de ikke gjelder CLI-en.
6. **Usage metrics**: på, ellers finnes ikke tallene.
7. **Audit log**: slått på for Copilot-hendelser; sjekkes månedlig.

Én eier per policy, og datoen den sist ble vurdert, i [Copilot-policy-malen](../verktoykasse/maler/copilot-policy.md).

## Koblingen til Power Platform

Tre ting må stemme på tvers av de to portalene:

| GitHub | Power Platform | Hvis de ikke stemmer |
|---|---|---|
| Teamet med Copilot-seter | Entra-gruppen med Environment Maker i pilotmiljøet | Utviklere kan generere kode de ikke kan publisere, eller publisere uten Copilot |
| Repoer for Code Apps i organisasjonen | Apper i inventaret | Kode på laptoper, eller apper uten kode |
| Pipeline med service principal | Application User i prod-miljøet | Push feiler, eller utviklere pusher manuelt forbi pipelinen |

Sett de to administratorene i samme møte annenhver uke i piloten. Det er den billigste styringsmekanismen i hele veiledningen.

## Flere organisasjoner

Større virksomheter har ofte flere GitHub-organisasjoner, én per divisjon eller per konsulentkunde. Da hører Copilot-policyene hjemme på enterprise-nivå, slik at ingen organisasjon kan slå på plugins eller modeller enterprise har sagt nei til. Seter kan fortsatt tildeles per organisasjon. Rammeverket her støtter det ved at [selskapsutgaven](../veiledningen/metode.md) tar inn veiledningen som submodul og legger egne policyverdier oppå.

## Claude Code som alternativ

Claude Code styres ikke av GitHub-policyene. Tilgang gis via Claude Enterprise, med egen administrasjon av hvem som har sete, hvilke modeller som er tilgjengelige og hvor data behandles. Den samme policy-malen skal ha en rad per agentverktøy, slik at ingen antar at GitHub-innstillingene dekker alt. [Lisensmodell](../strategi/lisensmodell.md) har raden.

## Neste steg

[Copilot-policyer](../sikkerhet/copilot-policyer.md) for hver innstilling i detalj. [Reaktiv styring](reaktiv-styring.md) for oppfølgingen.

## Kilder

- GitHub Docs, Setting up GitHub Copilot for your enterprise: https://docs.github.com/en/copilot/how-tos/set-up/set-up-for-enterprise (lest 2026-10-23)
- GitHub Docs, Managing policies for Copilot in your organization: https://docs.github.com/en/copilot/how-tos/administer-copilot/manage-for-organization/manage-policies (lest 2026-10-23)
- GitHub Docs, Managing access to Copilot in your organization: https://docs.github.com/en/copilot/how-tos/administer-copilot/manage-for-organization/manage-access (lest 2026-10-23)
- GitHub Docs, Roll out GitHub Copilot at scale, Governing at scale: https://docs.github.com/en/copilot/tutorials/roll-out-at-scale (lest 2026-10-23)
