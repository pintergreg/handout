# 1. Sprint


## Human Machine Interface (HMI): Műszerfal, irányítás

A *HMI* modul felelőssége a vezérelt autó (egocar) kezelőszerveinek és visszajelzőinek megvalósítása. Bemeneti jelként kezelnie kell tehát a billentyűeseményeket, le kell őket fordítani az autó vezérlőszerveire, valamint a műszerfalon meg kell jeleníteni az egocar állapotát leíró értékeket.

A modul kihívása a „bináris állapotú” billentyűesemények „fokozatossá tétele”. A gáz- és fékpedál nyomvatartásának idejét kell leképezni a pedál lenyomás mértékére és egy adott idő alatt kell ennek 100%-ra jutnia. A hajtáslánc a pedálok lenyomásának mértékét használja majd a gyorsítás - és úgy általában az elmozdulás mértékének - meghatározásához.
A pedálokhoz hasonlóan a kormány elfordítása sem bináris, ugyanúgy a billentyűlenyomás idejének felhasználásával kell számolni. Ezek skáláját a hajtásláncért modullal egyeztetve kell meghatározni (pl. pedálállás lenyomás 0-100 között).

A szimulált autó automata váltóval rendelkezik, így a váltó *P*, *R*, *N*, *D* állapotait is is közvetíteni kell a hajtáslánc felé.

A műszerfalnak az alábbi vázlathoz hasonlóan kell felépülnie. A programablak bal oldalán a virtuális világ egy szeletét látjuk ezért felel, a vizualizációs modul. A jobb oldalon a műszerfal található. A műszerfalon nincsenek vezérlőelemek, csak megjelenítés. Az összes kapcsoló a billentyűzettel állítható, a grafikus elemeknek nem kell pl. egérrel kapcsolhatónak lenniük.

![gui_plan](images/gui_plan_dashboard.png)

A fordulatszám és a sebesség legyen egy analóg órával reprezentálva; a kormány elforgatás, a gáz- és fékpedál állása progressbar-okkal szemléltethető. Az irányjelző visszajelzője és a vezetéstámogató funkciók visszajelzői lámpaszerűek, a sebességváltó állása, és a debug értékek pl. kocsi pozíciója (x, y koordináta) lehet szöveges.

Az utoljára látott tábla -csak úgy mint a többi vezetéstámogató funkció- ugyan csak a 3. sprintben lesz kihasználva, de már most biztosítani kell a visszajelzését. A buszon közölt „utoljára látott tábla” képét ki kell tudni rajzolni (a képek rendelkezésre állnak). Legyen elkülönítve a nincs tábla eset is.


### Definition of Done

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
    - akár elforgatott kormánykerékként, de minimum szövegként
- Megjelenik a gáz, fék állapota (progressbar)
- Megjelenik a sebességváltó állása (szövegesen)
- Irányjelző visszajelző (egy-egy nyíl kirajzolva)
- Kocsi pozíció megjelenítése (x, y koordináta debug céllal, szövegesen)
- Vezetéstámogató funkciók visszajelzései
    - ACC idő és sebesség limit
    - parking pilot és a lane keeping rendszerek állapot visszajelzése
- az utolsó látott tábla megjelenítése
    - interfész biztosítása, az utolsó látott tábla beállítására
- F1 billentyű lenyomására üzenetablak megjelenítése a vezérlőbillentyűket felsoroló súgóval


## Világ(modell) kialakítása

A *világmodell* modul felelőssége a játék virtuális terének felépítése, az abban található elemek Objektum Orientált elveknek megfelelő hierarchiába szervezése, a virtuális tér elemeivel való interakciót biztosító (publikus) metódusok implementálása.

A modul bemenete a világ statikus elemeit tartalmazó állomány, amely XML és JSON formátumban is rendelkezésre áll. Ez a leíró fájl azonban csupán az objektumok síkbeli helyzetét, elforgatását és típusát tartalmazza. A modul felelőssége a többi modul igényeivel összhangban az objektumok további tulajdonságokkal történő felruházása. Például a rajzolást megkönnyítő *Z index* vagy az objektum térbeli kiterjedését szolgáló poligon definiálása.

