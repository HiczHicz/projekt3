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
