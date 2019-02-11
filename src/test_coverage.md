# Tesztlefedettség

A kód „minőség” egy mérőszáma lehet, hogy mekkora része van (unit)tesztekkel lefedve. Ezt a projekt README-ben a [Coveralls.io](https://coveralls.io/github/SzFMV2017-Tavasz/AutomatedCar?branch=master) szolgáltatás folyamatosan meg is jeleníti.

Ehhez a [JaCoCo](http://www.eclemma.org/jacoco/)-t használjuk, ami Maven-en keresztül (a `pom.xml`-ben) lett beállítva. A kód tesztekkel történő lefedettségének megjelenítéséhez a fejlesztői környezetek mindenféle okos eszközöket is rendelkezésre bocsátanak.

Az IntelliJ IDEA-ban beépített megoldás is van, illetve olyan külső eszközöket is képes használni mint a JaCoCo. Képes arra, hogy színkódokkal megfesse az egyes metódusokat annak megfelelően, hogy van-e hozzá teszt.

A [beállításához](https://www.jetbrains.com/help/idea/2016.3/code-coverage.html) meg kell nyitni a [Run/debug configuration](https://www.jetbrains.com/help/idea/2016.3/creating-and-editing-run-debug-configurations.html) ablakot, majd a *Code Coverage* fülön kiválasztani az IntelliJ IDEA-t vagy a JaCoCo-t, előbbi Tracing típusú vizsgálatot is tud (ami jelenleg mindegy). Ezután a *Run* menü *Run 'Main' with Coverage* menüpontjával a kódot úgy futtatja, hogy a számításokat el is végzi és megjeleníti az összesítő panelt.

Az IDEA-n kívül más IDE-khez is megtalálhatóak hasonló funkciók: [NetBeans](http://wiki.netbeans.org/MavenCodeCoverage), [Eclipse](http://www.eclemma.org/jacoco/)

### Képernyőképek

![](https://raw.githubusercontent.com/SzFMV2018-Osz/handout/master/docs/images/idea_run_debug_config_menu.png)
![](https://raw.githubusercontent.com/SzFMV2018-Osz/handout/master/docs/images/idea_run_debug_config_window.png)
![](https://raw.githubusercontent.com/SzFMV2018-Osz/handout/master/docs/images/idea_coverage_window.png)
