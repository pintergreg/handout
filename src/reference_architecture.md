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

A fejezet további felépítse:

<!-- toc -->

## Virtual Function Bus

A VirtualFunctionBus (VFB) egy kommunikációs megoldás az AutomatedCar komponensei (SystemComponent) számára. A komponensek feliratkoznak a buszra és **a feliratkozás sorrendjében** ciklikusan meghívásra kerül a `Process()` metódusok.

Ebből következik, hogy a feliratkozást az ábrán látható sorrendben kell megtenni, mivel az adatáramlásnak ilyen irányultsága van. Az ábra a kód kezdeti állapotát szemlélteti, a munka során további modulok (szenzorok, vezetés támogató rendszerek) is csatlakoznak majd. Valamint a hajtáslánc és a kormányzás modult nem kötelező ennyire élesen szétválasztani.

![](plantuml/dummy_sensor_vfb.svg)

<!--
```plantuml
{{#include plantuml/dummy_sensor_vfb.puml}}
```
-->

Minden adatközlő modulnak létre kell hoznia egy-egy csomag (packet) típust (és vele párhuzamosan egy az olvasást biztosító interfészt), amely tartalmazza azokat az információkat amelyeket továbbítania kell. Például az input modul a pedál és kormány állásokat. A hajtáslánc a következő, kiolvassa a pedál és váltó állást, számol vele, majd visszaírja a _saját_ csomagjába motor fordulatszámát és az autó sebességét, stb. Ezekre legközelebb a kormányzás modulnak lesz szüksége, az kiolvassa ugyanúgy mint az input modul kormányállás értékét, számol vele, majd visszaírja a autó adott iterációra vonatkozó elmozdulását.


### Használata általánosan

1. Create a new package (e.g. SteeringAnglePacket)
2. Create a new interface for it (e.g. IReadonlySteeringAnglePacket)
3. Add reference to the owner component (e.g. SteeringSystem)
4. Add the interface reference to the VirtualFunctionBus
5. In the loop method of the writing componenet set the payload value of the packet
6. In the loop method of the reading compontent read the payload of the packet


### Konkrét példán keresztül: DummySensor

A *DummySensor* egy rendkívül primitív „szenzor”: egyetlen feladata, hogy kiszámolja az egocar ás a *Circle* objektum közötti távolságot. Pontosabban az egocar és a kör referenciapont X, Y koordinátáinak különbségét. Azonban ez is teljes mérteékben képes bemutatni a szenzorok működését és a buszon keresztüli adatcserét.

A példa szempontjából releváns komponensek viszonyát alábbi ábra szemlélteti.

![](plantuml/dummy_sensor_component.svg)

<!--
```plantuml
{{#include plantuml/dummy_sensor_component.puml}}
```
-->

A *World* singleton osztály tartalmaz minden *WorldObject*-et és tartalmaz referenciát a vezérelt autóra, amely közvetetten szintén *WorldObject*, csakúgy mint a *Circle*. Az *AutomatedCar* tartalmazza a *VirtualFunctionBus*-t, mivel ez az autó komponenseinek kommunikációs csatornáját valósítja meg. Szintén az *AutomatedCar* tartalmazza a szenzorokat, jelen esetben a *DummySensor*-t.

Ahhoz, hogy a szenzorok (vagy egyéb komponensek mint a hajtáslánc például) adatot cserélhessenek fel kell iratkozniuk a VFB-ra. Miután a feliratkozás megtörtént, a VFB minden ciklusában meghívja a `Porcess()` metódusát. A *DummySensor* esetében ez a metódus elkéri a világtól a *kör* objektumot, kiszámolja a vezérelt autó és a kör távolságát, majd ezt a távolságot eltárolja a *DummyPacket* objektumban (amely egy IReadOnlyDummyPacket típuson keresztül a VFB-ban van tárolva).

<!-- A szenzor része az *AutomatedCar*-nak, közvetlenül hozzáférhet a világhoz (*World*) mivel az singleton. Lekéri a világobjektumok közül a kört (*Circle*), majd kiszámolja a koordináták különbségét a `process()` metódusban és az eredményt eltárolja az `dummyPacket` változóban. -->

A `dummyPacket` referenciája eltárolásra került a *VirtualFunctionBus*ban, amely referenciáját a a szenzor konstruktorának biztosítani kell. Ehhez előzetesen létre kell hozni egy `IReadOnlyDummyPacket` típusú változót a VFB-ban.

Miután a `DummyPacket` megvalósítja az `IReadOnlyDummyPacket` interfészt, a VFB-ban az utóbbi típus tárolására szolgáló változó kerül deklarálásra. Ezzel biztosítható, hogy az adott értéket csak a csomag tulajdonosa (jelen esetben a *DummySensor*) tudja majd írni, de minden más komponens olvashatja a VFB-on keresztül.

<!--
```plantuml
{{#include plantuml/dummy_sensor_sequence.puml}}
```
-->

![](plantuml/dummy_sensor_sequence.svg)

