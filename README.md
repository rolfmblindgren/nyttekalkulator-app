# Nyttekalkulator

[![Shiny app](https://img.shields.io/badge/Built%20with-Shiny-1A6B63?style=flat-square)](https://shiny.posit.co/)
[![R](https://img.shields.io/badge/R-4.6+-276DC3?logo=r&logoColor=white&style=flat-square)](https://www.r-project.org/)
[![Repository](https://img.shields.io/badge/GitHub-nyttekalkulator--app-181717?logo=github&logoColor=white&style=flat-square)](https://github.com/rolfmblindgren/nyttekalkulator-app)
[![Live app](https://img.shields.io/badge/Live%20app-shiny.grendel.no-0E2238?style=flat-square)](https://shiny.grendel.no/nyttekalkulator-app/)

En liten pedagogisk Shiny-app som beregner nytten av ulike seleksjonsmetoder i rekruttering.

![Nyttekalkulator preview](www/og.svg)

## Hva appen gjør

Appen lar deg velge:

- type stilling
- antall søkere
- antall ledige stillinger
- metode for seleksjon
- årslønn

Deretter regner den ut forventet nytte per år kandidaten er i stillingen.

## Hvordan den regner

Kjernelogikken ligger i `server.R` og bruker denne formen:

```r
nytte <- årslønn * validitet * stillingstype * ns(stillinger / søkere)
```

Der:

- `årslønn` er lønnen du legger inn
- `validitet` er en fast verdi for valgt metode
- `stillingstype` er en fast verdi for typen stilling
- `ns()` er en egen kurve for avskjæring / seleksjonsratio

Verdiene og forklaringen bygger på formelverket som appen viser til i teksten, blant annet:

- Mabon, Hunter (2002), *Arbetspsykologisk Testning*
- Schmidt, Hunter, Outerbridge & Trattner (1986)

## Bruk

Åpne appen her:

https://shiny.grendel.no/nyttekalkulator-app/

## Kjør lokalt

Hvis du vil starte appen fra repoet, bruk:

```r
shiny::runApp()
```

Appen leser disse filene:

- `ui.R`
- `server.R`
- `helper.R`
- `meta.yml`
- `www/styles.css`

## Metadata

Repoet bruker `shinyseo` for sosial metadata i `meta.yml`, inkludert:

- tittel
- beskrivelse
- canonical URL
- Open Graph-bilde
- Twitter metadata

Delingsbildet ligger i `www/og.svg`.

## Kort om prosjektet

Dette er først og fremst et pedagogisk verktøy. Det er ment å vise hvordan nytte av seleksjonsmetoder kan tenkes utregnet, ikke å være en full HR-plattform.
