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
