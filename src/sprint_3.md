# 1. Automata parkolás

* Input: Ultrahang szenzorok
* Output: parkolási manőver végrehajtása

### DoD

- Indexkapcsoló állása alapján parkolóhely keresés jobbra vagy balra
- Autó méretének megfelelő hely beazonosítása
- Megtalált parkoló jelzése, a hely információinak buszra írása (packet-tel)
- A parkolóhely megtalálásához szükséges NPC-k példányosítása
- A parkolás megkezdése külön inputhoz kötött (van erre vonatkozó gomb a műszerfalon, inputtól meg billentyűesemény)
- A kormány és gáz/fék vezérlésével beparkolás a talált helyre
- Párhuzamos parkolás sikeres (ütközés nélkül megtörténik)
- Sofőr beavatkozására (fék, gáz, kormány) kikapcsolás (megszűnik az automata vezérlés)

### Megjegyzések

* Még a sofőr vezet a parkolóig, megáll az autósor mellett aktiváltja a parkolóhely keresést (kell valami input a billentyűzetről) ekkor továbbra is "emberi" irányítással el kell haladni a parkolóhelyek mellett és ki kell számolni a szabad hely méretét. Amikor megvan az alkalmas hely, akkor visszajelzést kell adni és a hely dimenziót és az autóhoz viszonyított helyzetét le kell tudni írni.
* Az autónak elérhető a referenciapontja (továbbá ismert a szélessége és a hosszúsága), a autóhoz (referenciaponthoz) viszonyítva legyen leírva a parkolóhely.
* Ami a parkolóhely hosszát illeti, nem a felfestett parkolóhely hosszát kell lemérni (azt nem is lehet az ultrahang szenzorral), hanem a szabad parkolóhelyet közrefogó két parkoló autó által szabadon hagyott helyet (amely akár két felfestésnyi is lehet).
* A szabad hely szélessége ha egyéb akadályt - pózna (`bollard.png`) vagy fa - nem tesztek külön emiatt, támpontként a pályára, akkor a a szenzor látótávolsága, azaz 3 méter.
* a szabad helyhez egy referenciapontot kell (érdemes) társítani, pl. a helyet leíró téglalap bal felső pontja (ábrán így van) és az autó középpontjával és ezzel a ponttal (ebből számolható a távolság) valamint a hely dimenzióival kielégítően jellemezve van a parkoló hely.
* Ez tartalmazza az autó referenciapontját (középpont) és a pakolóhelyet leíró négyzet referenciapontját ezekből számítható a távolságuk.
* (Ha más nem próbálgatásos módszerrel) ki kell tapasztalni, hogy a szükséges "párhuzamos parkolás" manőver hogyan vihető végbe a vezérelt autó irányítószerveivel, majd ezt le kell automatizálni: pl. le kell írni, kormány jobbra teker 100-ra, gáz 25% 1,5s-ig, majd kormány balra 75, gáz 20% 1.25s-ig.
* A programozott vezérlést a buszon keresztül kapott szabad helyet leíró adatok függvényében kell elindítani
* ha szükséges az autóval tolatni is kell a manőver megkezdéséhez, mivel a detektálás során túlmehetünk az ideális pozíción, ahonnan a leprogramozott manőver ütközés nélkül beparkol.

![](images/parking_horizontal.png)
![](images/find_parking_place_horizontal.png)
![](images/parking_place_found_horizontal.png)

# 2. Sávtartó automatika és táblafelismerés

* Input: Kamera szenzor
* Output:
    - Sávot beavatkozás nélkül követi a vezérelt autó
    - Az utolsó látott tábla megjelenik a HMI-n

## Definition of Done

- 45 foknál enyhébb kanyarodású úton a kocsi a sáv szemmel láthatóan a sáv közepén marad
- Ha el kell engednie a kontrollt (az automatika számára kezelhetetlen forgalmi szituáció következik, pl. éles kanyar, kereszteződés), vizuális figyelmeztetést ad
- Ha újra elérhető a funkció (pl. elhagytuk a kanyart) vizuális indikáció (a műszerfalon)
- Sávtartó automatika be- és kikapcsolható
    - emberi beavatkozásra kikapcsol
