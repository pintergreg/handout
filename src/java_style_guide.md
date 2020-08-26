# Kódformázási előírások Java nyelvhez

„Örök kérdés”, hogy szóközök vagy tabok jelöljék-e a behúzást. Ma már minden normális editor beállítható úgyis, hogy a tab billentyű szóközöket szúrjon be, amelyik erre (sem) képest azt meg nem használjuk. A kérdés, legalábbis ezen tárgy keretein belül azzal zárult, hogy _mindenki_ szóközöket használ, tabok nem lehetnek a fájlban. Pont.
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


## Kulcsszó sorrend

A Javában a metódusok különböző módosítókkal láthatók el mint `static`, `public|private|protected`, `final` ám ezeknek előírt sorrendje is van. Nem a fordító írja elő sajnos, tehát lefordul, de konvenció, hogy ezeket milyen sorrendbe tesszük. Pl. a teljesség igénye nélkül  `public static` oké `static public` nem.
Sajnos a _Reformat Code_ ezt nem rázza gatyába, így az automatizált megoldás sem fogja, de ettől még stílus hiba.

Javítani lehet a helyzeten a File | Settings | Editor | Inspections | Java | Code style issues | Missorted modifiers inspection bepipálásával **ÉS** az Analyze | Code Cleanup _commit előtti_ alkalmazásával. Sajnálatos módon a Save Actions ezt nem tudja. :sob:

[_forrás_](https://stackoverflow.com/a/31203757/4737417)

## Javadoc

> Javadoc is a tool which comes with JDK and it is used for generating Java code documentation in HTML format from Java source code, which requires documentation in a predefined format.
>
> [tutorialspoint / Java - Documentation Comments](https://www.tutorialspoint.com/java/java_documentation.htm)

Tutorials:

- [tutorialspoint](https://www.tutorialspoint.com/java/java_documentation.htm)
- [baeldung.com/javadoc](https://www.baeldung.com/javadoc)