# 1. A szenzorok számára hozzáférés biztosítása a világhoz

Minden szenzor látómezeje egy háromszög. Tetszőlegesen definiálható háromszögbe eső objektumokat kell biztosítani a szenzorok számára (a háromszöget majd definiálják). Szenzorspecifikusan kell tudni vissza adni a kért háromszögbe eső objektumok közül azt, ami az egyes szenzort érdekelheti.

* Input: világmodell
* Output: A 10 darab szenzor számára elérhető interfész(ek), szenzorspecifikus viselkedéssel

## Definition of Done

- Van interfész az egyes szenzorok számára a világ objektumaihoz
- A kamera szenzor helyesen kapja vissza a világból az általa látott elemeket
- A radar szenzor helyesen kapja vissza a világból az általa látott elemeket
- Az ultrahang szenzorok helyesen kapják vissza a világból az általuk látott elemeket


# 2. Ultrahang Szenzorok

Park pilot alapjául szolgáló Ultrasonic Sensor array szimulációjának implementálása.

* Input: világmodell

## Definition of Done

- 8 db - elöl/hátul 4-4 - ultrahang szenzor, egyenként 3 méter látótávolsággal, 100° látószöggel
- A 8 darab háromszög koordinátái az autó helyzetétől függően folyamatosan frissülnek
- debug célra bekapcsolható módon ezek a háromszögek legyen kirajzolhatóak _zöld_ színnel
- A látószög és távolság által meghatározott területen kérjék el az objektumokat
- Az ultrahang szenzor(ok) látómezejében lévő legközelebbi objektum(ok) elérhető(k) a kimeneten
- Határozzák meg a legközelebbi (ütközés szempontjából) objektum pozícióját, kiterjedését, távolságát
- Az ultrahang által relevánsnak tartott objektumok kiemelhetők egy debug kapcsolóval (billentyű vagy debug módba váltás)


## Megjegyzések

* A háromszög kirajzolása lehet sima vonal rajzolással

# 3. Radar szenzor

Adaptív sebességtartó, automata vészfékező alapjául szolgáló radar szenzor implementációja

* Input: világmodell

## Definition of Done

- 1 db, az autó első lökhárítója mögött elhelyezett radar szenzor
- A látószög (60°) és távolság (200m) által meghatározott területen kérjék el az objektumokat
- A háromszög koordinátái az autó helyzetétől függően folyamatosan frissülnek
- debug célra bekapcsolható módon a háromszög legyen kirajzolhatóak _piros_ színnel
- Határozzák meg a legközelebbi, sávon belüli (lateral offset alapján) objektum helyzetét
- Az automata vészfékező számára releváns objektumok (az autó középvonala felé halad, látjuk) kiválogatása és visszaadása

## Megjegyzések

* A háromszög kirajzolása lehet sima vonal rajzolással
* A vészfékezőnek majd ki kell tudnia számolni, hogy az akadály akkor is útban lesz-e még mire az autó odaér, ehhez szükséges az útban levő objektum távolsága és pozíciója (relatívan az autóhoz), ez minden ciklusban lefutva előállítja az objektum pl. gyalogos mozgásvektorát
    * ennek egy fa esetében is működnie kell, csak az nem mozog, mert nem Középföldén vagyunk
* az ACC-hez el kell tudni dönteni, hogy pl. egy autó a vezérelt autó előtt halad-e


# 4. Kamera szenzor implementálása

Sávtartó automatika és táblafelismerő alapjául szolgáló kamera szenzor implementációja. A Sávtartó automatika a nagyobb feladat, ugyanis meg kell tudni határozni a sávot. Az autó előtt levő pályaelemekből kiszámítani, hogy hol vannak a sávot meghatározó vonalak. A sávtartó automatikának arra lesz majd szüksége, hogy az autó közelít-e a sávját meghatározó felfestésekhez.

* Input: világmodell

## Definition of Done

- 1 db, a szélvédő mögé elhelyezett kamera implementálása
- A látószög és távolság által meghatározott területen kérje el az objektumokat
- A háromszög koordinátái az autó helyzetétől függően folyamatosan frissülnek
- debug célra bekapcsolható módon a háromszög legyen kirajzolható _kék_ színnel
- A szenzorok által relevánsnak tartott objektumok kiemelhetők egy debug kapcsolóval (billentyű vagy debug módba váltás)
- Határozza meg a táblafelismerő szempontjából releváns objektumokat (táblákat) pozícióval és távolsággal
- Határozza meg a sávtartó szempontjából releváns objektumokat (utak)
- Határozza meg a sávot és számítsa ki a sáv változását (pl. kanyarodni fog, merre milyen szögben)

<!-- - A kamera szenzor a látható sávok összes adatát visszaadja(hány sáv, melyikben vagyunk, azon belül milyen távolságra a szélektől)
- A kamera szenzor a látott táblák közül a legközelebbi összes adatát visszaadja (milyen tábla, milyen messzire van) -->


