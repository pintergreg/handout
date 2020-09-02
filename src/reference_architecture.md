# Referencia architektúra

A repó található kezdeti kódot (skeleton) egységes alapot képez a félév során megvalósítandó szoftver számára, azonban nem kíván tökéletes és teljes megoldást biztosítani a feladat egyetlen elemére sem, mindösszesen példaként szolgál a következőkre:

- projekt struktúra
- grafikus felület létrehozása
    - Avalonia keretrendszerrel
- világmodell benépesítése
- vezérelt autó példányosítása és kiválasztása
- képfájl betöltése projektkönyvtárból
- világobjektumok rajzolása MVVM rendszerben
- vezérelt autó állapotának megjelenítése a műszerfalon
- ütemező használata
- billentyű lenyomás és felengedés esemény kezelése
- szenzor objektum létrehozása
- adatcsomag küldése és fogadása a *Virtual Function Bus*-on keresztül

## Virtual Function Bus

A VirtualFunctionBus (VFB) egy kommunikációs megoldás az AutomatedCar komponensei (SystemComponent) számára. A komponensek feliratkoznak a buszra és **a feliratkozás sorrendjében** ciklikusan meghívásra kerül a `Process()` metódusok.

Ebből következik, hogy a feliratkozást az ábrán látható sorrendben kell megtenni, mivel az adatáramlásnak ilyen irányultsága van. Az ábra a kód kezdeti állapotát szemlélteti, a munka során további modulok (szenzorok, vezetés támogató rendszerek) is csatlakoznak majd. Valamint a hajtáslánc és a kormányzás modult nem kötelező ennyire élesen szétválasztani.

<!-- ![vfb](images/vfb.png) -->

```plantuml
{{#include plantuml/dummy_sensor_vfb.puml}}
```

Minden adatközlő modulnak létre kell hoznia egy-egy csomag (packet) típust (és vele párhuzamosan egy az olvasást biztosító interfészt), amely tartalmazza azokat az információkat amelyeket továbbítania kell. Például az input modul a pedál és kormány állásokat. A hajtáslánc a következő, kiolvassa a pedál és váltó állást, számol vele, majd visszaírja a _saját_ csomagjába motor fordulatszámát és az autó sebességét, stb. Ezekre legközelebb a kormányzás modulnak lesz szüksége, az kiolvassa ugyanúgy mint az input modul kormányállás értékét, számol vele, majd visszaírja a autó adott iterációra vonatkozó elmozdulását.


### Használata általánosan

1. Create a new package (e.g. SteeringAnglePacket)
2. Create a new interface for it (e.g. IReadonlySteeringAnglePacket)
3. Add reference to the owner component (e.g. SteeringSystem)
4. Add the interface reference to the VirtualFunctionBus
5. In the loop method of the writing componenet set the payload value of the packet
6. In the loop method of the reading compontent read the payload of the packet

<!-- # Komponens diagram