Ez lejátszódik minden iterációban, így a kör és a vezérelt autó mindenkori helyzete szerinti távolságot fogja tartalmazni a *DummyPacket*.


<!-- Az alábbi ábra a *DummySensor* szenpontjából fontos osztályok kapcsolatát mutatja. -->

### Osztálydiagramok

<!--
```plantuml
{{#include plantuml/dummy_sensor_class.puml}}
```
-->

![](plantuml/dummy_sensor_class.svg)

<!--
```plantuml
{{#include plantuml/automatedcar_class.puml}}
```
-->

![](plantuml/automatedcar_class.svg)


## Megjelenítés

Az elkészítendő szoftver felhasználói felületének az alábbi vázlat felépítését kell követnie.

![gui plan](images/gui_plan.png)

A programablak bal oldalán a virtuális világ egy szeletét látjuk ezért felel a vizualizációs modul. A megjelenítés középpontja az mindenkor vezérelt autó (egocar). A világ minden eleméhez tartozik egy képfájl, ezen elemek megfelelő transzformációk (forgatás, skálázás) végrehajtása után kirajzolásra kerülne a CourseDisplayre.

Továbbá erre a részre kerülnek kirajzilásra a debuggoláshoz és teszteléshez használandó segédobjektumok opionálisan bekapcsolható megjelenítése. Ide tartozik a szenzorok látómezeje, a világobjektumok „poligon váza”, valamint utóbbiak eseményre történő kiemelésének lehetősége.


A jobb oldalon a műszerfal található. A műszerfalon nincsenek vezérlőelemek, csak megjelenítés. Az összes kapcsoló a billentyűzettel állítható, a grafikus elemeknek nem kell pl. egérrel kapcsolhatónak lenniük.

A fordulatszám és a sebesség legyen egy analóg órával reprezentálva; a kormány elforgazás, a gáz- és fékpedál állása progressbar-okkal szemléltethető. Az irányjelző visszajelzője és a vezetéstámogató funkciók visszajelzői lámpaszerűek, a sebességváltó állása, és a debug értékek pl. kocsi pozíciója (x, y koordináta) lehet szöveges.
A buszon közölt „utoljára látott tábla” képét ki kell tudni rajzolni (a képek rendelkezésre állnak). Legyen elkülönítve a nincs tábla eset is.

Az [*Avalonia* keretrendszer](http://avaloniaui.net/) által is használt [MVVM modell](http://avaloniaui.net/docs/quickstart/mvvm)ben az objektumokhoz tartozik egy definiált a megjelenítés.

![](http://avaloniaui.net/docs/quickstart/images/mvvm.png)

Jelen esetben például a műszerfal egy *AutomatedCar* objektum megjelenítése. Egészen pontosana *World*-ben tárolt `controlledCar` objektumé. A *DashboardView* a *DashboardViewModel*-en keresztül a `controlledCar`-hoz van kötve.

```xml
<ContentControl Name="Dashboard" Content="{Binding World.ControlledCar, Mode=OneWay}" >
    <ContentControl.ContentTemplate>
        <DataTemplate DataType="{x:Type models:AutomatedCar}">
            <StackPanel>
                ...
            </StackPanel>
        </DataTemplate>
    </ContentControl.ContentTemplate>
</ContentControl>
```

A példakód ezt biztosítja, a feladat a konkrét visszajelzőkhöz megfelelő felületi elemek definiálása.

### CourseDisplay

A teljes CourseDisplay léynegében egy *ItemsControl*, amely a világ `WorldObjects` tulajdonságához van kötve. Ezen belül található egy *Canvas*, amire a rajzolás történik, valamint egy *DataTemplate*, amely azt írja le, hogy egy *WorldObject* típusú objektumok hogyan kell kezelni. A világelemhez tartozó képet kell kirajzolni, így tartalmaz egy *Image*-et, amelynek forrása a *WorldObject* `Filename` tulajdonsága. A *Converter* attribútumon keresztül meg lehet hívni egy függvényt, amellyel befolyásolni lehet a rajzolást (transzformálás).

```xml
<ItemsControl Name="CourseDisplay"
    DataContext="{Binding World, Mode=OneWay}"
    Items="{Binding WorldObjects, Mode=OneWay}"
    Width="{Binding Width, Mode=OneWay}"
    Height="{Binding Height, Mode=OneWay}"
    HorizontalAlignment="Left" VerticalAlignment="Top"
    >
    
    <ItemsControl.ItemsPanel>
        <ItemsPanelTemplate>
            <Canvas/>
        </ItemsPanelTemplate>
    </ItemsControl.ItemsPanel>

    <ItemsControl.DataTemplates>
        <DataTemplate DataType="{x:Type models:WorldObject}">
            <Image Width="{Binding Width}" Height="{Binding Height}"
                Source="{Binding Filename, Converter={x:Static visualization:WorldObjectTransformer.Instance}}"/>
        </DataTemplate>
    </ItemsControl.DataTemplates>
</ItemsControl>
```