A modullal kapcsolatos legfontosabb kihívás, hogy más csapatoktól érkező igényeket is teljesíteni kell, és „mindenki ezekre vár”. Így különösen fontos kezelni a sprinten belüli határidőket és prioritásokat. Például a deszerializált világobjektumok az első pillanattól kezdve szükségesek a megjelenítésért felelős csapat számára.
Valamint, hogy minden tervezési döntés érinti a többi csapatot is, még ha ők ennek nincsenek is mindig tudatában.

- Mielőbb el kell dönteni, hogy milyen koordináta-rendszerben dolgozik majd a modell.
Teljesen járható út, hogy a modell, az input állományban található koordináta-rendszer egy az egyeben alkalmazásra kerül, ebből adódóan minden számolás abban történik, csak a megjelenítés transzformálja át. (A teljes világ nem fog kiférni a képernyőre.)
- El kell dönteni, hogy mi legyen az objektumok referenciapontja. A megjelenítés során forgatni kell az objektumokat, a [forgatási pont](virtual_world.md#az-%C3%BAt-elemek-viszony%C3%ADt%C3%A1si-pontjai) nem egyezik meg a referenciaponttal, de a megjelenítésnek szükséges.
- A világ objektumokhoz poligonokat kell társítani, ezek szolgálnak majd az ütközés valamint a látótérbe kerülés eldöntésére.
- Fontos továbbá, hogy ezek a poligonok nem a képfájl szélei. A fa esetében csupán a törzsének lehet nekimenni, nem a lombkoronának, ezért a modellt ekképpen kell megalkotni! A törzsnek használható egy szabályos hasáb az egyszerűség kedvéért.
    - ![](images/tree_collidable.png)
- Az autó is egyszerűsíthető, nem kell a grafikai elemet teljes mértékben követni.
    - ![](images/car_simplified_polygon_model.png)
- A kanyarodó útelemeknél is lehet egyszerűsítést használni.
    - ![](images/90left_polygon.png)
- A szűréshez használt háromszög esetében a poligonokat kell figyelembe venni, pl. fa törzse, tábla rúdja, de nem csak az „ütközhető” objektumokat kell tudni visszaadni, hanem az útelemeket is. A 2. sprintben a szenzorok majd válogatnak, hogy mire van szükségük ezekből.
    - ![](images/model_interface.png)
- A poligonok megrajzolásához használható a [VGG Image Annotator](https://www.robots.ox.ac.uk/~vgg/software/via/), amely [böngészőből is működik](https://www.robots.ox.ac.uk/~vgg/software/via/via.html) és a megrajzolt polygont JSON-ben le lehet menteni.
    - Korábbi félév során @ArchiCat és @konyarilaszlo ezt már megtette, elérhető a [worldobject_polygons.json](resources/worldobject_polygons.json) állományban.
- A poligonok definiálásához célszerű a [java.awt.geom](https://docs.oracle.com/en/java/javase/11/docs/api/java.desktop/java/awt/geom/package-summary.html) névteret használni. Ezek `intersects` könnyedén eldönthető, hogy egy objektum a szenzor látóterében van-e (amennyiben a szenzor is egy ilyen poligon).
- A statikus objektumokon kívül a világ modell részét kell képezzék dinamikus, mozgó objektumok is.

A tervezés során nem elegendő csupán az első sprint (meglehetősen szűk) követelményit figyelembe venni, hanem célszerű ezen túl a későbbi sprintek során valamennyi *user story*-ban felbukkanó követelmény kezelése. Természetesen nem elvárás a „jövőbe látás”, de törekedni kell minden logikusan előrelátható követelmény kezelésére.


### Definition of Done

- Útelemeket, fákat, táblákat egyéb statikus objektumokat leíró állományok feldolgozása (deszerializálása)
    - kicsi pálya (test_world) és elemeinek megfelelő kezelése
    - nagy pálya (test_world_1kmx1km) és elemeinek megfelelő kezelése
    - ovális pálya (oval) és elemeinek megfelelő kezelése
- Objektummodell implementálása világ leírására
    - A skeleton World objektuma a tartalmazza a felépített világot, pl. egy heterogén WorldObjects gyűjteményben
- Objektumok kiterjedését biztosító poligonok beolvasása
- Minden feldolgozott objektum rendelkezzen pozíció, referencia, orientáció, típusadatokkal
    - legyen olyan tulajdonság is, amellyel egyszerűen kiválogatható, hogy valaminek neki lehet menni (pl. fa) vagy nem (úttest)
- A modell legyen felkészítve az input fájlból kiolvasott „statikus” objektumokon túl mozgó („dinamikus”) objektumok kezelésére is, amelyek kódból lesznek példányosítva
    - vezérelt autó, NPC (non-player-character) autó, gyalogos
- A modell tegyen különbséget azon objektumok között amelyeknek egy jármű nekimehet és amelyeknek nem (fa vs. útelem)
- A modell kezeljen „z-index”-et, hogy a kirajzolás során biztosítható legyen, hogy mely elemet kell előtt kirajzolni a „kitakarások” végett
- A modell biztosítson egy publikus metódust, amellyel a világ objektumai szűrhetőek. A metódus bemenete 3 pont, amely meghatároz egy háromszög (szenzor látótér), a metódus válogassa ki azokat a világ objektumokat, amelyeket a szenzor „lát”, amelyekkel a háromszög érintkezik
- A modell tegye elérhetővé a feldolgozott referenciapontokat, és a poligonokat is tulajdonságokon keresztül
- A modell a beolvasott elforgatási mátrixot dolgozza föl, váltsa át elforgatási szögre és tegye elérhető egy tulajdonságon keresztül


## Mozgatás: hajtáslánc és kormányzás

A *mozgatás* modul felelőssége a vezérelt autó (egocar) mozgatása, mozgásának számítása. Ez magába foglalja a hajtáslánc és a kormányzás megvalósítását.

A modul a HMI-től kap bemenetet, mindenek előtt váltóállás, gáz- és fékpedálállás valamint kormányelfordulás. A váltó automata, ami azzal jár, hogy a HMI a négy állapot (P, R, N, D) egyikét közli.

- **P**ark: Ez az egyik olyan állapot amiben a motor beindítható (a másik az N), ez a váltó alapállása, mechanikusan megszünteti az erőátvitelt. A valóságban nem helyettesíti kéziféket, de mivel azt nem kell implementálni a feladat során, lehet úgy tekinteni, hogy P-ben a kézifék is be van húzva. Az autó nem mozdul ebben az állásban.
- **R**everse: hátramenet
- **N**eutral: üres, ebben az állásban sem jut a motorerő tengelyekre, a motor nem gyorsíthatja az autót. Ha üresben gázt adunk, a motor felpörög, méghozzá jelentősen, mivel nincs ami ellene dolgozna. Ha az autónak volt lendülete, az még hajtja tovább.
- **D**rive: előremenet. A D-m belül definiálni kell 4-5 belső fokozatot (mint ahogy manuális váltónál is lenne), le kell programozni, hogy valamilyen fordulatszám értékeknél a váltó váltson. Ezen értékek meghatározásához lehet találni motorkarakterisztikákat (lehetőség szerint utcai autó kerüljön kiválasztásra, ne valami sportautó). A belső fokozatok a felhasználó interfész szempontjából transzparensek.

A pedál állások \[0-100\] skálán érkeznek. 0: nincs lenyomva, 1: 1%-ig van lenyomva, 100: tövig (100%-ig) le van nyomva. Minél jobban le van nyomva a gázpedál, annál több teljesítményt kell a motornak kiadnia. A motor belső működését nem kell részletekbe menően implementálni, pláne nem egy belső égésű motorét, egy elektromos hajtáslánc egyszerűbb.
A szoftverben üzemanyag-fogyasztást (vagy akkumulátor töltöttséget) és hatótávokat nem kell kezelni.

A kormány jellemzően valamilyen áttétel segítségévél befolyásolja a kormányzott kerekek helyzetét. Ez ebben a szoftverben sokkal egyszerűbb is lehet. Ha 60°-ot tengelyelfordulást feltételezünk és a kormány „nulla” állásból +/- 60-at mozdulhat el, akkor lényegében 1:1-es „áttételünk” van.
Ha az input +/- 100-as skálán adja meg a kormányelfordulás mértékét, akkor azt kell a tengelyelfordulásra képzeni. A bemeneti skálával kapcsolatban a HMI csapattal kell egyeztetni.

A úgymond kimenete egy mozgásvektor, vagyis az, hogy a következő ciklusban az autó (referenciapontjának) X, Y koordinátáit mennyivel kell módosítani.
A pedálállás és a motor korábbi állapotának függvényében meghatározásra kerül a sebesség, a kormányállás valamint az egocar korábbi orientációjának függvényében meghatározásra kerül, hogy módosul-e az autó iránya, a kettő eredőjeként a teljes vektor.

A modullal kapcsolatban kihívás a hajtáslánc működésének és a mozgás és kanyarodás fizikájának megértése, implementálása. A fizika tekintetében sem kell elaprózni a dolgokat. Két erő elégséges: a motorerő mint gyorsítja a járművet (ez a gázpedállal szabályozható) és egy fékező erő, amelyet a fékpedállal lehet szabályozni, valamint ezen felül egy konstans fékező erőnek is lennie kell, tehát a fékező erő akkor sem nulla, ha a fékpedál állása nulla. Ez utóbbit mindegy minek nevezzük (légellenállás, csúszási-súrlódási erő, a kettő eredője, stb.), nem kell cicomázni, de legyen.

Külön feladat észben tartatni és célszerűen előre felkészülni arra, hogy a 3. sprintes vezetéstámogató modulok (LKA, AAC, AEB, PP) közvetlenül az egocar hajtásláncára és a kormányra hatnak. Fel kell készíteni a modult ilyen, „nem a HMI-ről” érkező inputok kezelésére is, amelyek ráadásul magasabb prioritásúak. Pl. ha a vészfékező rendszer „lenyomja” a fékpedált, akkor magasabb prioritással kell kezelni mint a HMI-ről érkező pedálállást.


### Definition of Done

- Az autó gázpedál állásától függően gyorsul
- A gyorsulás a „belső fokozatok” szerint kerül meghatározásra
- Az autó a gázpedál felengedésével fokozatosan lassul, majd megáll
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


## Vizualizáció

A *vizualizációs* modul felelőssége a játék virtuális terének, pontosabban a képernyőn megjeleníthető részének kirajzolása miután a világ lényegesen nagyobb mint ami a programablakba egyszerre belefér. A modul csak megjelenít, a modellt a világmodellért felelős csapat állítja össze. Ebbe nem csak a pálya statikus elemei tartoznak, hanem értelemszerűen a dinamikus objektumok is. A megjelenítés középpontja az mindenkor vezérelt autó (egocar).

Továbbá, a modul felelőssége a debuggoláshoz és teszteléshez használandó segédobjektumok opcionálisan bekapcsolható megjelenítése. Ide tartozik a szenzorok látómezeje, a világobjektumok „poligon váza”, valamint utóbbiak eseményre történő kiemelésének lehetősége. Ez utóbbi akkor történik, amikor majd a 2. sprintben létrehozandó szenzor látómezejébe kerül pl. egy fa, akkor a szenzor a fa kiemelés tulajdonságát bebillenti és ekkor a megjelenítésnek valami más színt kell tudnia használni (a poligon kirajzolására, esetleg kitöltésére).

 A programablaknak az alábbi módon nézni majd ki. Két jól el különülő részre oszlik, a nagyobb baloldali a *viewport*, amelyen keresztül a világ éppen megjelenített része látható. A jobb oldali a műszerfal, amely *nem* tartozik e modul felelősségi körébe.

 ![gui_plan](images/gui_plan_course_display.png)

A modullal kapcsolatos kihívása a rajzoláshoz használt keretrendszer megismerése, az objektumtranszformációk megfelelő végrehajtása és az objektummodellért felelős csapattal egyeztetés az objektumok elérését illetően.
Bár a modul függ a világmodelltől, a munka értelemszerűen nem akkor kezdődik mikor az a modul elkészült. A világobjektumok képfájljai és a világot leíró állomány kezdettől fogva rendelkezésre áll, nem kell megvárni a teljes modell elkészültét.


### Definition of Done

- a megjelenés villódzásmentes és folyamatos legyen
- A kirajzolt világ egy része látható csak állandóan a programablakban, a „kamera” a vezérelt autót (egocar) követi
    - világ széleinek kezelése
- statikus objektumok pozícióhelyes kirajzolása és résmentes illesztése a rendelkezésre álló építőelemekből
- mozgó objektumok helyes kirajzolása
- debug célból meg kell tudni jeleníteni az egyes objektumokhoz definiált poligonokat
- interfészt kell biztosítani, hogy egy megcímzett objektum poligonja eltérő színnel jelenhessen meg (ha kijelölésre kerül)
- interfészt kell biztosítani a szenzorok látóterét jelképező háromszögek opcionális megjelenítésére
    - típusonként (radar, kamera, ultrahang) külön-külön kapcsolhatónak kell lennie és más-más színnel kell megjelennie (piros, kék, zöld)
