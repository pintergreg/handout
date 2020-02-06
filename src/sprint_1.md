# Világ(modell) kialakítása

* Input: virtuális világot leíró JSON állomány(ok)
* Output: Modellezett világ: mozgó/álló, áthajtható, ütközhető, tömeggel, mérettel rendelkező objektumok, koordináta-rendszerben, olyan interfészek (API) kialakítása, amely biztosítja a későbbiekben többi csapat számára a világmodellhez való legkézenfekvőbb hozzáférést a későbbi sprintek feladatit is figyelembe véve
* Challenge: „mindenki erre vár”, az interfésznek mielőbb stabilnak kell lennie, akkor is, ha az implementáció még nincs meg, prioritások és „nyomás” kezelése, a megjelenítésért felelős csapat számára a lehető leggyorsabban kód szinten biztosítani a kirajzolandó objektumok alap tulajdonságait.


## Definition of Done

- Útelemeket, fákat, táblákat egyéb statikus objektumokat leíró állomány feldolgozása
- Hierarchikus objektummodell implementálása világ leírására, API biztosítása ennek elérésére
- Objektumok kiterjedését biztosító poligonok definiálása
    - ez nem azonos a kép széleivel
- Minden feldolgozott objektum rendelkezzen pozíció, referencia, orientáció, típusadatokkal
- Heterogén kollekció lehetőségének biztosítása
- A modell legyen felkészítve az input fájlból kiolvasott „statikus” objektumokon túl mozgó („dinamikus”) objektumok kezelésére is
    - vezérelt autó, NPC (non-player-character) autó, gyalogos
- A modell tegyen különbséget azon objektumok között amelyeknek egy jármű nekimehet és amelyeknek nem (fa vs. útelem)
- A modell kezeljen „z-index”-et, hogy a kirajzolás során biztosítható legyen, hogy mely elemet kell előtt kirajzolni a „kitakarások” végett


## Megjegyzések

* Mielőbb el kell dönteni, hogy milyen koordináta-rendszerben dolgozik majd a modell
    * A döntést a megjelenítésért felelős csapattal **együtt** kell meghozni!
