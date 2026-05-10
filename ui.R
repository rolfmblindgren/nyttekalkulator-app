library(shiny)
library(shinyseo)
source("helper.R")

shinyUI(fluidPage(
  includeCSS("www/styles.css"),
  social_meta("meta.yml"),

  div(
    class = "app-shell",
    div(
      class = "hero",
      div(
        class = "hero-copy",
        span(class = "eyebrow", "Pedagogisk kalkulator"),
        h1("Nyttekalkulator"),
        p(
          class = "hero-text",
          "Se hvordan stillingstype, metode og konkurransen om jobben påvirker den forventede nytten av et valg."
        ),
        div(
          class = "hero-badges",
          span(class = "hero-badge", "Basert på arbeidspsykologisk testning"),
          span(class = "hero-badge", "Oppdateres mens du skriver"),
          span(class = "hero-badge", "Tallene er avrundet")
        )
      ),
      div(
        class = "hero-panel",
        h2("Modellen kort fortalt"),
        tags$ul(
          class = "hero-list",
          tags$li("Stillingstype sier hvor mye en god kandidat kan bety."),
          tags$li("Metoden sier hvor godt dere skiller gode kandidater fra resten."),
          tags$li("Avskjæring sier hvor mange som faktisk blir ansatt.")
        )
      )
    ),

    fluidRow(
      column(
        width = 4,
        div(
          class = "panel panel-form",
          h2("Velg verdiene"),
          p(
            class = "panel-copy",
            "Start med standardverdiene. Endre ett felt om gangen for å se hva som flytter resultatet."
          ),
          selectInput(
            inputId = "stillingstype",
            label = "Hvilken type stilling ser du på?",
            choices = c(
              "Funksjonær",
              "Fagspesialist",
              "Mellomleder",
              "Toppleder",
              "Aksjemegler"
            ),
            selected = "Funksjonær",
            multiple = FALSE,
            selectize = TRUE
          ),
          numericInput(
            inputId = "søkere",
            label = "Hvor mange søkere konkurrerer om stillingen?",
            value = 1,
            min = 1,
            max = NA,
            step = 1
          ),
          numericInput(
            inputId = "stillinger",
            label = "Hvor mange skal ansettes?",
            value = 1,
            min = 1,
            max = NA,
            step = 1
          ),
          selectInput(
            inputId = "validitet",
            label = "Hvilken metode bruker dere?",
            choices = c(
              "Assessment Center",
              "Arbeidsprøver",
              "Evnetester",
              "Personlighetstester",
              "Strukturert intervju",
              "CV-sjekk",
              "Referanser",
              "Ustrukturert intervju",
              "Astrologi",
              "Grafologi"
            ),
            multiple = FALSE,
            selectize = TRUE
          ),
          numericInput(
            inputId = "årslønn",
            label = "Hva er omtrent årslønna?",
            value = 300000,
            min = 0,
            max = NA,
            step = 10000
          ),
          div(
            class = "form-note",
            "Tips: Hvis du vil se en tydelig effekt, prøv å endre validitet eller antall søkere først."
          )
        )
      ),
      column(
        width = 8,
        div(
          class = "panel panel-result",
          div(
            class = "section-head",
            span(class = "section-kicker", "Resultat"),
            h2("Forventet nytte")
          ),
          uiOutput("result")
        ),
        div(
          class = "panel panel-explain",
          h2("Slik leser du tallet"),
          div(
            class = "explain-grid",
            div(
              class = "explain-card",
              h3("1. Stillingstype"),
              p("Store og lønnsomme stillinger får høyere utslag enn små og billige stillinger.")
            ),
            div(
              class = "explain-card",
              h3("2. Metode"),
              p("En metode med høyere validitet er bedre til å finne de beste kandidatene.")
            ),
            div(
              class = "explain-card",
              h3("3. Avskjæring"),
              p("Når du ansetter få av mange søkere, blir det viktigere å velge riktig.")
            ),
            div(
              class = "explain-card",
              h3("Ikke en fasit"),
              p("Kalkulatoren er pedagogisk. Den skal gjøre sammenhengen lett å forstå, ikke erstatte faglig skjønn.")
            )
          )
        )
      )
    )
  )
))

# Local Variables:
# mode: R
# End:
