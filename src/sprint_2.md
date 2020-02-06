# 1. Ultrahang Szenzorok

Park pilot alapjául szolgáló Ultrasonic Sensor array szimulációjának implementálása.

* Input: világmodell
* Output:
    * Ultrahang szenzor által látott objektumok

### Definition of Done

- 8 db ultrahang szenzor, egyenként 3 méter látótávolsággal, 100° látószöggel
- A 8 darab háromszög koordinátái az autó helyzetétől függően folyamatosan frissülnek
- debug célra bekapcsolható módon ezek a háromszögek legyen kirajzolhatóak **zöld** színnel
- A látószög és távolság által meghatározott területen kérjék el a **releváns** objektumokat
- Határozzák meg a legközelebbi (ütközés szempontjából) objektum pozícióját, kiterjedését, távolságát
- A legközelebbi objektum legyen vizuálisan kiemelve

### Megjegyzések

* A háromszög kirajzolására már kell, hogy legyen elérhető publikus metódus, amely 3 pontot és egy rajzolási színt vár bemenetként
* A világ objektumainak lekérdezésére már kell, hogy legyen elérhető publikus metódus, mely 3 pontot vár bemenetként, ebből kell leválogatni a relevánsakat
* ![](images/ultrasonic.png)


# 2. Kamera szenzor implementálása, Ütközés detekció és mozgásállapot-változás szimuláció

Sávtartó automatika és táblafelismerő alapjául szolgáló kamera szenzor implementációja. A Sávtartó automatika a nagyobb feladat, ugyanis meg kell tudni határozni a sávot. Az autó előtt levő pályaelemekből kiszámítani, hogy hol vannak a sávot meghatározó vonalak. A sávtartó automatikának arra lesz majd szüksége, hogy az autó közelít-e a sávját meghatározó felfestésekhez.

* Input: világmodell
* Output:
    * Kamera által látott objektumok
    * esemény kiváltása ütközések bekövetkezésekor
       * ez írja le, hogy mik ütköztek
       * ??? új mozgásállapot minden mozgó, ütköző objektumnak

## Definition of Done

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


## Megjegyzés

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


# 3. Világ populálása mozgó NPC objektumokkal

* Input: Világmodell
* Output: Mozgó NPC objektumok, gyalogosok, biciklisek, autók. szkriptelt útvonalak, mozgások megvalósítása, a megvalósított objektumok a modellbe illesztése
* Challenge: adaptálódás pályához

### Definition of Done:

- Objektumok előre definiált, értelmes helyen jelennek meg (autók úton, gyalogosok út mellett/járdán)
- Objektumok előre szkriptelt útvonalat követnek
- Gyalogosok az út mentén haladnak, zebrán áthaladnak
- Autók az utat - sávot - pontosan követik
- NPC objektumok egymás mozgásállapotát nem változtatják meg
- Legalább egy autó végigmegy a pályán
- Legalább egy gyalogos mozog és átkel egy zebrán
- Új pálya esetén az NPC objektumok adaptálódnak az új környezethez

### Megjegyzések
* NPC = _non player character_ (itt akár _car_ is lehet)
* Feltételezhető az NPC-k szabálykövető és értelemszerű viselkedése: nem hajt gyorsan, nem tér le az útról, nem ütközik fának.
* A gyalogoson akár átmehet, nem kell ütközésnek minősíteni.
    *  Az érdekes ugyanis az, hogy az egocar (vezérelt autó) hogyan viselkedik egy mozgó objektumra, másik autó (nem megy neki), gyalogos (nem üti el), az NPC-ket nem kell túlbonyolítani
* Szkriptelt útvonal alatt azt értjük, hogy a világ koordinátáira építve bele van égetve a kódba (esetleg egy konfigurációs fájlba), hogy az autó hogyan mozogjon. Például a parkoló mellől indul az úton megy fölfele (csökken az y koordinátája) a kanyar előtt (x,y) világkoordinátákat elérve lelassul, (x,y)' koordináták elérése esetén elkezd kanyarodni, a sávból nem tér ki, majd (x,y)" koordinátáig halad a fönti egyenesen. És így tovább.
* a kanyarodás legyen a lehető legvalósághűbb, akár a vezérelt autó esetében.


# 4. Radar szenzor

Adaptív sebességtartó, automata vészfékező alapjául szolgáló radar szenzor implementációja

* Input: világmodell
* Output:
    * Radar által látott objektumok


## Definition of Done

- 1 db, az autó első lökhárítója mögött elhelyezett radar szenzor
- A látószög (60°) és távolság (200m) által meghatározott területen kérjék el a **releváns** objektumokat
- A háromszög koordinátái az autó helyzetétől függően folyamatosan frissülnek
- debug célra bekapcsolható módon a háromszög legyen kirajzolhatóak **piros** színnel
- Határozzák meg a legközelebbi, sávon belüli (lateral offset alapján) objektum helyzetét
- Az automata vészfékező számára releváns objektumok (az autó középvonala felé halad, látjuk) kiválogatása és visszaadása
- A legközelebbi objektum legyen vizuálisan kiemelve

## Megjegyzések

* A háromszög kirajzolására már kell, hogy legyen elérhető publikus metódus, amely 3 pontot és egy rajzolási színt vár bemenetként
* A világ objektumainak lekérdezésére már kell, hogy legyen elérhető publikus metódus, mely 3 pontot vár bemenetként, ebből kell leválogatni a relevánsakat
* ![](images/radar.png)
* A vészfékezőnek majd ki kell tudnia számolni, hogy az akadály akkor is útban lesz-e még mire az autó odaér, ehhez szükséges az útban levő objektum távolsága és pozíciója (relatívan az autóhoz), ez minden ciklusban lefutva előállítja az objektum pl. gyalogos mozgásvektorát
    * ennek egy fa esetében is működnie kell, csak az nem mozog, mert nem Középföldén vagyunk
* az ACC-hez el kell tudni dönteni, hogy pl. egy autó a vezérelt autó előtt halad-e

