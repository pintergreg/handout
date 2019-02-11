# Logolás

Módfelett udvariatlan, káros és így kerülendő hibakeresési céllal a standard kimenetre (`System.out.println`) írni. Ettől még sokan megteszik mondván addig nincs baj, míg nem kerül pusholásra a közös repóba. Csakhogy a kódolás hevében könnyen ott felejthet az ember egy-két ilyet, így célszerű eleve bele sem tenni!

Szerencsére több logger is létezik, amik nem csak a `System.out.println` nem rendeltetés szerű használatát tudják megakadályozni, de bónuszként még egy halom hasznos és kényelmes funkcióval is rendelkeznek. A projektben az [Apache log4j 2.8](https://logging.apache.org/log4j/2.x/)-as verziója került bevezetésre.

## Konfigurálás

A logolási beállítások egyrészt helyzetfüggőek, másrészt a fejlesztő magánügyét képezik, így nem kényszerítjük rá a másikra a kedvenc beállításainkat. Ebből következik, hogy a `log4j2.xml` konfigurációs állomány nincs a *git* verziókezelő felügyelete alatt. Példa a tartalmára [[forrás](http://stackoverflow.com/a/21206994/4737417)]:

``` xml
<?xml version="1.0" encoding="UTF-8"?>
<Configuration status="INFO">
    <Appenders>
        <Console name="Console" target="SYSTEM_OUT">
            <PatternLayout pattern="%d{HH:mm:ss.SSS} [%t] %-5level %logger{36} - %msg%n" />
        </Console>
        <!--<File name="MyFile" fileName="all.log" immediateFlush="true" append="false">-->
            <!--<PatternLayout pattern="%d{yyy-MM-dd HH:mm:ss.SSS} [%t] %-5level %logger{36} - %msg%n"/>-->
        <!--</File>-->
    </Appenders>
    <Loggers>
        <Root level="debug">
            <AppenderRef ref="Console" />
            <!--<AppenderRef ref="MyFile"/>-->
        </Root>
    </Loggers>
</Configuration>
```
A fenti fájlt a projektmappába pl. a `src/main/resources/`-be kell elhelyezni. Jelenlegi beállításokkal **DEBUG** szintű, fájlba nem ment, csupán a fejlesztői környezet konzoljára ír. A fenti fájl hiányában **ERROR** beállításokkal fog működni.

## Szintek

A logolásnak több szintje van attól függően, hogy milyen finomságú részletekre vagyunk kíváncsiak. Ezek a szintek sorban (a legbővebbtől a legszűkebbig): ALL, TRACE, DEBUG, INFO, WARN, ERROR, FATAL, OFF. Ebből következik, hogy egy *INFO* szintű log üzenet meg fog jelenni *DEBUG* beállítások mellett, de nem fog megjelenni *ERROR* beállításokkal.

## Használata

``` java
package hu.oe.nik.automatedcar.demo;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Demo {
  private static final Logger LOGGER = LogManager.getLogger();

  public void demo(){
    LOGGER.debug("Ez egy debug szintű üzenet");
    LOGGER.error("Ez egy error szintű üzenet");
  }
}
```

## További leírás
- [Log4j2 xml configuration example](http://howtodoinjava.com/log4j2/log4j-2-xml-configuration-example/)
