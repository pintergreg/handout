# Acceptance test: 'convoy'

[![Konvoj](https://img.youtube.com/vi/Xbjdmw8D9-Y/0.jpg)](https://www.youtube.com/watch?v=Xbjdmw8D9-Y)

A fenti videó a Hyundai promóciós videója az olyan vezetéstámogató rendszereiről, mint az adaptív sebességtartó automatika, az automata vészfékező vagy a sávtartó automatika. A cél a fenti videón bemutatott tesztet teljesítő funkciók implementálása egy leegyszerűsített, szimulált környezetben.

![](../images/oval.png)

- A pálya szélessége ~500m, magassága ~300m, a kanyarok 6 fokos elemekből állnak, hogy a sávtartó automatika le tudja kezelni.
- Az NPC modul (sprint 1 / team 3) implementálja a fekete furgon mozgását, amely a parkoló mellől indul, állandó 50km/h-s sebességgel körbemegy a pályán.
- A teszt során, a vevő vezeti a fehér (vezérelt) autót, ami egy AutomatedCar példány, besorol a fekete NPC mögé, aktiválja az LKA-t és az ACC-t.
- Majd átvált a másik AutomatedCar példányra, a pirosra, amikor odaér a konvoj, besorol a fehér AutomatedCar mögé, aktiválja az LKA-t és az ACC-t.
- Az NPC útvonala szerint mikor megtett egy kört, akkor a stop táblánál nyom egy satuféket (a tábla csak vizuális visszajelzésként céllal van kint a pályán).
- A satufék nem azt jelenti, hogy 0 másodperc alatt lassul 0-ra a sebessége, hanem egy erőteljes fékezés kerül megvalósításra az NPC szkript segítségével.
- Az NPC ütközhető objektum, az ACC és a AEB szépen elkerüli az ütközést, mindkét példánynál.