## Megjegyzés

* A háromszög kirajzolása lehet sima vonal rajzolással
* A kamerának előre kell látnia, ha az út kanyarodni fog, azt is, hogy merre fog kanyarodni és erről a sávtartó automatikának használható információt kellene előállítani
* Továbbá figyelni kell, hogy az autó hol lesz a következő időpillanatban (pl. másodperc múlva). Az ábrán a kék nyilak szemléltetik és ha ezek metszik a görbéket, akkor a sávtartó automatikának közbe kell avatkoznia (az ábra szerint balra kell kormányozni)

![](images/camera_lanekeeping.png)


# 5. Ütközés detekció és mozgásállapot-változás szimuláció

* Input: világmodell
* Output: esemény kiváltása ütközések bekövetkezésekor (ez írja le, hogy mik ütköztek); új mozgásállapot minden mozgó, ütköző objektumnak

## Definition of Done

- A vezérelt autó - tereptárgy ütközésének detektálása és esemény kiváltása
- A vezérelt autó - NPC-vel való ütközésének detektálása és esemény kiváltása
- Mozgó objektumok érintkezésének pozíció és dimenzióhelyes detekciója és kommunikációja megvalósult
- Mozgó és statikus objektumok érintkezésének pozíció és dimenzóhelyes detekciója és kommunikációja megvalósult
- Az objektumok mozgásállapota az energiamegmaradás törvényeinek megfelelően változik (gyorsul, lassul, irányt vált, megáll)
    - Ha a vezérelt autó nekimegy egy NPC autónak akkor ez legyen rá hatással (lassuljon le)
    - Ha a vezérelt autó nekimegy egy „stabil” tereptárgynak (pl. fa), akkor álljon meg, érjen véget a játék, egy táblán azonban át tud menni (el tudja sodorni), lassuljon le
- Az objektumok sérülnek, megsemmisülnek, amennyiben túl nagy energiával ütköznek
- Ha a vezérelt autó elüt egy gyalogost, akkor érjen véget a játék
- A játék véget ér, ha a játékos ütközés következtében mozgásképtelenné válik (sebessége 0-ra csökken, vagy megsemmisül)

### Megjegyzések

* Az NPC - NPC ütközés nem fontos, tehát NPC autó ha átmegy a gyalogoson nem kell, hogy kiváltson különösebb reakciót
* Ugyanígy az NPC - tereptárgy ütközés sem túl magas prioritású, ugyanis ha az NPC jól van szkriptelve, nem fog letérni az útról és nekimenni a fának
* jellemző medolgásként az _egocar_ szokott kapni egy sérülés/élet értéket a mozgásképtelenséghez


# 6. Világ populálása mozgó NPC objektumokkal

* Input: Világmodell
* Output: Mozgó/álló objektumok, gyalogosok, (biciklisek,) autók. Szkriptelt útvonalak, mozgások megvalósítása, a megvalósított objektumok a modellbe illesztése
* Challenge: a világ kialakításának felelősével egyeztetés, NPC objektumok típusairól

### Definition of Done

- NPC autó képes végigmenni a pályán: a kanyar előtt lelassít, sávban maradva, _valósághűen_ kanyarodik
    - legalább 1 autó képes körözni a pályán
- Objektumok előre definiált, értelmes helyen jelennek meg (autók úton, gyalogosok út mellett/járdán)
- Objektumok előre scriptelt útvonalat követnek
- Autók az utat - sávot - pontosan követik
- Új pálya esetén az NPC objektumok adaptálódnak az új környezethez
- NPC objektumok egymás mozgásállapotát nem változtatják meg
- Legalább egy autó végigmegy a pályán
- Legalább egy gyalogos mozog és oda-vissza átkel egy zebrán

### Megjegyzések

* Feltételezhető az NPC-k szabálykövető viselkedése: nem hajt gyorsan, nem tér le az útról, nem ütközik fának.
* A gyalogoson -egyelőre- átmehet, nem kell ütközésnek/gázolásnak minősíteni.
* Szkriptelt útvonal alatt azt értjük, hogy a világ koordinátáira építve bele van égetve a kódba (esetleg egy konfig fájlba), hogy az autó hogyan mozogjon. Például a parkoló mellől indul az úton megy fölfele (csökken az y koordinátája) a kanyar előtt (x,y) világkoordinátákat elérve lelassul, (x,y)' koordináták elérése esetén elkezd kanyarodni, a sávból nem tér ki, majd (x,y)" koordinátáig halad a fönti egyenesen. És így tovább.
* Az érdekes ugyanis az, hogy az _egocar_ (vezérelt autó) hogyan viselkedik egy mozgó objektumra, másik autó (nem megy neki), gyalogos (nem üti el), az NPC-ket nem kell túlbonyolítani, ha marad idő, akkor az NPC jármű se üssön el gyalogost.
