# Demók

A félév során a csapatok három alkalommal prezentálják az elvégzett munkát. A „demók” az _elkészült_ szoftver megrendelőnek való bemutatását szimulálják. Nem a kódra vagyunk kíváncsiak, hanem működés közben szeretnénk látni, hogy a szoftver teljesíti feladatban foglalt követelményeket.
A bemutatás során, a `master` branchre befogadott kódot vesszük figyelembe, minden egyéb _„nem készült el határidőre”_, azaz értékelhetetlen.

## Ideális eset az első sprint után

A „megrendelő” az aktuális master branchről elindítja a szoftvert, az ablak bal oldalán ott van az autó (középen), az út fölé helyezve, jobb oldalon a műszerfal mutatja az állapotát. Sebességbe teszi az autót, majd gázt ad, elindul, kicsit mászkál a világban, teszteli a gyorsulás, lassulás és kanyarodás „érzetét”, közben megfigyeli a pálya illesztéseit és a „grafika folytonosságát”.
Még kipróbálja a debug funkciókat és egyéb kapcsolót a rend kedvéért.

**konklúzió**: a pálya hibátlanul kirajzolásra került, emögött *vélhetően* van egy modell világ, hiszen a poligonok is rendben a helyükön vannak, az autó mozgása „rendben van”, nem volt cél egy profi autószimulátor szintű fizika, ha a sebesség-változások és a fordulás nem mutat kiugró rendellenességet, az autó pontosan vezethető (érts, végre tudok hajtani pl. egy párhuzamos parkolást), és a műszerfal közvetíti azt amit látunk, akkor mind a 4 csapat kifogástalan munkát végzett, mindenki teljesítménye 5-ös, lehet foglalkozni érdekesebb témákkal.

## Realisztikus demó, sok félév tapasztalata alapján

Eleve még reggel 3/4 8-kor fogadom el az utolsó PR-eket (amik esetenként éjfél után készültek el), tulajdonképp érdemi review nélkül, mert nem akarom, hogy ezen múljon a demó sikeressége, ha fordul, nincs ütközés és az automatizált ellenőrzések sem mutatnak hibát akkor beengedem a masterbe.

A szoftver máskor nem is indul, mert valaki a `C:\Users\XYZ\ÓE\AutomatedCar\Assets` mappát beégette a kódba. Ezt ott élesben kijavítjuk, végre nem száll el kivétellel. A műszerfal vezérlőinek egy része ott van, de nincs bekötve, nem az autó állapotát, hanem konstans dummy értékeket mutat, rosszabb esetben azért, mert skeleton dummy mozgatása aktív még mindig, jobb esetben azért mert a hajtáslánc ugyan mozgatja az autót, de nem propagálja az állapotát a műszerfal felé.
Néha az történik, hogy a hajtáslánc propagálja ezeket, de X csomagban, míg a hajtáslánc Y csomagot vár.

A fordulókör kicsit irreális, de azért kanyarodni lehet, nincs nagy vész, akár 1 óra alatt fixálható; az autó gyorsul, de irreálisan gyorsan vagy lassan. Teljesen egyértelmű, hogy a kollégák alapos munkát végeztek a mozgatás fizikai részének implementálásában, utánaolvastak meg minden, de sosem próbálták ki, hogy milyen érzés vezetni az autót, mert akkor rájöttek volna, hogy pár konstanst finomhangolni kell. Ebben minden bizonnyal az is közrejátszhatott, hogy a kód eleve exception-el elszállt és a hiba nem az ő térfelükön volt, a felelős csapatnak meg, a demó előtti szerda este 8-kor jelentett bugot meg már nem tudta időben javítani.

A képfájlok gyakran nem illeszkednek, némelyik elem nem úgy van elforgatva, ahogy kellene. Ugyanaz a helyzet mint fentebb, valami nem úgy volt kommunikálva, valaki úgy gondolta, hogy fokban van a szög, más meg úgy, hogy radiánban. Látszik, hogy a munka nagyja kész, de a pályára nem lehet azt mondani, hogy ki van rajzolva, mert tulajdonképpen csak összevissza kirakott útdarabokat látni.
Mivel már a képek sem kerültek ki hibátlanul, így a poligonokhoz hozzá sem nyúltak, mondván ha a képek jók, akkor a poligonok kirakása gyerekjáték (valóban), de arra nem jutott idő.

Ezek után és közben egy-egy kolléga hevesen elkezdi mutogatni a kódot, hogy de hát itt van az elforgatás implementálva, mindenki lássa bele azt amit ő lát, hogy ez a metódus, amihez még unit tesztet is írt, tényleg hibátlanul el tud forgatni egy útelemet.

Aztán gyakori jelenség még, hogy a csapat jelzi, hogy sajnos odáig nem jutottak el, hogy a masterbe kerüljön a kód, de ők szeretnének saját branch-ről/gépről prezentálni. Ilyenkor rábólintunk, hátha látunk valami lenyűgözőt. A kolléga néha ekkor indítja az IDE-t, de se baj, után a még átváltja a branch-et, elindítja de nem az történik amit várt, majd a csapattársa jelzi, hogy már ne a team3_perfect_steering branchet nézze, hanem a team3_perfect_steering2-t, mert ő fél 2-kor még abban fixálta a hátramenetben történő kanyarodást, de valójában azt nem tudja megmondani, hogy a műszerfalra az fordulatszám miért nem kerül ki. Ugyanis azt a részt XYZ kolléga csinálta, aki most nincs itt, mert dolgozik, de skype-on azt írta, hogy kész van vele, nála működik.

Természetesen, ebben összevontam azokat a hibákat és jelenségeket, amelyeket előfordulnak, nem egy konkrét forgatókönyv volt, hanem állatorvosi ló gyanánt összemosott, ilyen értelemben fiktív történet, de külön-külön minden eleme valóságos, megtörtént eset.
