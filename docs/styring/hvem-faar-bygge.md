---
title: Hvem får bygge
tags: [arkitekt]
verifisert: 2026-10-23
kilde: PÅ LEARN
---

# Hvem får bygge Code Apps, og hvordan du begrenser det til piloten

**Hvem denne siden er for:** Power Platform-administratoren og arkitekten som skal slå på Code Apps for de riktige miljøene og holde det av for resten. Code Apps er av som standard. Det er en fordel: du bestemmer hvor piloten får skje.

## Tre ting avgjør om en utvikler får publisere en Code App

1. **Miljøinnstillingen «Enable code apps»** må være på i miljøet. Standardverdien er av. Er den av, kjører ikke apper som er publisert dit, og `pa app push` feiler.
2. **Utvikleren må ha en maker-rolle i miljøet:** Environment Maker, System Customizer eller System Administrator. Uten rollen kommer ikke utvikleren inn i maker-portalen, og CLI-en kan ikke publisere på vegne av dem.
3. **Lisens og tilgang til datakildene** må være på plass: Power Apps Premium eller pay-as-you-go for brukerne som skal kjøre appen, og connectorene må være tillatt av DLP-policyen i miljøet. Se [DLP og Code Apps](../sikkerhet/dlp-og-code-apps.md).

Disse tre er uavhengige. En utvikler med maker-rolle i et miljø der Code Apps er av, får en feil. En utvikler i et miljø der Code Apps er på, men uten maker-rolle, får en annen feil. Begge ser ut som «det virker ikke» i en Teams-melding.

## Slå på Code Apps for ett miljø

Dette er stien på Microsoft Learn, uendret per 2026-10-23.

1. Gå til [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. Velg **Manage** > **Environments** og miljøet du vil bruke.
3. Velg **Settings**, utvid **Product**, velg **Features**.
4. Finn **Power Apps code apps** og slå på **Enable code apps**.
5. Velg **Save**.

Sjekk: en utvikler med maker-rolle i miljøet kjører `pa app push` fra et testprosjekt, og appen dukker opp under Apps i maker-portalen med typen Code.

## Slå det på i skala: environment groups

Innstillingen finnes også som regel for environment groups. Den heter **Power Apps code apps** i regelkatalogen og setter verdien for alle miljøer i gruppen samtidig. Miljøinnstillingen respekterer gruppens regel, så du kan ikke overstyre per miljø inne i en gruppe som har regelen publisert.

Det er den mekanismen du bruker for å begrense piloten:

| Gruppe | Regel «Power Apps code apps» | Hvem havner der |
|---|---|---|
| Standardgruppen, som Everyone-routingregelen peker til | Av | Alle makere som ikke er i piloten |
| Pilotgruppen | På | Miljøene til pilotteamet, pluss ett delt pilotmiljø |

Oppskriften:

1. Opprett en Entra-sikkerhetsgruppe for piloten.
2. Opprett en environment group for piloten, og publiser regelen **Power Apps code apps** med verdien På.
3. Legg pilotens miljøer i gruppen. Et eksisterende personlig utviklermiljø følger ikke med automatisk; flytt det manuelt under **Environment groups** > **Add environments**.
4. La standardgruppen stå uten regelen, eller med regelen satt til Av, slik at nye miljøer fra routing lander på av.
5. Dokumenter beslutningen i [styringsplanen](../verktoykasse/maler/styringsplan.md) og legg flyttingen av miljøer inn i [tiltakslisten](../verktoykasse/maler/tiltaksliste.md).

Sjekk: en maker utenfor piloten kjører `pa app init` og `pa app push` mot sitt eget miljø og får beskjed om at code apps ikke er aktivert; en maker i piloten lykkes.

!!! note "Sett i preview, et annet produkt"
    Copilot Managed Runtime har sine egne brytere: en tenant-bryter i Microsoft 365 admin center under Apps > Overview > App creation paths, en Copilot Studio-sti som kan avgrenses til en sikkerhetsgruppe, og en regel for CLI-opprettelse per environment group i Power Platform admin center. Ingen av dem påvirker Code Apps, og Code Apps-bryteren påvirker ikke dem. Blander du dem, ender du med en pilot som er åpen der du trodde den var lukket.

## Hvem kan endre dette

Power Platform-administratorer og miljøadministratorer kan sette miljøinnstillingen. Regler for environment groups krever Power Platform-administrator. Legg rollene inn i [Roller og ansvar](../planlegg/roller.md), og la to navngitte personer kunne gjøre det, ikke én.

## Oppdag først, begrens etterpå

Før du slår noe av i et miljø som allerede er i bruk: hent inventaret. Maker-portalen viser Code Apps per miljø under Apps med typen Code, og Power Platform admin center viser dem i inventaret. Finner du apper du ikke visste om, er det et funn for [reaktiv styring](reaktiv-styring.md), ikke en grunn til å slå av bryteren samme dag.

## Neste steg

[DLP og Code Apps](../sikkerhet/dlp-og-code-apps.md) viser hva som skjer når en Code App bruker en blokkert connector, og hvorfor du forhåndsviser en DLP-endring før du publiserer den. [Pilotgruppe](../planlegg/pilotgruppe.md) beskriver hvordan du velger menneskene.

## Kilder

- Microsoft Learn, Power Apps code apps overview, «Enable code apps on a Power Platform environment»: https://learn.microsoft.com/power-apps/developer/code-apps/overview (lest 2026-10-23)
- Microsoft Learn, Manage feature settings, «Power Apps code apps» (standardverdi Off): https://learn.microsoft.com/power-platform/admin/settings-features (lest 2026-10-23)
- Microsoft Learn, Rules for environment groups (regel 27, Power Apps code apps): https://learn.microsoft.com/power-platform/admin/environment-groups-rules (lest 2026-10-23)
- Microsoft Learn, Control which apps are allowed in your environment (maker-roller for maker-portalen): https://learn.microsoft.com/power-platform/admin/control-app-access-environment (lest 2026-10-23)
