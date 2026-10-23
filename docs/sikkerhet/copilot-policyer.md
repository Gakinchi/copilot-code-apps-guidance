---
title: Copilot-policyer
tags: [arkitekt]
verifisert: 2026-10-23
kilde: GITHUB DOCS
---

# Copilot-policyer: innstillingene i GitHub som styrer hva Copilot får gjøre

**Hvem denne siden er for:** Copilot-administratoren (eieren av GitHub-organisasjonen eller enterprise-kontoen) og sikkerhetsansvarlig. Power Platform styrer hva en app får kjøre. GitHub styrer hva Copilot får se og foreslå mens utvikleren jobber. Denne siden er den andre halvdelen.

## Hvor policyene settes

Organisasjonseiere setter policyer for organisasjonen. Med Copilot Enterprise settes de på enterprise-nivå og arves ned, med valget «Enabled everywhere», «Disabled everywhere» eller «Let organizations decide» per policy. Endringer i policyer logges i audit log.

## Policyene som angår dette oppsettet

| Policy | Styrer | Anbefaling for piloten |
|---|---|---|
| **Copilot in the CLI** | Om utviklerne får bruke Copilot CLI i det hele tatt | På. Hele arbeidsflyten bygger på den |
| **Copilot coding agent / cloud agent** | Om Copilot kan jobbe i skyen på et repo og åpne pull requests | Av i piloten; vurder senere. `/delegate` i CLI-en krever at begge er på |
| **Suggestions matching public code** | Om forslag som matcher offentlig kode blokkeres eller vises med referanse | Blokker, eller vis med referanse og la review ta det. Beslutning for juridisk |
| **Model access** | Hvilke modeller utviklerne får velge, inkludert preview-modeller | Kun generelt tilgjengelige modeller i piloten; med EU-dataresidens er listen begrenset til modeller med regionale endepunkter |
| **MCP servers** | Om MCP-servere er tillatt, blokkert, eller begrenset til en liste i et MCP-register. Gjelder Copilot CLI | Begrens til register; legg Power Platform-pluginens MCP-servere inn |
| **Plugins / custom agents** | Enterprise-konfigurerte agenter og hvilke plugins som er tilgjengelige | Tillat `microsoft/power-platform-skills`; dokumenter versjonen piloten bruker |
| **Content exclusion** | Filer og repoer Copilot ikke får lese eller bruke som kontekst i IDE-en | Sett for repoer med persondata og hemmeligheter. **Gjelder ikke Copilot CLI**, se under |
| **Data residency** | Om inferens skjer i EU-regionen | På for norske virksomheter, etter avtalesjekk; se [GDPR og EU-datagrense](../norge/gdpr-og-eu-datagrense.md) |
| **Usage metrics access** | Hvem som ser Copilot-tallene | CoE-lederen og Copilot-admin |

!!! warning "Content exclusions gjelder ikke Copilot CLI"
    GitHub skriver eksplisitt at content exclusion, som er filsti-basert, ikke påvirker Copilot CLI. IDE-policyene gjelder heller ikke. For CLI-en gjelder: Copilot in the CLI-policyen, modellpolicyene, MCP-policyene og seteadministrasjonen. Det betyr at beskyttelsen av sensitive filer i terminalen må komme fra andre steder: repoer uten persondata, hemmeligheter utenfor repoet, og utviklere som vet hva de gir agenten tilgang til. [Grenser](../arbeidsflyt/grenser.md) har reglene for utvikleren.

## Hva Copilot CLI gjør på maskinen

CLI-en kan lese filer, kjøre kommandoer og nå URL-er, hver gang etter at utvikleren har godkjent, med mindre utvikleren slår på `--allow-all` eller autopilot. I piloten: godkjenning per handling er standard, `--allow-all` brukes bare i en engangsmappe for testing. Det er en arbeidsregel for teamet, ikke en policy GitHub håndhever.

## Sjekkliste før piloten

1. Copilot in the CLI: på for pilotorganisasjonen.
2. Seter tildelt pilotgruppen; aktivering synlig i usage metrics.
3. Suggestions matching public code: beslutning tatt og dokumentert.
4. Modeller: kun generelt tilgjengelige; dataresidens vurdert.
5. MCP: register eller liste satt, pluginens servere inkludert.
6. Content exclusions satt for IDE-bruk, med forståelsen av at CLI-en ikke dekkes.
7. Audit log: noen leser den månedlig, se [tiltakslisten](../verktoykasse/maler/tiltaksliste.md) R.M.3.
8. Alt over notert i [Copilot-policy-malen](../verktoykasse/maler/copilot-policy.md) med dato og eier.

## Neste steg

[Dataflyt til modellen](dataflyt-til-modellen.md) for hva policyene faktisk beskytter mot. [Grenser](../arbeidsflyt/grenser.md) for reglene som ikke kan settes som policy.

## Kilder

- GitHub Docs, Managing policies for Copilot in your organization: https://docs.github.com/en/copilot/how-tos/administer-copilot/manage-for-organization/manage-policies (lest 2026-10-23)
- GitHub Docs, Administer Copilot CLI for your enterprise: https://docs.github.com/en/copilot/how-tos/copilot-cli/administer-copilot-cli-for-your-enterprise (lest 2026-10-23)
- GitHub Docs, Supported surfaces for policies: https://docs.github.com/en/copilot/reference/supported-surfaces-for-policies (lest 2026-10-23)
- GitHub Docs, Content exclusion: https://docs.github.com/en/copilot/concepts/security-governance-and-network-settings/content-exclusion (lest 2026-10-23)
- GitHub Docs, MCP management: https://docs.github.com/en/copilot/concepts/mcp-management (lest 2026-10-23)