* A tárolandó értékek között a _referencia_ a képfájl forgatási referenciapontjára vonatkozik, [lásd jegyzet](https://szfmv2020-tavasz.github.io/handout/virtual_world.html#az-%C3%BAt-elemek-viszony%C3%ADt%C3%A1si-pontjai).
* Teljesen járható út, hogy a modell, az input állományban található koordináta-rendszer egy az egyeben alkalmazásra kerül, ebből adódóan minden számolás abban történik, csak a megjelenítés transzformálja át.
* A fa esetében csupán a törzsének lehet nekimenni, nem a lombkoronának, ezért a modellt ekképpen kell megalkotni! A törzsnek használható egy szabályos hasáb az egyszerűség kedvéért.
    * ![](https://raw.githubusercontent.com/szfmv2019-tavasz/handout/master/src/images/tree_collidable.png)
* Az autó is egyszerűsíthető, nem kell a grafikai elemet teljes mértékben követni.
    * ![](https://raw.githubusercontent.com/szfmv2019-tavasz/handout/master/src/images/car_simplified_polygon_model.png)
* A kanyarodó útelemeknél is lehet egyszerűsítést használni.
    * ![](https://raw.githubusercontent.com/szfmv2019-tavasz/handout/master/src/images/90left_polygon.png)
* A szűréshez használt háromszög esetében a poligonokat kell figyelembe venni, pl. fa törzse, tábla rúdja, de nem csak az „ütközhető” objektumokat kell tudni visszaadni, hanem az útelemeket is. A 2. sprintben a szenzorok majd válogatnak, hogy mire van szükségük ezekből.
    * ![](https://raw.githubusercontent.com/szfmv2019-osz/handout/master/src/images/model_interface.png)
* A poligonok definiálásához célszerű a [java.awt.geom](https://docs.oracle.com/en/java/javase/11/docs/api/java.desktop/java/awt/geom/package-summary.html) névteret használni. Ezek `intersects` könnyedén eldönthető, hogy egy objektum a szenzor látóterében van-e (amennyiben a szenzor is egy ilyen poligon).


# Vizualizáció

* Input: Objektummodell (modellezett világ), pontosabban annak elégséges metszete. A rajzoláshoz elegendőek az világot leíró állományban megtalálható adatok, nem kell megvárni a teljes modell elkészültét
* Output: Illeszkedő, résmentes megjelenítése, 24 FPS-el frissülő, folyamatos mozgás
* Challenge: Az objektumtranszformációk megfelelő végrehajtása, az objektummodellért felelős csapattal egyeztetés az objektumok elérését illetően

## Definition of Done

- A kirajzolt világ egy része látható csak állandóan a programablakban, a „kamera” a vezérelt autót (egocar) követi
    - világ széleinek kezelése
- statikus objektumok pozícióhelyes kirajzolása és illesztése a rendelkezésre álló építőelemekből
- mozgó objektumok helyes kirajzolása
- debug célból meg kell tudni jeleníteni az egyes objektumokhoz definiált poligonokat
- interfészt kell biztosítani, hogy egy megcímzett objektum poligonja eltérő színnel jelenhessen meg (ha kijelölésre kerül)
- interfészt kell biztosítani a szenzorok látóterét jelképező háromszögek opcionális megjelenítésére
- a megjelenés villódzásmentes és folyamatos legyen


## Megjegyzések

* A programablaknak az alábbi módon nézni majd ki. A kezdeti kód ezt a felosztást már támogatja, tartalmaz két JPanel-t, ebből a `CourseDisplay`re kell a világ objektumait kirajzolni. Pontosabban az a „viewport”, amit a kamera lát, mögötte ott lehet a többi objektum.
    - ha szükséges egyéb panel definiálható, de a műszerfal (dashboard) működését nem lehet megzavarni
    - ![gui_plan](https://raw.githubusercontent.com/szfmv2019-tavasz/handout/master/src/images/gui_plan_course_display.png)
* A kiadott kód csak példa alap GUI készítésére, ha a feladat úgy kívánja átírható, más rajzoló metódusok vagy logika is használható, de figyelni kell arra, hogy ez esetben minden érintett csapat tudjon a módosításokról. _Mindenek előtt a műszerfalért felelős csapat!_
* Az IntelliJ IDEA GUI Designer-e *nem* használható!


# Human Machine Interface (HMI): Műszerfal, irányítás

* Input: a billentyűzet
* Output:
    - PRND váltó(fel-le), gáz és fék 0-100 skála, kormányállás tetszőlegesen választott skála index, billentyűleütés alapján
    - Fordulatszám, sebesség, kormány, gáz, fék, sebességváltó állása, irányjelző visszajelző, kocsi pozíció megjelenítése (x, y koordináta, az autó rajzolását a vizualizáció végzi, ez egy debug funkció)

## Definition of Done

- a fék- és gázpedál állapota szabályozható
- fék- és gázpedál valamint a kormány sem binárisan működik, a billentyű nyomva tartás idejétől függ az input intenzitása
- fék- és gázpedál valamint a kormány is fokozatosan áll vissza alaphelyzetbe a billentyű felengedésével
- az automata váltó 4 állapota szabályozható
    - szekvenciális váltóról lévén szó, sorban állíthatók a fokozatok: P(ark), R(everse), N(eutral), D(rive)
    - alaphelyzet: P, „felváltás” után R, majd N, majd D. „Leváltás” ugyanez visszafele.
- ACC: Állítható céltávolság (T jelű gombbal, körkörösen 0.8/1.0/1.2/1.4 másodperc)
- ACC: Állítható célsebesség (+/- gombbal, 30-160, 10-es lépésközzel)
- Lane Keeping bekapcsolás
- Parkig pilot bekapcsolás
- irányjelző (jobb, bal) kapcsolható
- egyszerre több billentyű is használható
    - kanyarodni és gázt adni/fékezni minimum kell tudni egyszerre
- Megjelenik a fordulatszám mint „analóg óra”
- Megjelenik a sebesség mint „analóg óra”
- Megjelenik a kormányállás
- Megjelenik a gáz, fék állapota (progressbar)
- Megjelenik a sebességváltó állása (szövegesen)
- Irányjelző visszajelző (egy-egy nyíl kirajzolva)
- Kocsi pozíció megjelenítése (x, y koordináta debug céllal, szövegesen)
- Vezetéstámogató funkciók visszajelzései
    - ACC idő és sebesség limit
    - parking pilot és a lane keeping rendszerek állapot visszajelzése
- az utolsó látott tábla megjelenítése
    - interfész biztosítása, az utolsó látott tábla beállítására

## Megjegyzések

- Az input manager és a műszerfal között az értékeket a buszon kell közölni
- Az utoljára látott táblához legyen definiálva egy csomag, amely ha megjelenik a buszon, akkor a csomag által kijelölt tábla megjelenik a műszerfalon
    - később a táblafelismerő majd kiküld ilyen csomagot ha amikor szükséges
    - talán célszerű ha van egy „nincs tábla állapot is”
- A fordulatszám és a sebesség megjelenése „analóg óraként” történjen, de nem szükséges újra feltalálni a kereket.
- A programlaknak az alábbi módon kell kinéznie. A kezdeti kód ezt a felosztást már támogatja, tartalmaz két JPanel-t, ebből a Dashboard-ra kell a visszajelzőket elhelyezni.
    - ![gui_plan](https://raw.githubusercontent.com/szfmv2019-tavasz/handout/master/src/images/gui_plan.png)
- Az IntelliJ IDEA GUI Designer-e *nem* használható!


# Hajtáslánc és kormányzás

- Input: VFB-ról kormányállás, sebességváltó, gáz- és fékpedál állása (ezeket az input csapat állítja be)
- Output:
    - Sebességváltó állásától függő mozgásállapot (vagy nem-mozgás) megvalósítása (PRND)
    - Gyorsulás/lassulás számítása gáz/fék alapján
    - fordulókör meghatározás, kanyarodás
    - teljes elmozdulás vektor kiszámolása
- Challenge:
    - irányítást implementáló csapattal egyeztetés az inputt értékekről (packet-ekről)


## Definition of Done

- Az autó gázpedál állásától függően gyorsul
- A gyorsulás a „belső fokozatok” szerint kerül meghatározásra
- Az autó a gázpedál felengedésével fokozatosan lassul, amjd megáll
- Az autó R válóállásban tolat
- Felkészíteni a modult, hogy a vészfékező, az adaptív tempomat vagy a parkoló asszisztens is küldhet inputot, melyek magasabb prioritásúak
    - vészfékező értelemszerűen fékezés inputot
    - az adaptív tempomat és a parkoló asszisztens gáz és fék inputot is
- Buszról érkező kormányállás felhasználása
- Autó kanyarodásának biztosítása valóságos fordulókör szerint
    - ehhez szükséges extra tulajdonságot meghatározása
- Tényleges mozgásvektor meghatározása a motor csapat gyorsulás, lassulás értékének felhasználásával
- A meghatározott mozgásvektor alapján az autó pozíciójának frissítése
    - az AutomatedCar osztály x,y koordinátáinak frissítése
- Tolatás során is valósághű kanyarodás történik
- Felkészíteni a modult, hogy a sávtartó automatika vagy a parkoló asszisztens is küldhet kormányzás inputot

## Megjegyzések

- A 3. sprintes beavatkozásokhoz (LKA, AAC, AEB, PP) definiálni kell az kommunikációs csomagot
- Valamint figyelni, hogy ha ilyen érkezik a buszon, akkor azt magasabb prioritású inputként elfogadni
