library(shiny)
options(scipen = 999)

round_to_thousand <- function(value) {
  round(value / 1000) * 1000
}

format_kroner <- function(value) {
  paste0("kr ", formatC(round_to_thousand(value), format = "f", digits = 0, big.mark = " "))
}

format_pct <- function(value) {
  paste0(formatC(value * 100, format = "f", digits = 1, decimal.mark = ","), " %")
}

stat_card <- function(label, value, hint) {
  tags$div(
    class = "stat-card",
    tags$div(class = "eyebrow", label),
    tags$div(class = "stat-value", value),
    tags$div(class = "stat-hint", hint)
  )
}

shinyServer(function(input, output) {
  output$result <- renderUI({
    stillingstype <- switch(
      input$stillingstype,
      "Funksjonær" = 0.4,
      "Fagspesialist" = 0.5,
      "Mellomleder" = 0.7,
      "Toppleder" = 1.0,
      "Aksjemegler" = 2.0
    )

    validitet <- switch(
      input$validitet,
      "Assessment Center" = 0.6,
      "Arbeidsprøver" = 0.45,
      "Evnetester" = 0.45,
      "Personlighetstester" = 0.4,
      "Strukturert intervju" = 0.35,
      "CV-sjekk" = 0.3,
      "Referanser" = 0.2,
      "Ustrukturert intervju" = 0.15,
      "Astrologi" = 0.0,
      "Grafologi" = 0.0
    )

    avskjaering <- input$stillinger / input$søkere
    nytte <- input$årslønn * validitet * stillingstype * ns(avskjaering)

    tags$div(
      class = "result-stack",
      tags$div(
        class = "result-metric",
        tags$div(class = "eyebrow", "Forventet nytte"),
        tags$div(class = "result-value", format_kroner(nytte)),
        tags$div(class = "result-unit", "per år kandidaten er i stillingen")
      ),
      tags$p(
        class = "result-lead",
        "Dette er et pedagogisk anslag på hvor mye en bedre seleksjonsprosess kan være verdt."
      ),
      tags$div(
        class = "result-facts",
        stat_card("Stillingstype", input$stillingstype, "Hvor stor forskjell stillingen gjør"),
        stat_card("Metode", input$validitet, "Hvor godt metoden skiller kandidater"),
        stat_card("Avskjæring", format_pct(avskjaering), "Hvor stor andel som ansettes")
      ),
      tags$div(
        class = "result-formula",
        tags$span("Årslønn"),
        tags$span("×"),
        tags$span("validitet"),
        tags$span("×"),
        tags$span("stillingstype"),
        tags$span("×"),
        tags$span("avskjæring")
      ),
      tags$div(
        class = "result-note",
        tags$strong("Slik leser du tallet: "),
        "Høyere tall betyr at metoden forventes å gi mer verdi i denne modellen. Bruk det til å sammenligne alternativer, ikke som et eksakt fasitsvar."
      )
    )
  })
})

# Local Variables:
# mode: R
# End:
