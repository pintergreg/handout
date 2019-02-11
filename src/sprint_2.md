## 1. Világ populálása mozgó NPC objektumokkal

- Input: Világmodell
- Output: Mozgó/álló objektumok, gyalogosok, biciklisek, autók. Scriptelt útvonalak, mozgások megvalósítása, a megvalósított objektumok a modellbe illesztése
- Challenge: 2-es story felelősével egyeztetés, NPC objektumok típusairól

### DoD

- [ ] Objektumok előre definiált, értelmes helyen jelennek meg (autók úton, gyalogosok út mellett/járdán)
- [ ] Objektumok előre scriptelt útvonalat követnek
- [ ] Gyalogosok az út mentén haladnak, zebrán áthaladnak
- [ ] Autók az utat - sávot - pontosan követik
- [ ] Új pálya esetén az NPC objektumok adaptálódnak az új környezethez
- [ ] NPC objektumok egymás mozgásállapotát nem változtatják meg
- [ ] Legalább egy autó végigmegy a pályán
- [ ] Legalább egy gyalogos mozog és átkel egy zebrán


## 2. Ütközés detekció és mozgásállapot-változás szimuláció

- Input: a létrehozott világ
- Output: Az ütközések detektálása, objektumtípus függőség, új mozgásállapot minden mozgó, ütköző objektumnak
- Challenge: Nem túltolni - keep it simple.

### DoD

- [ ] Mozgó objektumok érintkezésének pozíció és dimenzióhelyes detekciója és kommunikációja megvalósult
- [ ] Mozgó és statikus objektumok érintkezésének pozíció és dimenzóhelyes detekciója és kommunikációja megvalósult
- [ ] Az objektumok mozgásállapota az energiamegmaradás törvényeinek megfelelően változik (gyorsul, lassul, irányt vált, megáll)
- [ ] Az objektumok sérülnek, megsemmisülnek, amennyiben túl nagy energiával ütköznek
- [ ] A játék véget ér, ha gyalogost gázolunk
- [ ] A játék véget ér, ha a játékos ütközés következtében mozgásképtelenné válik (sebessége 0-ra csökken, vagy megsemmisül)

## 3. Szenzor interface implementáció & ultrahang szenzor

- Input: Világmodell
- Output: Kamera, Radar, Ultrahang által detektált objektumok, debug vizualizáció a szenzorok látomezejéről, a benne látott objektumokról, az US szenzorok által látott legközelebbi 8 objektum
- Challenge: Megfelelő FOV (field of view) kezelés a szenzorokra, határon lévő objektumok kezelése, taszk szervezés, ASAP megoldás készítése

### DoD

- [ ] Egységes interface kidolgozása a világmodell objektum listájának szűrésére
- [ ] A kamera, radar, ultrahang szenzorok elérik a látható objektumokat
- [ ] A látható objektumok összes paramétere elérhető
- [ ] A szenzorok látómezeje és a látott objektumok vizualizálhatók gombnyomással
- [ ] Az ultrahang szenzor(ok) látómezejében lévő objektumok lekérése a definiált interface használatával
- [ ] Az ultrahang szenzor(ok) látomezejében lévő legközelebbi objektum(ok) elérhető(k) a kimeneten
- [ ] Az ultrahang által relevánsnak tartott objektumok kiemelhetők egy debug kapcsolóval (billentyű vagy debug módba váltás)
- [ ] Az ultrahang látómezeje frissül az autó pozícióváltozásával
       

## 4. Kamera, Radar szenzor implementáció

- Input: Szenzor interface kimenete
- Output: Kamera és radar által detektált objektumok filterelt, funkció szempontjából releváns részhalmaza,
- Challenge: Elérni, hogy az interface csapat szállítson időben/mockolás, Kamera specifikus adatstruktúra létrehozása, útelemek távolságainak számítása

### DoD

- [ ] A radar látószögének és látótávolságának megfelelő objektumlista lekérése a szenzor interface használatával
- [ ] A radar szenzor a 4 legközelebbi objektumot adja vissza (bal, jobb sáv legközelebbi, saját sáv legközelebbi kettő)
- [ ] A kamera látószögének és látótávolságának megfelelő objektumlista lekérése a szenzor interface használatával
- [ ] A kamera szenzor a látható sávok összes adatát visszaadja(hány sáv, melyikben vagyunk, azon belül milyen távolságra a szélektől)
- [ ] A kamera szenzor a látott táblák közül a legközelebbi összes adatát visszaadja (milyen tábla, milyen messzire van)
- [ ] A szenzorok által relevánsnak tartott objektumok kiemelhetők egy debug kapcsolóval (billentyű vagy debug módba váltás)
- [ ] A szenzorok által látott terület dinamikus frissítése
