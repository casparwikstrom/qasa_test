Test Caspar Wikström Qasa

Hur kör du programmet

Installera nödvändiga paket, jag la till två väldigt simpla tester så respec är krävs för att köra dessa.
Starta programmet från terminalen med  “ruby lib/interface.rb”.
Följ sedan instruktionerna som kommer i terminalen
Control C eller skriv “3” i terminalen för att avsluta

I interface filen hittar du majoriteten av user inputs mm och jag har försökt bygga ut och lägga logiken i store.rb och cart.rb som innehåller butik och kundvagns logik.

Uppgiften är så simpel eller svår som man gör den. Svårigheten med denna uppgift var och är user input, den stora skillnaden mellan terminalen och webb/mobilapp är att användaren kan skriva olika input som kan krascha systemet. Detta skulle man säkert kunna komma runt med komplicerade regex metoder eller alternativt be användaren skriva input i siffror och matcha siffrorna till varor(för att köpa kött skriv “1” mm).

Om jag skulle fortsätta på projektet så skulle jag förbättra metoden met att ta bort varor från inköpslistan så att man istället för att ta bort samtliga “meat” så skulle man kunna välja antalet man vill ta bort.


-----
Enkel design för en hiss

Antagande/krav
1. En hiss kan röra sig uppåt, nedåt eller stanna.
2. En hiss kan överföra passagerare från en våning i en byggnad till en annan våning på så kort tid som möjligt.
3. Hissdörren kan endast öppnas när den står stilla i en dörröppning(korrekt zon)
4. Antag att vår byggnad har 100 våningar
5. Antag att vi har 30 stycken hissar
6. Sedan finns det några krav relaterade till varje hiss som:
a. Antal passagerare / maxvikt för hissen
b. Hissens rörliga hastighet(konstans eller rörlig)
7. Nästa krav handlar om vad vi vill minimera.
a. Vill vi minimera den totala väntetiden i systemet?
b. Gillar vi att minimera passagerarnas väntetid?
8. Arbetar hissarna med zoner eller på jämna/udda våningar. Man bör dela upp hissarna i olika drift zoner När det gäller 100 våningar och 30 hissar kan vi t.ex. dela upp alla våningar i fyra zoner:
· Från 1–33: drivs av 10 hissar
· Från 34–66: drivs av 10 hissar
· Från 67–100: drivs av 10 hissar
Ett annat sätt att zonindelning är att dela upp alla våningar i två zoner (jämna och udda våningar etc.). Valet av detta beror bredd på byggnaden(hur många hisschakt samt hur många våningar som finns i byggnaden.

Utöver dessa krav finns alternativa krav som
1. Nödlarm / broms
2. Service signal

Objekt:
Detta är systemets objekt i en väldigt förenklad form
1. Byggnad
2. Hiss controller
3. Hissar
4. Sedan kan varje hiss ha dörrar, knapp paneler inuti hissarna och sedan knappar
5. Golv
6. Hisschakt
7. Passagerare
och mer.
Uppgifter för hissen:
De viktigaste användningsfallet inkluderar:
· Kalla på hiss: Så när en passagerare vill åka upp eller ner till en annan våning trycker han på upp- eller ned knappen för att ringa hissen.
· Flytta / stoppa hissen
· Öppna / stäng dörrarna
· Indikerar rörelseriktning(pil upp eller ner så folk inte går på fel hiss)
· Indikerar position: golvet där hissen är. Viktigt så man inte kliver av på fel plan men också viktigt då denna signal plus hissens riktning kommer bestämma vilken hiss som ska hämta upp vilken passagerare
· Slutpossition
· Nödstopp
· Ringa ett nödsamtal

Beroende på vilken sorts av zonindelning man väljer bör man också se över om det finns ett snabbt och passande sätt för vilken algoritm man ska använda vid valet av vilken hiss som ska hämta vilken passagerare.

Om man har delat upp en byggnad i olika zoner så passar First Come First Serve, dock tar först och främst hissarna an uppgifterna i sin egna zoon. Vid valet av udda och jämna zoner kan det vara passande att välja Shortest Seek Time First.

Basic Schema https://res.cloudinary.com/dxozxley9/image/upload/v1622792143/Screenshot_2021-06-04_at_09.30.30_rujb3t.png
