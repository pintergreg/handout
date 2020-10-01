# Sprint 2.

<!-- toc -->

## Ultrahang Szenzor implementálása

Az *ultrasonic sensor* modul felelőssége a parkoló automata alapjául szolgáló ultrahang szenzorcsomag szimulációjának implementálása. Mint minden szenzor, az ultrahang is érzékeli a világ egy szeletét és eléri a látóterében található objektumokat.

* Input: világmodell
* Output:
    * Ultrahang szenzor által látott objektumok

* A háromszög kirajzolására már kell, hogy legyen elérhető publikus metódus, amely 3 pontot és egy rajzolási színt vár bemenetként
* A világ objektumainak lekérdezésére már kell, hogy legyen elérhető publikus metódus, mely 3 pontot vár bemenetként, ebből kell leválogatni a relevánsakat
* ![](images/ultrasonic.png)

### Definition of Done

- 8 db ultrahang szenzor, egyenként 3 méter látótávolsággal, 100° látószöggel
- A 8 darab háromszög koordinátái az autó helyzetétől függően folyamatosan frissülnek
- debug célra bekapcsolható módon ezek a háromszögek legyen kirajzolhatóak **zöld** színnel
- A látószög és távolság által meghatározott területen kérjék el a **releváns** objektumokat
- Határozzák meg a legközelebbi (ütközés szempontjából) objektum pozícióját, kiterjedését, távolságát
- A legközelebbi objektum legyen vizuálisan kiemelve


## Kamera szenzor implementálása, Ütközés detekció és mozgásállapot-változás szimuláció

Sávtartó automatika és táblafelismerő alapjául szolgáló kamera szenzor implementációja. A Sávtartó automatika a nagyobb feladat, ugyanis meg kell tudni határozni a sávot. Az autó előtt levő pályaelemekből kiszámítani, hogy hol vannak a sávot meghatározó vonalak. A sávtartó automatikának arra lesz majd szüksége, hogy az autó közelít-e a sávját meghatározó felfestésekhez.

* Input: világmodell
* Output:
    * Kamera által látott objektumok
    * esemény kiváltása ütközések bekövetkezésekor
       * ez írja le, hogy mik ütköztek
       * ??? új mozgásállapot minden mozgó, ütköző objektumnak

### Definition of Done

- 1 db, a szélvédő mögé elhelyezett kamera implementálása
- A látószög és távolság által meghatározott területen kérje el a **releváns** objektumokat
    * a táblafelismerő szempontjából releváns objektumok a táblák
    * a sávtartó szempontjából releváns objektumok az utak
- A háromszög koordinátái az autó helyzetétől függően folyamatosan frissülnek
- debug célra bekapcsolható módon a háromszög legyen kirajzolható **kék** színnel
- A szenzorok által relevánsnak tartott objektumok vizuálisan kiemelhetők egy debug kapcsolóval (billentyű vagy debug módba váltás)

<!-- - A kamera szenzor a látható sávok összes adatát visszaadja(hány sáv, melyikben vagyunk, azon belül milyen távolságra a szélektől)
- A kamera szenzor a látott táblák közül a legközelebbi összes adatát visszaadja (milyen tábla, milyen messzire van) -->

***

- A vezérelt autó - tereptárgy ütközésének detektálása és esemény kiváltása
- A vezérelt autó - NPC-vel való ütközésének detektálása és esemény kiváltása
- Mozgó és statikus objektumok érintkezésének pozíció és dimenzióhelyes detekciója és kommunikációja megvalósult
- Az objektumok mozgásállapota az energiamegmaradás törvényeinek megfelelően változik (gyorsul, lassul, irányt vált, megáll)
    - Ha a vezérelt autó nekimegy egy NPC autónak akkor ez legyen rá hatással (lassuljon le)
    - Ha a vezérelt autó nekimegy egy „stabil” tereptárgynak (pl. fa), akkor álljon meg, érjen véget a játék, egy táblán azonban át tud menni (el tudja sodorni), lassuljon le
- Az objektumok sérülnek, megsemmisülnek, amennyiben túl nagy energiával ütköznek
- Ha a vezérelt autó elüt egy gyalogost, akkor érjen véget a játék
- A játék véget ér, ha a játékos ütközés következtében mozgásképtelenné válik (megsemmisül)


### Megjegyzés

* A háromszög kirajzolására már kell, hogy legyen elérhető publikus metódus, amely 3 pontot és egy rajzolási színt vár bemenetként
* A világ objektumainak lekérdezésére már kell, hogy legyen elérhető publikus metódus, mely 3 pontot vár bemenetként, ebből kell leválogatni a relevánsakat
* A kamerának előre kell látnia, ha az út kanyarodni fog, azt is, hogy merre fog kanyarodni és erről a sávtartó automatikának használható információt kellene előállítani
* A valóságban kiszámolják a pálya görbét, ezt itt oly módon oldható meg, hogy a sávhatárokat és ezekhez tud majd a sávtartó automatika viszonyítani
* Továbbá figyelni kell, hogy az autó sebességének függvényében hol lesz a következő időpillanatban (pl. másodperc múlva). Le fog-e térni az útról ha beavatkozás nem történik, mert akkor a sávtartó automatikának közbe kell avatkoznia. Ez itt még nem feladat, de a következő sprintben az lesz, így célszerű észben tartani
* ![](images/camera.png)

***

