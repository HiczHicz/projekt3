projekt3=dane_spolki_17
attach(projekt3)

#1 WYKRES SZEREGU CZASOWEGO
plot(Kurs.akcji, type='b', main='Szeregu czasowy kursu zamknięcia akcji pewnej spółki', xlab='Numer sesji', ylab='Kurs zamknięcia',
     col='#005d5d', lwd=1,pch=16, cex=0.5)

#ZADANIE 2
max(projekt3$Kurs.akcji)
min(projekt3$Kurs.akcji)
y=c()
for(i in 1:(length(projekt3$Kurs.akcji)-1)){
  y[i]=mean(projekt3$Kurs.akcji[c(i,i+1)])
}
length(y)
sr_chronologiczna=round(mean(y),2)
sr_chronologiczna
#ŚREDNIA CHRONOLOGICZNA TO OK. 110.11

#ZADANIE 3
indeksy_dynamiki=c(round(Kurs.akcji[-1]/Kurs.akcji[-length(Kurs.akcji)]*100,2))
indeksy_dynamiki
#write.csv(indeksy_dynamiki, 'indeksy')

n=length(Kurs.akcji)
srednie_tempo=round(prod(Kurs.akcji[2:n]/Kurs.akcji[1:(n-1)])^(1/(n-1))*100,2)
srednie_tempo
#ŚREDNIOOKRESOWE TEMPO ZMIAN TO OK. 100.02

plot(indeksy_dynamiki, type='b', main='Indeksy łańcuchowe kursu zamknięcia', xlab='Numer sesji', ylab='Indeksy',
     col='#005d5d', lwd=1,pch=16, cex=0.5)

#ZADANIE 4
jednopodstawowe=round(Kurs.akcji/Kurs.akcji[1]*100,2)
jednopodstawowe
#write.csv(jednopodstawowe, 'jednopodstawoweindeksy')

plot(jednopodstawowe, type='b', main='Indeksy jednopodstawowe kursu zamknięcia', xlab='Numer sesji', ylab='Indeksy',
     col='#005d5d', lwd=1,pch=16, cex=0.5)


#ZADANIE 5
library(zoo)
wygladzenie=round(rollapply(Kurs.akcji, width=83, FUN=median, align='center', fill=NA),2)
wygladzenie
#write.csv(wygladzenie,'wygladzenie')

plot(Kurs.akcji, type='b', main='Szeregu czasowy kursu zamknięcia akcji pewnej spółki z wygładzeniem', xlab='Numer sesji', ylab='Kurs zamknięcia',
     col='darkgray', lwd=1,pch=16, cex=0.5)
lines(wygladzenie, col='red', lwd=1.5, type='l', pch=16)
legend('topleft', legend=c('kurs akcji', 'wygładzenie medianą'), col=c('darkgray', 'red'), lty=1, lwd=c(1,1.5))


