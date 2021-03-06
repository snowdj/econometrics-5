# R-Programm zur Illustration des zentralen Grenzwertsatzes

# Aufrufen des Pakets "MASS", damit einige n�tzliche weitere
# Befehle zur Verf�gung stehen (insb. truehist f�r Histogramme)

library(MASS)

# Die folgenden beiden Parameter dienen der Standardierung
# des Durchschnitts, sie h�ngen mit dem rNAME-Befehl weiter
# unten zusammen.

mu <- 1
sigma <- 1

R <- 10000 # Anzahl der zu ziehenden Stichproben (jeweils der L�nge n)
g <- seq(-5,5,length=500) # Gitterdefinition

# Die Schleife l�uft �ber die Stichprobenumf�nge
# (die R-fache Ziehung der Stichproben wird matriziell programmiert)

for(n in 1:50)
  {

  # Die Matrix x hat R Zeilen und n Spalten, jede Zeile ist
  # eine eigene (unabh�ngige) Stichprobe; die Verteilung sollte
  # nicht die Normalverteilung sein (sonst ist es langweilig)

  x <- matrix(rexp(n*R),R,n)

  # Der apply-Befehl berechnet f�r jede Zeile von x den
  # Durchschnitt und gibt alle R Durchschnitte als Vektor zur�ck

  xbar <- apply(x,1,mean)
  z <- sqrt(n)*(xbar-mu)/sigma # Standardisierung
  truehist(z) # Erzeugen einer Grafik mit dem Histogramm der z-Werte
  lines(g,dnorm(g)) # Einf�gen der N(0,1)-Dichte
  }
  
# M�gliche Verbesserungen:
# (1) Erweitern des truehist-Befehls:
#     truehist(z,xlim=c(-5,5), ylim=c(0,0.5), main=paste("n = ",n))
# (2) Erweitern des lines-Befehls:
#     lines(g,dnorm(g),col="red",lwd=3)

# Andere Verteilungen:
# (1) Recheckverteilung:
#     mu <- 0.5
#     sigma <- sqrt(1/12)
#     x <- matrix(runif(n*R),R,n)
#
# (2) Student-t-Verteilung mit 3 df: 
#     mu <- 0
#     sigma <- sqrt(3)
#     x <- matrix(rt(n*R,df=3),R,n)