* Az ütközés detektálása implementáció szempontjából nagyon hasonló a világ objektumainak lekérdezéséhez. Az kell bizsgálni az `intersects` metódussal, hogy két objektum összeér-e.
* Az NPC - NPC ütközés nem fontos, tehát NPC autó ha átmegy a gyalogoson nem kell, hogy kiváltson különösebb reakciót
* jellemző megoldásként az _egocar_ szokott kapni egy sérülés/élet értéket a mozgásképtelenséghez


## Világ populálása mozgó NPC objektumokkal

A modul felelőssége, hogy az előző sprintben felépített világot, amelyben már megjelennek a statikus objektumok és van egy működő, vezethető autó, további dinamikus objektumokkal kell kiegészíteni. Ezek a nem játszható karakterek (NPC, _non player character_), amelyekre azért van szükség, hogy a 3. sprintes modulok tesztelhetők legyenek. Például a vészfékező rendszer nem üti el a gyalogost, vagy az adaptív tempomat igazítja az autó sebességét az előtte haladó autóéhoz.

A modul bemenete a világmodell, amely egyrészt elősegíti az implementálást azáltal, hogy a előre definiáll helyett az osztályhierarchiában az NPC objektumok számára, másrészt a statikus objektumok, egészen pontosan az út elemek definiálják a pályát amelyen az NPC autónak haladnia kell a KRESZ szabályai szerint: nem tér át az út másik oldalára, nem hajt gyorsan.

<!-- Alapvetően két megközelítés lehetséges az útvonalak definiálásához. Az egyik, hogy a pályaelemeket (amelyek nem a világban elfoglalt helyzetük alapján sorbarendezve kerülnek eltárolásra) sorba rendezzük, kijelölünk egy  -->

A legkézenfekvőbb megoldás, hogy a világban, a világ koordinátáira építve felveszünk vezérpontokat, amelyek kijelölnek egy utat. Ezeket célszerű nem a kódban, hanem valamilyen fájlban tárolni. Az NPC objektum pedig ezt az utat követni. Például a parkoló mellől indul az úton megy fölfele (csökken az y koordinátája) a kanyar előtt (x,y) világkoordinátákat elérve lelassul, (x,y)' koordináták elérése esetén elkezd kanyarodni, a sávból nem tér ki, majd (x,y)" koordinátáig halad a fönti egyenesen. És így tovább.

![](images/npc_route.png)

![](images/npc_route_pedestrian.png)

A feladatban az igazi kihívás, hogy az NPC objektumok adaptálódjanak pályához. Az adaptálódást úgy lehet megkerülni, hogy mindkét pályához készül egy-egy útvonal.

Az NPC autónak nincs hajtáslánc modulja, nem szükséges olyan részletes mozgatás sem mint az vezérelt autónál, de azért a kanyarpontoknál legyen több lépésben megoldva, hogy fokozatosan legyen az autó elforgatva a kanyarodás valósághű leképezése céljából.


### Definition of Done:

- Objektumok előre definiált, értelmes helyen jelennek meg (autók úton, gyalogosok út mellett, a járda környékén)
- Objektumok előre szkriptelt útvonalat követnek
- Gyalogosok az út mentén haladnak, zebrán áthaladnak, megfordulnak majd újra átkelnek az úton
- Autók az utat - sávot - pontosan követik
- NPC objektumok egymás mozgásállapotát nem változtatják meg
    - Egy NPC autó gyalogoson akár átmehet, nem kell ütközésnek minősíteni
- Legalább egy autó végigmegy a pályán
- Legalább egy gyalogos mozog és átkel egy zebrán
- Új (a másik) pálya esetén az NPC objektumok adaptálódnak az új környezethez


## Radar szenzor

Adaptív sebességtartó, automata vészfékező alapjául szolgáló radar szenzor implementációja

* Input: világmodell
* Output:
    * Radar által látott objektumok


### Definition of Done

- 1 db, az autó első lökhárítója mögött elhelyezett radar szenzor
- A látószög (60°) és távolság (200m) által meghatározott területen kérjék el a **releváns** objektumokat
- A háromszög koordinátái az autó helyzetétől függően folyamatosan frissülnek
- debug célra bekapcsolható módon a háromszög legyen kirajzolhatóak **piros** színnel
- Határozzák meg a legközelebbi, sávon belüli (lateral offset alapján) objektum helyzetét
- Az automata vészfékező számára releváns objektumok (az autó középvonala felé halad, látjuk) kiválogatása és visszaadása
- A legközelebbi objektum legyen vizuálisan kiemelve

### Megjegyzések

* A háromszög kirajzolására már kell, hogy legyen elérhető publikus metódus, amely 3 pontot és egy rajzolási színt vár bemenetként
* A világ objektumainak lekérdezésére már kell, hogy legyen elérhető publikus metódus, mely 3 pontot vár bemenetként, ebből kell leválogatni a relevánsakat
* ![](images/radar.png)
* A vészfékezőnek majd ki kell tudnia számolni, hogy az akadály akkor is útban lesz-e még mire az autó odaér, ehhez szükséges az útban levő objektum távolsága és pozíciója (relatívan az autóhoz), ez minden ciklusban lefutva előállítja az objektum pl. gyalogos mozgásvektorát
    * ennek egy fa esetében is működnie kell, csak az nem mozog, mert nem Középföldén vagyunk
* az ACC-hez el kell tudni dönteni, hogy pl. egy autó a vezérelt autó előtt halad-e

