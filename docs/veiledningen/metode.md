---
title: Metode og kildemerking
tags: [leder, arkitekt, utvikler]
verifisert: 2026-10-23
kilde: EGEN TEST
---

# Metode og kildemerking

**Hvem denne siden er for:** alle som lurer på hvor mye de kan stole på en side, og alle som skal bidra. Produktene denne veiledningen handler om endrer seg ukentlig. Metoden er laget for at du skal kunne se, på hver side, hva som er lest hvor og når, og hva som er kjørt.

## Hver side har to felt øverst

- **verifisert:** datoen innholdet sist ble sjekket mot kildene. Sider eldre enn 90 dager listes av `tools/stale-check.py` før hver utgivelse, og får en gjennomgang.
- **kilde:** den sterkeste kilden siden bygger på, med ett av merkene under.

| Merke | Betyr |
|---|---|
| **PÅ LEARN** | Lest på Microsoft Learn den datoen. Lenken står under Kilder på siden. |
| **GITHUB DOCS** | Lest på docs.github.com den datoen. |
| **EGEN TEST** | Kjørt i en lab, med versjonsnummer og dato på siden. Terminalbildene kommer fra den kjøringen. |
| **SETT I PREVIEW** | Observert i et forhåndsvisningsprodukt eller i et fellesskap, ikke dokumentert av produsenten. Kan endre seg uten varsel. |
| **PRODUKTTEAM** | Sagt av Microsofts eller GitHubs produktteam i et åpent møte eller en kunngjøring, ikke på Learn eller Docs ennå. |
| **UTKAST** | Siden er planlagt, ikke skrevet. |

Inne i en side er avvik fra hovedmerket markert med bokser: «Sett i preview» og «Til verifisering». En påstand løftes aldri fra fellesskap eller preview til «PÅ LEARN» uten en lenke.

## Hvordan fakta sjekkes

1. **Microsoft-påstander** sjekkes mot Microsoft Learn, først med søk, så ved å lese hele siden. URL og dato går inn under Kilder.
2. **GitHub-påstander** sjekkes mot docs.github.com på samme måte.
3. **Kommandoer kjøres** i en lab-mappe før de publiseres, fra tom mappe til ferdig resultat, og versjonene av CLI-ene og pluginene skrives på siden. Kjøringen gjentas når en versjon endres.
4. **Tall** (priser, grenser, prosenter) har alltid en datert kilde. Priser gjengis aldri som faktum uten lenke til prissiden samme dag.
5. **Identifikatorer** fjernes: ingen tenant-ID-er, miljø-ID-er, app-ID-er, e-postadresser eller kundenavn i tekst eller bilder. I terminalbilder er de sladdet.

## Hvordan sidene er bygget

Hver side starter med hvem den er for, i én eller to setninger. Så kommer innholdet, så «Neste steg» med lenker, så «Kilder» med daterte lenker. Prosedyrer er nummererte steg med en handling og en sjekk, og ett skjermbilde per steg der det hjelper. Tabeller for sammenligninger, bokser for forbehold.

## Produktgrenser og navn

Code Apps og Copilot Managed Runtime er to produkter. Hver påstand sier hvilken apptype den gjelder og hvem aktøren er. [Produktene, hva er hva](../start/produktene.md) er regelsiden; [Språkpolicy](../norge/sprakpolicy.md) sier hvordan vi skriver navnene.

## Selskapsutgaver

Veiledningen er generell med vilje. En virksomhet som skal bruke den, lager en egen utgave: et privat repo som tar dette repoet inn som git-submodul og legger virksomhetens egne sider oppå, med miljønavn, grupper, policyverdier, godkjente datakilder og kontaktpunkter. Rammeverket oppdateres ved å flytte submodulen; virksomhetens sider blir liggende. Mønsteret, mappestrukturen og MkDocs-oppsettet for en slik utgave er beskrevet i `editions/README.md` i repoet. Ingen selskapsspesifikt innhold ligger her.

## Bidra

Repoet er åpent. Rett feil med en pull request eller meld dem som issue. En rettelse av et faktum skal ha en lenke til kilden; en rettelse av språk trenger ingen begrunnelse. Beslutninger om struktur og metode ligger i [beslutningsloggen](../adr/index.md), og nye beslutninger skrives som nye poster der, aldri som endringer av gamle.
