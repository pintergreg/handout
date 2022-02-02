# Test Driven Development

<!-- toc -->


## Tesztelés

Az alábbi ábra mutatja a tesztelések eloszlását hagyományos és agilis fejlesztéseknél. Az egész lényege, hogy minél előbb és a fejlesztőhöz a lehető legközelebb derüljön ki a hiba, mert annál gyorsabb és olcsóbb annak javítása. Könnyen belátható, hogy egy leszállított terméket kell visszahívni az körülményesebb mintha a fejlesző a _run tests_ gombra nyomva azonnal, helyben az adott kód részlet írása közben (amikor még az a kontextus van a fejében) kap egy képet arról, hogy mi nem jó.
De még midnig jobb ha pl. sprinten belül egy automatizált integrációs teszt fogja meg a hibát, stb.

![test pyramids](http://www.adapttransformation.com/wp-content/uploads/flippyramid.png)


## TDD

![](https://miro.medium.com/max/988/0*rxhD9QmJ6dBghRj1.)

- [What is Test Driven Development?](https://www.guru99.com/test-driven-development.html)
- [Introduction to Test Driven Development (TDD)](http://agiledata.org/essays/tdd.html)
- [TDD](https://www.agilealliance.org/glossary/tdd)
- [TDD Laws](http://butunclebob.com/ArticleS.UncleBob.TheThreeRulesOfTdd)
    - Az eredeti egy refaktorált verziója [innen](http://www.javiersaldana.com/articles/tech/refactoring-the-three-laws-of-tdd):
        1. Write production code only to make a failing unit test pass.
        2. Write only enough of a unit test to fail.
        3. Write only enough production code to make the failing unit test pass.
- [TDD wikiről](https://en.wikipedia.org/wiki/Test-driven_development)


## TDD cycle

<!-- ![](https://miro.medium.com/max/978/1*jFw7ZZMoVcsEYM_fS33DBA.gif) -->

![](../images/tdd.png "TDD mantra: red, green, refactor")

> As the tests get more specific, the code gets more generic.
>
> -- [Uncle Bob](https://sites.google.com/site/unclebobconsultingllc/home/articles/as-the-tests-get-more-specific-the-code-gets-more-generic)


## Red

- tesztelj egyszerre egy dolgot
- a teszt legyen nagyon egyszerű
- folyamatosan növeld teszt(esetek) komplexitását
- [mockold a függőségeket](./legacy_code.html#mocking)


### Writing Unit Tests

- [Writing Unit Tests For Dummies](https://medium.com/@justborromeo/writing-unit-tests-for-dummies-e4282bbfef7c)
- [Unit Testing with Junit](http://www.vogella.com/tutorials/JUnit/article.html)


## Green

- a lehető legegszerűbb kóddal felelj meg a teszt által támasztott követelménynek
- nem baj ha csúnya, ebben a lépésben csak az számít, hogy a teszt ne bukjon
- amint a teszt zöld (és másik sem bukik), ez a fázis kész

## Refactor

- [Refactoring by Martin Fowler](https://martinfowler.com/books/refactoring.html)
- [Refactoring methods](https://web.archive.org/web/20170606150219/http://www.integralist.co.uk/posts/refactoring-techniques.html)
- [Refactoring methods](https://refactoring.com/catalog/)
- [Refactoring Java Code](http://www.methodsandtools.com/archive/archive.php?id=4)
- [Refactoring vs. Rewrite](https://www.targetprocess.com/blog/2009/11/refactoring-vs-rewrite/)


### Transformation Priority Premise

Beragadás esetén visszalépés, vagy másik módszert kell választani. A beragadás megelőzésére van a TPP.

- [Robert C. Martin (Uncle Bob) írása](https://blog.cleancoder.com/uncle-bob/2013/05/27/TheTransformationPriorityPremise.html), összefoglalásul pedig a transformációk:
    1. ({} -> nil) no code at all -> code that employs nil
    2. (nil -> constant)
    3. (constant -> constant+) a simple constant to a more complex constant
    4. (constant -> scalar) replacing a constant with a variable or an argument
    5. (statement -> statements) adding more unconditional statements.
    6. (unconditional -> if) splitting the execution path
    7. (scalar -> array)
    8. (array -> container)
    9. (statement -> tail-recursion)
    10. (if -> while)
    11. (expression -> function) replacing an expression with a function or algorithm
    12. (variable -> assignment) replacing the value of a variable.
- [Advanced TDD: The Transformation Priority Premise](https://vimeo.com/97516288)
    - 1 órás videó, Robert C. Martintól


## Coding Dojo

- [Coding Dojo](https://medium.com/@lucascaixeta/coding-dojo-4e0b1ea69735)


## Egyéb a TDD-hez (lazábban) kapcsolódó anyagok

- Behavior Driven Development
    - Ez a TDD kiterjesztése, lényege, hogy a megrendelővel (és nem is annyira egy menedzserrel, hanem sokkal inkább egy domain szakértőjével) való egyeztetés folyamán, egy strukturált, ám természetes nyelvi szöveggel leírt „szabályok” formájában kerül leírásra az elvárt működés. Ezek alapján aztán a fejlesztő _több tesztet is ír_ (szemben a TDD-vel, ahogy egyszerre szigorúan egyet), majd a tesztek összességének megfelelő kódot ír
    - [TDD vs. BDD](https://www.toptal.com/freelance/your-boss-won-t-appreciate-tdd-try-bdd)
    - [Wikipédia BDD cikke](https://en.wikipedia.org/wiki/Behavior-driven_development)
    - [Agile alliance összefoglalója a BDD-ről](https://www.agilealliance.org/glossary/bdd/)
- [Readme Driven Development](http://tom.preston-werner.com/2010/08/23/readme-driven-development.html)
    - Különösen ajánlom elolvasni, kb. egy oldal
- [Acceptance Test Driven Development (ATDD)](http://www.methodsandtools.com/archive/archive.php?id=72)
- [types vs. tests](https://www.destroyallsoftware.com/talks/ideology)
    - video ~21 min
- [I don't need types](https://dmerej.info/blog/post/trying-mypy/)
    - blogposzt a típusosságról

<!--
https://diveintopython3.net/unit-testing.html
![](https://www.agilecoachjournal.com/wp-content/uploads/2014/01/AgileTestingPyramid2.jpg)
-->
