# Kódformázás

![Code quality](https://www.explainxkcd.com/wiki/images/c/c6/code_quality.png)

A kód tisztasága, olvashatósága nem csak szemantikai, de szintaktikai értelemben is fontos. Minden nyelvnek megvannak a maga „nyelvtani”, szintaktikai előírásai, amit a fordító be is tartat. Azonban ezen túl megvannak azok az (íratlan) szabályai is, amiket már nem a fordító feladata betartatni. (A Go fordítónál ez kezd egybemosódni, pl. nem fordul a kód ha van deklarált, de fel nem használt változód, a [gofmt, Go format](https://golang.org/cmd/gofmt/) pedig kikényszeríti a kódformázási szabályokat.)

Ezek olyan kódformázási szabályok, amelyek több szinten lehetnek definiálva. Egyrészt (többé-kevésbé) egyezményesen egy-egy nyelv szintjén (pl. [PEP8](https://www.python.org/dev/peps/pep-0008/) Python esetében, gofmt), aztán lehetnek vállalati esetleg osztály és projekt szinten is.
Például a [Linux kernelkez tartozó előírások](https://01.org/linuxgraphics/gfx-docs/drm/process/coding-style.html) - többek között - 8 szóköznyi behúzást írnak elő és maximum 80 karakter széles sorokat. A gondolat emögött, hogy maximum három blokk mélységű szerkezet fogadható el, amikor is már a sor 30%-át teszi ki a behúzás. Ennél több behúzás esetén már nem sok hely marad a kódnak.

A Java nyelvhez is van(nak) kódformázási előírás(ok), amelyek egy része teljesen általános. Pl. a csomagnevek kisbetűsek, az osztály nevek mindig nagybetűvel kezdődnek (a fejlesztői környezetek ezt például általánosan számon kérik), a metódusnevek pedig kis betűvel kezdődnek továbbá a szóösszetételeknél nagybetűket használunk pl. `metódusNév`.

Átfogó ajánlást készített még 2000 környékén a Sun, ám ez mára meglehetősen túlhaladott, vagy ilyen a Google által összeállított [Google Java Style Guide](https://google.github.io/styleguide/javaguide.html).
Ez viszont helyenként túl specifikus (nagyvállalati környezetre optimalizált) a tárgy kereteihez, így nem egy az egyben ezt használjuk. A [Checkstyle](http://checkstyle.sourceforge.net/) statikus kódanalizátor default értékei vagy a Jetbrains által az IntelliJ IDEA-ba beállított default szabályok is felfoghatók egy ilyen ajánlásnak.

## kódformázási előírások

Örök kérdés, hogy szóközök vagy tabok jelöljék-e a behúzást. Ma már minden normális editor beállítható úgyis, hogy a tab billentyű szóközöket szúrjon be, amelyik erre (sem) képest azt meg nem használjuk. A kérdés, legalábbis ezen tárgy keretein belül azzal zárult, hogy _mindenki_ szóközöket használ, tabok nem lehetnek a fájlban. Pont.
Egy rövid (nem túl komoly) videó a témában: [Silicon Valley - S03E06](https://youtu.be/SsoOG6ZeyUI)

- a behúzást 4 szóköz jelöli (nincs tab a fájlban)
- nem lehetnek üres blokkok
- a nyitó kapcsos zárójel a sor végén található
``` java
if (condition) {
    ...
}
```
- a záró kapcsos zárójel kulcsszavakkal azonos sorba helyezendő
``` java
try {
    ...
} catch (Exception ex) {
    ...
} finally {
    ...
}
```
- minden esetben ki kell tenni a blokkjelölő kapcsos zárójeleket
- osztályon belül meghatározott sorrendben szerepelnek az elemek
    1. Class (static) variables. First the public class variables, then protected, then package level (no access modifier), and then private.
    2. Instance variables. First the public class variables, then protected, then package level (no access modifier), and then private.
    3. Constructors
    4. Methods
- kerülendő az üres utasítás (`;`)
- mindig szükséges default ág a swith-case szerkezetben
- soronként egy utasítás szerepel
- kerülendő a `return` kulcsszavak halmozása egy metóduson belül
- kerülendőek a \*-os importálások
- kerülendő a nem használt importálás
- az osztály neve megegyezik a fájl nevével
- az operátorok körül, valamint a vessző és kettőspont után szóköz kerül


### Kulcsszó sorrend

A Javában a metódusok különböző módosítókkal láthatók el mint `static`, `public|private|protected`, `final` ám ezeknek előírt sorrendje is van. Nem a fordító írja elő sajnos, tehát lefordul, de konvenció, hogy ezeket milyen sorrendbe tesszük. Pl. a teljesség igénye nélkül  `public static` oké `static public` nem.
Sajnos a _Reformat Code_ ezt nem rázza gatyába, így az automatizált megoldás sem fogja, de ettől még stílus hiba.

Javítani lehet a helyzeten a File | Settings | Editor | Inspections | Java | Code style issues | Missorted modifiers inspection bepipálásával **ÉS** az Analyze | Code Cleanup _commit előtti_ alkalmazásával. Sajnálatos módon a Save Actions ezt nem tudja. :sob:

[_forrás_](https://stackoverflow.com/a/31203757/4737417)

# Statikus program analízis

A statikus analízis során a programkód végrehajtása nélkül, többnyire a forráskód elemzésével - automatizáltan - történik kód hibáinak feltárása.[[Wikipédia](https://en.wikipedia.org/wiki/Static_program_analysis)]
Ilyen eszköz Java nyelvhez például a nyílt forrású [PMD](https://pmd.github.io/), vagy a [Checkstyle](http://checkstyle.sourceforge.net/).

A kurzus során az utóbbit használjuk, amely figyeli a fentebb leírt formázási ajánlásokat ([teljes használható szabálylista](http://checkstyle.sourceforge.net/checks.html)). Ezen túlmenőleg egyéb hibafaktorokat is figyel: magic number-ek alkalmazása, string literál többszöri előfordulása, [Ciklomatikus komplexitás](https://en.wikipedia.org/wiki/Cyclomatic_complexity), túl sok paraméter a metódusban (5), túl hosszú metódus (20 utasítás), túl hosszú sor (120 karakter) valamint a kódban felejtett `TODO` és `FIXME` kommentekre is érzékeny.

A master repók ([A](https://github.com/SzFMV2018-Osz/AutomatedCar-A) és [B](https://github.com/SzFMV2018-Osz/AutomatedCar-B)) össze lett drótozva a [CodaFactorral](https://www.codefactor.io) és folyamatosan méri a kód minőségét, valamint egy A-tól F-ig tartó skálán [osztályozza](https://support.codefactor.io/i14-glossary) is (ahol az A a legjobb).

# IDEA plugin

Az az igazság, hogy elég unalmas az a fajta macska-egér játék, hogy visszadobok egy PR-et majd a javítás az összes hiba egy részére (jellemzően az explicit megemlítettekre) érkezik csupán, míg a checkstyle ugyanúgy tucatnyit tart nyilván...

Sajnos az integrált online eszköznek (CodeFactor) megvan a maga hiányossága és a PR esetében nem a legjobban jeleníti meg a hibákat, de ettől még listázza és a „Details” gombot használva ott kikereshető. Bármely branch kiválasztható majd fájl vagy issue szinten lehet gyönyörködni a hibákban.

![codacy_pr_details](https://user-images.githubusercontent.com/3854784/37600458-aacd7d90-2b87-11e8-9c4a-9a0cdf6e53f0.png)

**Van kiválóan működő Checkstyle plugin IDEÁhoz**, amely IDEA warningként real-time jelzi a hibákat, kérésre (IDE-n belüli futtatásra) pedig a teljes projekt-re vonatkozóan összeszedi őket.

Javasoltam már, hogy commit előtt mindenki nyomjon egy Code | Reformat Code-ot ([CTRL+ALT+L]), de erre nem sikerült rászokni...

## Save actions

Találtam nektek egy másik IDEA bővítményt a probléma automatizálására. Ez nem más mint a [Save Actions plugin](https://plugins.jetbrains.com/plugin/7642-save-actions), mely lehetővé teszi, hogy az amúgy is használt **mentés** (CTRL+S) parancshoz lehessen kötni a kódformázási műveletet.
A _Save Actions_ plugin konfigurálását az alábbiak szerint kell megejteni.
![idea_save_action](https://user-images.githubusercontent.com/3854784/37599751-c35c06c6-2b85-11e8-8018-a8a07c1c1aa7.png)

Zárójeles megjegyzés, hogy ez akkor fog tisztességesen működni, ha az IDEA kódformázási előírásai megfelelően vannak beállítva, vagy legrosszabb esetben default-on lett hagyva minden (már akkor is képes megszüntetni a Checkstyle-ben rögzített problémák jelentős részét).

[_forrás_](https://stackoverflow.com/a/28748557/4737417)
