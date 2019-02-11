# Világ(modell) kialakítás a leíró XML beolvasásával

* Input: generált világot leíró XML(-ek)
* Output: Modellezett világ; Mozgó/álló, áthajtható, ütközhető, tömeggel, mérettel rendelkező objektumok, koordináta-rendszerben
* Challenge: „mindenki erre vár”, az interfésznek mielőbb stabilnak kell lennie, akkor is, ha az implementáció még nincs meg


## Definition of Done

- [ ] Útelemek, fák, táblák egyéb XML-ben leírt objektumot felismerése, parse-olása
- [ ] Minden feldolgozott objektum rendelkezzen pozíció, orientáció, típusadatokkal
- [ ] Heterogén kollekció lehetőségének biztosítása
- [ ] Hierarchikus objektummodell a világ leírására
- [ ] A modell legyen felkészítve az XML-ből kiolvasott „statikus” objektumokon túl mozgó („dinamikus”) objektumok kezelésére is
    - vezérelt autó, NPC (non-player-character) autó, gyalogos
- [ ] A modell tegyen különbséget azon objektumok között amelyeknek egy jármű nekimehet és amelyeknek nem (fa vs. útelem)

## Megjegyzések

* A párhuzamos munkavégzéshez ajánlott az XML-ből előállítani egy objektum listát pl. XmlObject lista, ahol az objektumok típusától függetlenül minden ilyenekben van tárolva (az XML tartalma Java objektumra van leképezve gyakorlatilag), és ebből aztán dolgozik a hierarchikus objektummodellt. előállító metódus
* Teljesen járható út, hogy a modell, az XML-ben található koordináta-rendszerrel dolgozik, ebből adódóan minden számolás abban történik, csak a megjelenítés transzformálja át. Vagy már beolvasáskor megtörténik egy koordinátatranszformáció és onnantól kezdve minden azon történik. Utóbbi hátránya, hogy a megjelenítéstől (felbontás szinten) teszi függővé a szimulációt.
    * A döntést a megjelenítésért felelős csapattal **együtt** kell meghozni!
