# Programozási nyelv

A feladat megoldásához Java nyelvet, annak is a 11-es verzióját kell használni, [Maven](https://maven.apache.org/guides/getting-started/index.html) projekt menedzsment eszközzel. (A kiinduló projekt ezeket már teljesíti). Egyaránt használható az [Oracle JDK 11](https://www.oracle.com/technetwork/java/javase/downloads/jdk11-downloads-5066655.html) vagy az [OpenJDK 11](http://openjdk.java.net/projects/jdk/11/) is, operációs rendszer sincs megszabva. (Az automatizált CI eszközök jogi okokból az OpenJDK-t használják, linuxon.)

Az ajánlott és támogatott fejlesztői környezet az [IntelliJ IDEA](https://www.jetbrains.com/idea/#chooseYourEdition), ez tartalmaz mindent amire szükség lehet a félév során. A Community Edition ingyenes, egyetemi e-mail címmel ingyen igényelhető Pro verzió!

Nincs elvi akadálya a [NetBeans](https://netbeans.org/), az [Eclipse](https://eclipse.org/downloads/) vagy tetszőleges _editor_ használatának sem, de ezek beállítása az elvárásoknak megfelelően egyéni felelősség.
NetBeanshez ajánlott plugin(-ek): [Git toolbar](http://plugins.netbeans.org/plugin/51604/git-toolbar)

A fejlesztői környezetek rendelkeznek Git integrációval, de a parancssoron kívül grafikus kliensek is [léteznek](https://git-scm.com/downloads/guis), többek között a [GitHub saját asztali kliense](https://desktop.github.com/).

# Tesztlefedettség

[Tesztlefedettség támogatás a fejlesztői eszközökben](tesztlefedettseg.md).

# Kódformázás

IDEA beállításai alapértelmezetten elvileg megfelelnek az elvárásoknak, így egy fájl befejezése után (de értelem szerűen commit előtt) célszerű egy formázást megejteni: Code > Reformat Code (CTRL+ALT+L)

* A behúzás beállítása: File > Settings > Editor > Code Style > Java > Tabs and Indents: nem tab, de 4 karakternyi
* A sorhossz beállítása: File > Settings > Editor > Code Style > Default Options > Right magin (columns) 120 kell, hogy legyen eredetileg
* Emellett default beállításokban a vessző és kettőspont utáni szóközök, illetve az operátorokat körbevevő szóközök is szerepelnek. Továbbá a kapcsos zárójelek használata is az elvártnak megfelelően van beállítva.

## Checkstyle plugin

[Checkstyle plugin](https://plugins.jetbrains.com/plugin/1065-checkstyle-idea) beállítása IntelliJ IDEA környezetbe. A plugin telepíthető a plugin managerből majd a következő beállításokra van szükség:

File > Settings > Other Settings > Checkstyle > Configuration File panelen _Add_ és a projekt gyökérben megtalálható `checkstyle.xml` fájlt kell neki megadni (és elnevezni valamiként, az alábbi képen `szfmv`). Innentől a fejlesztői környezeten belül elérhető a kódminőség-ellenőrzés *valós időben*, warning-okkal jelzi a találatokat. Bővebben [itt](kodformazas.md)!

![](https://raw.githubusercontent.com/SzFMV2018-Osz/handout/master/docs/images/idea_checkstyle_plugin_settings.png)
![](https://raw.githubusercontent.com/SzFMV2018-Osz/handout/master/docs/images/idea_checkstyle_findings.png)


# Logolás

[Logger használata](logging.md)

# Maven és a proxy

Ha valaki céges gépen dolgozik előírt proxy mellett, érdemes figyelni arra, hogy [a maven-nek külön kell konfigurálni a proxy-t](https://maven.apache.org/guides/mini/guide-proxies.html).

# Függőségeket tartalmazó futtatható `.jar` állomány létrehozása

``` shell
mvn clean compile assembly:single
```

Az eredmény a `target/AutomatedCar-jar-with-dependencies.jar`
