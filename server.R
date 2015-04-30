
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
  
    
        
    output$result <- renderText({ 

        stillingstype <- switch(input$stillingstype, 
                            "Funksjonær" = 0.4,
                            "Fagspesialist" = 0.5,
                            "Mellomleder" = 0.7,
                            "Toppleder" = 1.0,
                            "Aksjemegler"   = 2.0)

        validitet <- switch(input$validitet,
                            "Assessment Center" = 0.6,
                            "Arbeidsprøver" = 0.45,
                            "Evnetester" = 0.45,
                            "Personlighetstester" = 0.4,
                            "Strukturert intervju" = 0.35,
                            "CV-sjekk" = 0.3,
                            "Referanser" = 0.2,
                            "Ustrukturert intervju" = 0.15,
                            "Astrologi" = 0.0,
                            "Grafologi" = 0.0)

        nytte <- input$årslønn *
            validitet *
                stillingstype *
                    ns(input$stillinger/input$søkere)

        paste(
            "<h1>Nytten blir ", nytte, " kroner for hvert år kandidaten er i stillingen.</h4>
<br>
<p>
Det denne kalkulatoren gjør er å regne ut hvilken sannsynlig inntjening man vil få ved å bruke en gitt seleksjonsmetode når man velger mellom flere søkere til en stilling. Poenget er at alle søkerne  vil generere inntekt, men noen vil generere mer inntekt enn andre. Det beste er naturligvis å finne den søkeren som vil tjene inn mest. Siden ingen seleksjonsmetoder er helt nøyaktig vil man aldri treffe den hver gang, men jo bedre metoden er, jo mer sannsynlig er det at man i det minste vil treffe en av de beste. 
</p>
<p>I denne kalkulatoren er det inntjening som er kriteriet for hvor vellykket en ansettelse er. Men dette kriteriet kan byttes ut med hva som helst som kan måles. I det offentlige kan det være mer interessant å se på hvor mye penger man sparer ved å treffe litt bedre. I andre sammenhenger kan det være snakk om andre ting enn penger igjen. Men penger er noe alle skjønner. Så i dette eksempelet bruker vi dét.</p><p>
Rent matematisk er nytten av en seleksjonsprosedyre den økningen i inntekt per år man kan forvente å få ved å bruke akkurat den metoden i seleksjon fordi man øker sannsynligheten for å velge en god kandidat.  Så sett at det viser seg at en bestemt metode har nytte på 70 000 kroner, mens konsulenten som bruker den tar seg betalt 140 000 kroner.  Det høres jo ut som dårlig butikk. Men multipliser dét med hvor lenge kandidaten blir der.  70 000 - 140 000 = - 70 000, men (7 * 70 000) - 140 000 = 350 000 dersom kandidaten blir der i syv år. 
</p>
<p>Det er essensielt tre ting det er nødvendig å vite for å kunne regne ut sannsynlig nytte.  Nytte er det overskuddet en kandidat vil generere til bedriften i kraft av hva kandidaten kan produsere. De tre tingene som må vites om er</p>
<dl>
<dt>Avskjæring: Hvor stor andel skal ansettes?
<dd>Jo flere søkere til stillingen, desto mer sannsynlig at det vil være eksepsjonelle søkere, så nytten øker jo flere som søker og jo færre som skal ansettes.
<dt>Stillingstype: Hva er forskjellen mellom en gjennomsnittlig utøver og en eksepsjonell utøver?
<dd>For at en bedrift skal ha nytte av en ansatt, må vedkommende generere i overskudd ca. 20% av sin egen lønn. Det er en grei tommelfingerregel at en eksepsjonell ansatt i en bedrift genererer ca. 40 prosentpoeng mer enn enn gjennomsnittlig. Da er nytten av denne ansatte 0.4. En eksepsjonell ansatt er en som yter et standardavvik mer enn snittet. I noen yrker er nytten mye mer, som f.eks. for livsforsikringsselgere og aksjemeglere. 
<dt>Metodens validitet, altså hvor god metoden er til å finne den rette.
<dd>Validitet er et mystisk tall som ligger mellom 0 og 1 og som ikke har noen mening som er lett å forklare, men validiteten kan dyttes inn i formler hvor resultatet er lett å forstå, som her.  Jo høyere metodens validitet er, jo mer sannsynlig er det at metoden finner en dyktig person, altså den som genererer mest for bedriften. Astrologi og grafologi har ingen nytte, og legger ikke til noe, mens assessment center kan ha valididtet oppe i 0.6 og bidra ganske kraftig.
</dl>
<p>
Matematikken som ligger til grunn for disse formlene ble først utviklet av Brogden i 1947, avskjæringstabellene av Naylor og Shine i 1965, og brukt i en rekke studier av Hunter og Schmidt på 80-tallet som bl.a. viste at USA kan spare milliarder av dollar ved å legge til IQ-testing som seleksjonskriterium ved ansettelse av offentlige funksjonærer. Hunter Mabon gir en lettfattelig og pedagogisk innføring i Arbetspsykologisk Testning (Psykologiförlaget AB, 2002). Kalkulatoren er testet mot oppgave 4 i kapitel 11 og gir riktig svar.
</p>
<h4>Litteratur</h4>
<dl>
<dt>Mabon, Hunter (2002)
<dd><i>Arbetspsykologisk Testning</i> Stockholm: Psykologförlaget
<dt>Schmidt,  Frank L,; Hunter John E; Outerbridge, Alice N & Trattner, Marvin H (1986)
<dd><i>The economic impact of job selection  methods on size, productivity, and payroll costs of the federal work  force: an empirically based demonstration</i> Personnel Psychology <b>39</b>(1)
</dl>

")
    
    })
  
})