- az utolsó látott, releváns tábla megjelenik a műszerfalon
- az utolsó sebességkorlátozás kiírásra kerül a buszra

## Megjegyzések

* a tábla megjelenítésére kész interfész van a műszerfaltól, csak meg kell hívni, ha a detektálás megtörtént

![](images/lka.png)

Sávon belüli mozgás: a LKA működése egy enyhe sávon belüli cikázást eredményez.

![](images/lka_wave.png)


# 3. Adaptív tempomat

* Input:
    - radar szenzor
    - NPC autók

Adaptív tempomat funkció megvalósítása - a kiválasztott célobjektum (autó előtt haladó NPC) sebességéhez igazítja a gyorsabb saját sebességet, vagy tartja a sofőr által kiválasztott sebességhatárt, ha nincs cél.

## Definition of Done

- Bekapcsolható, reagál az állapotváltás, alapértelmezetten az aktuális sebesség, de min célsebesség 30 km/h
- ha nincs saját sávban autó, a játékos autó tartja a kiválasztott célsebességet
- ha saját sávban található autó:
    - a saját jármű felveszi a sebességét, ha lassabb
    - tartja a kiválasztott sebességet, ha gyorsabb
- fékezésre kikapcsol
- AEB beavatkozásra kikapcsol
- Ha speed limitet talál a buszon, azt alkalmazza új célsebességként, amíg a sofőr felül nem írja

## Megjegyzések

* Szabad feltételezni, hogy az NPC kezelés nem, vagy nem időben készül el, lesz elérhető (kerül be a masterba)
* Ezért célszerű a felhasználó/vezető által megadott sebességhez igazodással kezdeni, ennek akkor is működnie kell, ha nincs NPC a pályán
* A modul olyan triggerekkel vezérelheti az autót mint amilyenek a billentyűlenyomás kezelőtől jönnek (gáz, fék)
    * de figyelni kell, hogy a tényleges billentyűtől érkező inputok felülírják a funkciót

![](images/acc.png)

* Oda kell figyelni, hogy csak a sávban előttünk haladó autót vegye figyelembe, a szembejövőt ne


# 4. Vészfékező

Automata vészfékező rendszer megvalósítása, maximum 9 m/s^2 lassulással

* Input: radar szenzor

## Definition of Done

- Elkerülhető ütközés esetén vizuális figyelmeztetés a sofőrnek
- ha a sofőr nem avatkozik közbe, automatikus fékezés (az utolsó pillanatban, ahol az ütközés még elkerülhető)
- az automatikus fékezés mértéke a sebességgel arányos, de nem lehet 9 m/s^2-nél nagyobb
- 70 km/h felett figyelmeztetés, hogy az AEB nem tud minden helyzetet kezelni
- Nincs nem releváns objektumokra való fékezés (fals pozitív) - pl. szembejövő autó
- Gyalogosra, fára megáll a kocsi

## Megjegyzések

* A radar vissza kell adja az autó előtt levő legközelebbi releváns objektum adatait (táv, sebesség), ezekkel lehet számolni
* A távolságból és az autó sebességéből meghatározható, hogy milyen lassulást kell adni az autónak, hogy még megálljon, de ne lépje túl a 9 m/s^2-et
    * a gyorsítási/fékezési input nem gyorsulásban van, hanem pedállás mértékben. Ebből elvileg egyszerűen nem nyerhető ki a gyorsulás, viszont a gyorsulás az egy másodperc alatti sebesség változás, ami viszont kiszámolható t(n) - t(n-1) módon
* A modul olyan triggerekkel vezérelheti az autót mint amilyenek a billentyűlenyomás kezelőtől jönnek (gáz, fék)
    * de figyelni kell, hogy a tényleges billentyűtől érkező inputok felülírják a funkciót

![](images/radar_aeb.png)