* Vonatkozó [wikioldal](https://szfmv2018-osz.github.io/handout/virtualis_vilag/)

# Vizualizáció

* Input: Objektummodell (modellezett világ)
* Output: Illeszkedő, résmentes "puzzle" megjelenítése, 24 FPS-el frissülő, folyamatos mozgás
* Challenge: Az objektumtranszformációk megfelelő végrehajtása, az objektummodellért felelős csapattal egyeztetés az objektumok elérését illetően

## Definition of Done

- [ ] A világ méretarányos megjelenítése egy arra alkalmas koordináta-rendszer bevezetésével
- [ ] A kirajzolt világ egy része látható csak állandóan a programablakban, a „kamera” a vezérelt autót (egocar) követi
- [ ] XML-ből beolvasott (statikus) objektumlista pozícióhelyes kirajzolása és illesztése a rendelkezésre álló építőelemekből
    * az XML csak nem mozgó objektumokat ír le
- [ ] mozgó objektumok helyes kirajzolása

## Megjegyzések

* Teljesen járható út, hogy a modell, az XML-ben található koordináta-rendszerrel dolgozik, ebből adódóan minden számolás abban történik, csak a megjelenítés számolja át.
    * A világmodellt kezelő csapattal kell egyezteti a koordináta rendszer ügyében
* A programlaknak az alábbi módon kell kinéznie. A kezdeti kód ezt a felosztást már támogatja, tartalmaz két JPanel-t, ebből a `CourseDisplay`re kell a világ objektumait kirajzolni. Pontosabban az a „viewport”, amit a kamera lát, mögötte ott lehet a többi objektum.
    ![gui_plan](https://raw.githubusercontent.com/SzFMV2018-Osz/handout/master/docs/images/gui_plan.png)
* A kiadott kód csak példa alap GUI készítésére, ha a feladat úgy kívánja átírható, más rajzoló metódusok vagy logika is használható, de figyelni kell arra, hogy ez esetben minden érintett csapat tudjon a módosításokról.
* Az IntelliJ IDEA GUI Designer-e *nem* használható!

# Vezérlés és műszerfal (HMI - human machnie interface)

* Input:
    * a billentyűzet
    * az Ego objektum mozgásállapota, hozzá kapcsolódó adatok
* Output:
    * PRND váltó(fel-le), gáz és fék 0-100 skála, kormányállás tetszőlegesen választott skála index, billentyűleütés alapján
    * Fordulatszám, sebesség, kormány, gáz, fék, sebességváltó állása, irányjelző visszajelző, kocsi pozíció megjelenítése (x, y koordináta, az autó rajzolását a vizualizáció végzi, ez egy debug funkció)

## Definition of Done

- [ ] a fék- és gázpedál állapota szabályozható
- [ ] fék- és gázpedál valamint a kormány sem binárisan működik, a billentyű nyomva tartás idejétől függ az input intenzitása
- [ ] fék- és gázpedál valamint a kormány is fokozatosan áll vissza alaphelyzetbe a billentyű felengedésével
- [ ] az automata váltó 4 „fokozata” szabályozható
- [ ] irányjelző kapcsolható
- [ ] Megjelenik a fordulatszám mint „analóg óra”
- [ ] Megjelenik a sebesség mint „analóg óra”
- [ ] Megjelenik a kormányállás
- [ ] Megjelenik a gáz, fék állapota (progressbar)
- [ ] Megjelenik a sebességváltó állása (szövegesen)
- [ ] Irányjelző visszajelző (egy-egy nyíl kirajzolva)
- [ ] Kocsi pozíció megjelenítése (x, y koordináta debug céllal, szövegesen)

## Megjegyzések

* A billentyűzet kezelése elvben kétféle lehetne: pedálállás léptetése föl/le, kormányszög léptetése föl/le; tehát diszkrét események. Vagy folyamatos „additív hatású”. pl. W billentyű gáz adás, ha hosszabban van lenyomva, akkor nagyobb mértékben, tehát adott idő alatt fokozatosan éri el a 100%-os lenyomást. Utóbbi lényegesen játszhatóbb eredményt ad, nem szükséges 12 ujj az autó vezérléséhez. Preferált.
* Későbbi sprintekben egyéb vezérlőelemek is szükségessé válnak (tempomat beállítása, parking pilot aktiválása)
* A fordulatszám és a sebesség megjelenése „analóg óraként” történjen, de nem kell újra feltalálni a kereket.
* A programlaknak az alábbi módon kell kinéznie. A kezdeti kód ezt a felosztást már támogatja, tartalmaz két JPanel-t, ebből a `Dashboard`re kell a műszerfal objektumait kirajzolni.
    ![gui_plan](https://raw.githubusercontent.com/SzFMV2018-Osz/handout/master/docs/images/gui_plan.png)
* A kiadott kód csak példa alap GUI készítésére, ha a feladat úgy kívánja átírható, más rajzoló metódusok vagy logika is használható, de figyelni kell arra, hogy ez esetben minden érintett csapat tudjon a módosításokról.
* Az IntelliJ IDEA GUI Designer-e *nem* használható!

# Hajtáslánc és kormányzás

* Input: 
    * VFB-ról sebességváltó, gáz- és fékpedál állása (ezeket az input csapat állítja be)
    * HMI-ről kormányállás, Motor csapattól gyorsulás/lassulás
* Output:
    * Sebességváltó állásától függő mozgásállapot (vagy nem-mozgás) megvalósítása (PRND). Gyorsulás/lassulás számítása gáz/fék alapján.
    * Teljes mozgásvektor meghatározása, ez alapján az _egocar_ pozíciófrissítése a világban.

## Definition of Done

- [ ] Az autó gázpedál állásától függően gyorsul
- [ ] Az autó a gázpedál felengedésével lassul
- [ ] Az autó R válóállásban tolat
- [ ] Autó kanyarodásának biztosítása valóságos fordulókör szerint
- [ ] Tényleges mozgásvektor meghatározása a motor csapat gyorsulás, lassulás értékének felhasználásával
- [ ] A meghatározott mozgásvektor alapján az autó pozíciójának frissítése

## Megjegyzések

* vonatkozó [wiki oldal](https://szfmv2018-osz.github.io/handout/fizika/)
* A pozíciófrissítést egy folyamatos mozgáshoz kell megoldani, a megjelenítés 24 FPS-sel frissül, ehhez igazodva az inputokból folyamatosan kell számítani a következő időpillanatra vonatkozó pozíciókat
