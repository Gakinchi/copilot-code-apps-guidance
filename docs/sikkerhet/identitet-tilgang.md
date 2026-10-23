---
title: Identitet og tilgang
tags: [arkitekt]
verifisert: 2026-10-23
kilde: PÅ LEARN
---

# Identitet og tilgang

**Hvem denne siden er for:** arkitekten og Power Platform-administratoren. En Code App kjører med brukerens identitet, og det er Entra ID som bestemmer hvem som er hvem. Alt under er standard Power Platform-tilgang; det nye er at utviklere publiserer fra terminalen, og at pipelinen må ha en egen identitet.

## Lagene

| Lag | Styres i | Avgjør |
|---|---|---|
| Hvem som kan logge inn, og hvordan | Entra ID, Conditional Access | MFA, godkjente enheter, hvilke nettverk Power Apps kan nås fra |
| Hvem som kommer inn i et miljø | Miljøets sikkerhetsgruppe i Power Platform admin center | Medlemskap i Entra-gruppen er inngangsbilletten; ingen gruppe betyr alle i tenanten |
| Hva de får gjøre der | Sikkerhetsroller i miljøet (Dataverse) | Environment Maker kan lage og publisere apper; Basic User kan bruke dem; System Administrator styrer miljøet |
| Hvem som kan kjøre en bestemt app | Deling av appen (`pa app share` eller maker-portalen) | Bruker eller Entra-gruppe, som bruker eller medeier |
| Hva appen får hente | Connections og DLP | Brukerens egen connection, innenfor miljøets DLP |
| Hvem som publiserer i sone 3 | Service principal (app registration) | Pipelinen, ikke en person |

## Praktiske regler

**Én Entra-gruppe per miljø, og én per team.** Gruppen på miljøet avgjør hvem som ser det i det hele tatt. Teamgruppen brukes til deling av apper. Ikke del til enkeltpersoner i sone 2 og 3; det gir foreldreløse apper når folk slutter.

**Environment Maker bare til de som skal bygge.** `pa app push` krever rollen i målmiljøet. I piloten gis den til pilotutviklerne i pilotmiljøet, ingen andre steder. [Hvem får bygge](../styring/hvem-faar-bygge.md) viser hvordan Code Apps-bryteren og rollen virker sammen.

**Conditional Access på Power Apps-appen.** Power Apps er en egen cloud app i Entra. Krev MFA og godkjent enhet for den, slik dere gjør for Microsoft 365. Det gjelder også `pa auth`, som logger inn med samme identitet.

**Service principal i sone 3.** Pipelinen trenger en app registration i Entra, lagt til som Application User i målmiljøet med en rolle som kan publisere. Sekreten ligger i GitHub Actions secrets. Utviklere skal ikke ha Environment Maker i prod; de skal ikke kunne pushe forbi pipelinen.

Mekanikken er dokumentert på Learn: makeren deler appen én gang med service principalens Enterprise Application object ID (`pa app share --principal <object-id> --access edit`), og pipelinen setter `PA_CLI_USE_SP_AUTH=true` pluss klient-ID, hemmelighet og tenant-ID som miljøvariabler før `pa app push --non-interactive`. Miljørettigheter alene gir ikke rett til å oppdatere en eksisterende app; delingen er påkrevd. [CI/CD](../drift/ci-cd.md) har hele oppsettet.

!!! note "Til verifisering i lab"
    Kommandoene over er fra Learn (lest 2026-10-23), ikke kjørt i veiledningens lab ennå. Siden oppdateres med dato når de er kjørt.

## Copilot-siden

GitHub-identiteten er en annen enn Entra-identiteten, med mindre organisasjonen bruker Enterprise Managed Users eller SAML SSO mot Entra. For piloten holder det at Copilot-seter tildeles via et team i GitHub-organisasjonen som speiler pilotgruppen, og at repoene for Code Apps ligger i organisasjonen, ikke på personlige kontoer. [Copilot i skala](../styring/copilot-i-skala.md) tar resten.

## Neste steg

[DLP og Code Apps](dlp-og-code-apps.md) for laget under: hva connections får hente. [Hvem får bygge](../styring/hvem-faar-bygge.md) for bryteren.

## Kilder

- Microsoft Learn, Control user access to environments: https://learn.microsoft.com/power-platform/admin/control-user-access (lest 2026-10-23)
- Microsoft Learn, Security roles and privileges: https://learn.microsoft.com/power-platform/admin/security-roles-privileges (lest 2026-10-23)
- Microsoft Learn, Share a code app: https://learn.microsoft.com/power-apps/developer/code-apps/how-to/share-app (lest 2026-10-23)
- Microsoft Learn, ALM for code apps: https://learn.microsoft.com/power-apps/developer/code-apps/how-to/alm (lest 2026-10-23)
- Microsoft Learn, Publish Power Apps code apps with a service principal: https://learn.microsoft.com/power-apps/developer/code-apps/how-to/use-service-principal (lest 2026-10-23)
- Microsoft Learn, Conditional Access for Power Apps: https://learn.microsoft.com/power-platform/admin/restrict-access-online-trusted-ip-rules (lest 2026-10-23)
