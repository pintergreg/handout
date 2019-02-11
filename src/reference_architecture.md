# Virtual Function Bus

A VirtualFunctionBus szolgál a modulok (SystemComponent) kommunikációjára. A komponensek feliratkoznak a buszra és a feliratkozás sorrendjében ciklikusan meghívásra kerülnek. Ebből következik, hogy a feliratkozást az ábrán látható sorrendben kellene megtenni, mivel az adatáramlásnak ilyen irányultsága van. Az első sprint moduljait szemlélteti az alábbi ábra. A későbbi sprintekben további modulok (szenzorok, vezetés támogató rendszerek) is csatlakoznak majd.

![vfb](https://raw.githubusercontent.com/SzFMV2018-Osz/handout/master/docs/images/vfb.png)

Minden adatközlő modulnak célszerű létrehoznia egy-egy csomag (packet) típust (és vele párhuzamosan egy az olvasást biztosító interfészt), amely tartalmazza azokat az információkat amelyeket továbbítania kell. Például az input csapat a pedál és kormány állásokat. A hajtáslánc a következő, ő kiolvassa a pedál és váltó állást, számol vele, majd visszaírja a _saját_ csomagjába motor fordulatszámát és az autó sebességét, stb. Ezekre legközelebb a kormányzás csapatnak lesz szüksége, ők kiolvassák ugyanúgy mint az input csapat kormányállás értékét, számolnak, majd visszaírják a autó adott iterációra vonatkozó elmozdulását.
A műszerfal csak megjelenít, kiolvas mindent amire szüksége van. A pálya megjelenítés alapvetően független lenne ettől az egésztől, de az autót is meg kell jeleníteni így a legkézenfekvőbb ha az autó aktuális koordinátáit ugyanígy a kormányzás csomagjából olvassák ki.

_Értelemszerűen a fenti példában nem említett, de a követelményekben megjelenő információkat is kommunikálni kell a buszon._ 

## Implementáció

Az órán bemutatott lépések összefoglalás céljából:

1. Create a new package (e.g. SteeringAnglePacket)
2. Create a new interface for it (e.g. ReadonlySteeringAnglePacket)
3. Add reference to the owner component (e.g. SteeringSystem)
4. Add the interface reference to the VirtualFunctionBus
5. In the loop method of the writing componenet set the payload value of the packet
6. In the loop method of the reading compontent read the payload of the packet

# Komponens diagram

![](https://www.plantuml.com/plantuml/img/RLF9JiCm4BtxAqQzDr-046qMrbAheHKIS1XI5mo97Na1LOX_P-mWC2cvZ5_UcyKpunFhq3ZVjOmvwLe1zTuwqS7CDC_IYSPv8nZhiNd59m6JZRGUMsdHIQqcyC60laPtlLP2ERWxMvm_05eWEwPoxOqLzwgGjczn7sLvmJwJw3FlT8TER7Cq_mIVvNdq8ZkcRkfLfCYEASuZm_b1k78-X2ldO-hgSXOficDgdYyYHNPCRIHr4bkel6f2Vs3kRTHkgeCCAzoYWLeegqtKhEgnPDqwWrOhsQIwzO6kCffCZfqm62NLGNkuVXU6eadrFT-X9VMVxfVgJLAeZZp-QNx2HkVoUZEM57k57LMxV7oXnHckNYn33gcSC3jiACi2UxZWvIdiP2icGNB1JrD1aWWAOHiZUwSDt2wkVbq8C4P-aFa-Emvh5EW1XCAA9MG13Hpj2qot-brDuoHeHrB8UOfe6L982v126deALpLCVJ-Srycvod_FFFbFfVtKHVDEuVelf166ExHYvxwlH76oBAGED7Krb7AK6Vdq71JXlR4JeRRqahy0)

* ACC - Adaptive Cruise Control
* AEB - Automatic Emergency Brake
* BCM - Body Control Module
* HMI - Human Machine Interface
* LKA - Lane Keeping Assistant
* PP - Parking Pilot
* TSR - Traffic Sign Recognition

# Kiindulási kód osztálydiagramja
![](https://www.plantuml.com/plantuml/img/fLN1Rjim3BthAuJaacx8OTUX6Dec29PXw8fbMDkZOZ6E1baA9Bc9qUNVHqkoBTjPBpr9fXxvo4U9lh6E6LSMaX0dd0IwaCnQkXGiDwmW9FEVlmLYc5oLAdD2gxlIqbT2wIiwEv6TwVoxiEvwlQciWsAXYuDMeDmNcZLRcw8_lcZ1gO4SdS2qyDdGtxjVZJqjABuHkM9o5XPgBw2areVP5JaJ8XJIx5W6TCY0HVJ0RMePY1SOSPmRFO89lUSOcwuvRkxBOWk6SkOOXgdDERWrzq7Z6HgMU3nB0Zrg8taJvoYusyVz7aI-ToGgws4_jdyWGr6FtOVjg1vhPyyM3LzzXAuess1QglGeeZlgzf3nIFPB-pHcIJ9Krx1nYdK-IPQZYeCTwvxMXAUuLd6DEanJ7QOxgPcZHjSzrWeD6sU4ogaeM0uh8U6U5T1L_vHAyPn-l2LK847RpyZZhP6fxcTArfFsoKjtIatFtbIzkm4sIQUlGWhfftP9dAG92rqQ2qjX3v9LzVNxjiBN3dHdWeW-g532XMQ7AvVutvPE5ym1Np1JktDTRd5s7FS0ybRbiet13RwZqFxe-g2FO9nXGeMts5p-KrohkERCFW1didaRQUZ_zpWcKhUvTGZqR6kH5QziVC6ZGJ2b1zGLhoNmuMc8a1PDh__Ev-bT9iEw0c8GY0mdd0SDfnAvC6uddoRq0s8d1LFLPEH2F-EmL0xPBHcTURymiYO8B2sGqDP1qAIS95plhdYunoM8dZ0864gHGCaDpcxys_m3)
