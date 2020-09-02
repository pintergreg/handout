# Kódformázás

![Code quality](https://www.explainxkcd.com/wiki/images/c/c6/code_quality.png)

A kód tisztasága, olvashatósága nem csak szemantikai, de szintaktikai értelemben is fontos. Minden nyelvnek megvannak a maga „nyelvtani”, szintaktikai előírásai, amit a fordító be is tartat. Azonban ezen túl megvannak azok az (íratlan) szabályai is, amiket már nem a fordító feladata betartatni. (A Go fordítónál ez kezd egybemosódni, pl. nem fordul a kód ha van deklarált, de fel nem használt változód, a [gofmt, Go format](https://golang.org/cmd/gofmt/) pedig kikényszeríti a kódformázási szabályokat.)

Ezek olyan kódformázási szabályok, amelyek több szinten lehetnek definiálva. Egyrészt (többé-kevésbé) egyezményesen egy-egy nyelv szintjén (pl. [PEP8](https://www.python.org/dev/peps/pep-0008/) Python esetében, gofmt), aztán lehetnek vállalati esetleg osztály és projekt szinten is.
Például a [Linux kernelkez tartozó előírások](https://01.org/linuxgraphics/gfx-docs/drm/process/coding-style.html) - többek között - 8 szóköznyi behúzást írnak elő és maximum 80 karakter széles sorokat. A gondolat emögött, hogy maximum három blokk mélységű szerkezet fogadható el, amikor is már a sor 30%-át teszi ki a behúzás. Ennél több behúzás esetén már nem sok hely marad a kódnak.

A Java nyelvhez is van(nak) kódformázási előírás(ok), amelyek egy része teljesen általános. Pl. a csomagnevek kisbetűsek, az osztály nevek mindig nagybetűvel kezdődnek (a fejlesztői környezetek ezt például általánosan számon kérik), a metódusnevek pedig kis betűvel kezdődnek továbbá a szóösszetételeknél nagybetűket használunk pl. `metódusNév`.

Átfogó ajánlást készített még 2000 környékén a Sun, ám ez mára meglehetősen túlhaladott, vagy ilyen a Google által összeállított [Google Java Style Guide](https://google.github.io/styleguide/javaguide.html).
Ez viszont helyenként túl specifikus (nagyvállalati környezetre optimalizált) a tárgy kereteihez, így nem egy az egyben ezt használjuk. A [Checkstyle](http://checkstyle.sourceforge.net/) statikus kódanalizátor default értékei vagy a Jetbrains által az IntelliJ IDEA-ba beállított default szabályok is felfoghatók egy ilyen ajánlásnak.

A C#-hoz a Microsoft definiálta a [kódformázási szabályokat](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/inside-a-program/coding-conventions), ezeket kell követni a tárgy során is.


# Statikus program analízis

A statikus analízis során a programkód végrehajtása nélkül, többnyire a forráskód elemzésével - automatizáltan - történik kód hibáinak feltárása.[[Wikipédia](https://en.wikipedia.org/wiki/Static_program_analysis)]
Ilyen eszköz Java nyelvhez például a nyílt forrású [PMD](https://pmd.github.io/), vagy a [Checkstyle](http://checkstyle.sourceforge.net/).

A kurzus során az utóbbit használjuk, amely figyeli a fentebb leírt formázási ajánlásokat ([teljes használható szabálylista](http://checkstyle.sourceforge.net/checks.html)). Ezen túlmenőleg egyéb hibafaktorokat is figyel: magic number-ek alkalmazása, string literál többszöri előfordulása, [Ciklomatikus komplexitás](https://en.wikipedia.org/wiki/Cyclomatic_complexity), túl sok paraméter a metódusban (5), túl hosszú metódus (20 utasítás), túl hosszú sor (120 karakter) valamint a kódban felejtett `TODO` és `FIXME` kommentekre is érzékeny.

A master repók ([A](https://github.com/SzFMV2018-Osz/AutomatedCar-A) és [B](https://github.com/SzFMV2018-Osz/AutomatedCar-B)) össze lett drótozva a [CodaFactorral](https://www.codefactor.io) és folyamatosan méri a kód minőségét, valamint egy A-tól F-ig tartó skálán [osztályozza](https://support.codefactor.io/i14-glossary) is (ahol az A a legjobb).