![](https://www.plantuml.com/plantuml/img/RLF9JiCm4BtxAqQzDr-046qMrbAheHKIS1XI5mo97Na1LOX_P-mWC2cvZ5_UcyKpunFhq3ZVjOmvwLe1zTuwqS7CDC_IYSPv8nZhiNd59m6JZRGUMsdHIQqcyC60laPtlLP2ERWxMvm_05eWEwPoxOqLzwgGjczn7sLvmJwJw3FlT8TER7Cq_mIVvNdq8ZkcRkfLfCYEASuZm_b1k78-X2ldO-hgSXOficDgdYyYHNPCRIHr4bkel6f2Vs3kRTHkgeCCAzoYWLeegqtKhEgnPDqwWrOhsQIwzO6kCffCZfqm62NLGNkuVXU6eadrFT-X9VMVxfVgJLAeZZp-QNx2HkVoUZEM57k57LMxV7oXnHckNYn33gcSC3jiACi2UxZWvIdiP2icGNB1JrD1aWWAOHiZUwSDt2wkVbq8C4P-aFa-Emvh5EW1XCAA9MG13Hpj2qot-brDuoHeHrB8UOfe6L982v126deALpLCVJ-Srycvod_FFFbFfVtKHVDEuVelf166ExHYvxwlH76oBAGED7Krb7AK6Vdq71JXlR4JeRRqahy0)

* ACC - Adaptive Cruise Control
* AEB - Automatic Emergency Brake
* BCM - Body Control Module
* HMI - Human Machine Interface
* LKA - Lane Keeping Assistant
* PP - Parking Pilot
* TSR - Traffic Sign Recognition

# Kiindulási kód osztálydiagramja
![](https://www.plantuml.com/plantuml/img/fLN1Rjim3BthAuJaacx8OTUX6Dec29PXw8fbMDkZOZ6E1baA9Bc9qUNVHqkoBTjPBpr9fXxvo4U9lh6E6LSMaX0dd0IwaCnQkXGiDwmW9FEVlmLYc5oLAdD2gxlIqbT2wIiwEv6TwVoxiEvwlQciWsAXYuDMeDmNcZLRcw8_lcZ1gO4SdS2qyDdGtxjVZJqjABuHkM9o5XPgBw2areVP5JaJ8XJIx5W6TCY0HVJ0RMePY1SOSPmRFO89lUSOcwuvRkxBOWk6SkOOXgdDERWrzq7Z6HgMU3nB0Zrg8taJvoYusyVz7aI-ToGgws4_jdyWGr6FtOVjg1vhPyyM3LzzXAuess1QglGeeZlgzf3nIFPB-pHcIJ9Krx1nYdK-IPQZYeCTwvxMXAUuLd6DEanJ7QOxgPcZHjSzrWeD6sU4ogaeM0uh8U6U5T1L_vHAyPn-l2LK847RpyZZhP6fxcTArfFsoKjtIatFtbIzkm4sIQUlGWhfftP9dAG92rqQ2qjX3v9LzVNxjiBN3dHdWeW-g532XMQ7AvVutvPE5ym1Np1JktDTRd5s7FS0ybRbiet13RwZqFxe-g2FO9nXGeMts5p-KrohkERCFW1didaRQUZ_zpWcKhUvTGZqR6kH5QziVC6ZGJ2b1zGLhoNmuMc8a1PDh__Ev-bT9iEw0c8GY0mdd0SDfnAvC6uddoRq0s8d1LFLPEH2F-EmL0xPBHcTURymiYO8B2sGqDP1qAIS95plhdYunoM8dZ0864gHGCaDpcxys_m3) -->

<!--
```mermaid
{{#include mermaid/class.mmd}}
```
-->


### Konkrét példán keresztül: DummySensor

A *DummySensor* egy rendkívül primitív „szenzor”: egyetlen feladata, hogy kiszámolja az egocar ás a *Circle* objektum közötti távolságot. Pontosabban az egocar és a kör referenciapont X, Y koordinátáinak különbségét. Azonban ez is teljes mérteékben képes bemutatni a szenzorok működését és a buszon keresztüli adatcserét.

A példa szempontjából releváns komponensek viszonyát alábbi ábra szemlélteti.

```plantuml
{{#include plantuml/skeleton_component.puml}}
```

A *World* singleton osztály tartalmaz minden *WorldObject*-et és tartalmaz referenciát a vezérelt autóra, amely közvetetten szintén *WorldObject*, csakúgy mint a *Circle*. Az *AutomatedCar* tartalmazza a *VirtualFunctionBus*-t, mivel ez az autó komponenseinek kommunikációs csatornáját valósítja meg. Szintén az *AutomatedCar* tartalmazza a szenzorokat, jelen esetben a *DummySensor*-t.

Ahhoz, hogy a szenzorok (vagy egyéb komponensek mint a hajtáslánc például) adatot cserélhessenek fel kell iratkozniuk a VFB-ra. Miután a feliratkozás megtörtént, a VFB minden ciklusában meghívja a `Porcess()` metódusát. A *DummySensor* esetében ez a metódus elkéri a világtól a *kör* objektumot, kiszámolja a vezérelt autó és a kör távolságát, majd ezt a távolságot eltárolja a *DummyPacket* objektumban (amely egy IReadOnlyDummyPacket típuson keresztül a VFB-ban van tárolva).

<!-- A szenzor része az *AutomatedCar*-nak, közvetlenül hozzáférhet a világhoz (*World*) mivel az singleton. Lekéri a világobjektumok közül a kört (*Circle*), majd kiszámolja a koordináták különbségét a `process()` metódusban és az eredményt eltárolja az `dummyPacket` változóban. -->

A `dummyPacket` referenciája eltárolásra került a *VirtualFunctionBus*ban, amely referenciáját a a szenzor konstruktorának biztosítani kell. Ehhez előzetesen létre kell hozni egy `IReadOnlyDummyPacket` típusú változót a VFB-ban.

Miután a `DummyPacket` megvalósítja az `IReadOnlyDummyPacket` interfészt, a VFB-ban az utóbbi típus tárolására szolgáló változó kerül deklarálásra. Ezzel biztosítható, hogy az adott értéket csak a csomag tulajdonosa (jelen esetben a *DummySensor*) tudja majd írni, de minden más komponens olvashatja a VFB-on keresztül.

```plantuml
{{#include plantuml/dummy_sensor_sequence.puml}}
```

Ez lejátszódik minden iterációban, így a kör és a vezérelt autó mindenkori helyzete szerinti távolságot fogja tartalmazni a *DummyPacket*.


Az alábbi ábra a *DummySensor* szenpontjából fontos osztályok kapcsolatát mutatja.

```plantuml
{{#include plantuml/dummy_sensor.puml}}
```

```plantuml
{{#include plantuml/automatedcar_class.puml}}
```


## Megjelenítés
