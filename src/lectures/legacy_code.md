# Legacy code

Ez a fejezet gyakorlatilag teljes egészében Michael Feathers _Working Efficiently with Legacy Code_ c. könyvén alapszik. [Itt elérhető](https://www.slideshare.net/nashjain/working-effectively-with-legacy-code-presentation) egy prezentáció a szerzőtől.

<!-- toc -->

<!--
- [Jeremy Thurgood „Surviving a Legacy Codebase” című prezentációja](https://jerith.github.io/pyconza2017-surviving-a-legacy-codebase/#/)
    - Ez egy `reveal.js` prezentáció, a fejezetek között a jobbra/balra nyilakkal, a fejezeteken belül a fel/le nyilakkal lehet lépkedni, vagy simán space-el végig lehet nyomogatni mint egy PowerPoint prezit.
    - Mivel egy Python konferencián hangzott el, ami pár sornyi kód szerepel benne, az Python-ul van.
-->

## Mi a Legacy Code?

> Code without tests is bad code. It doesn’t matter how well written it is; it doesn’t matter how pretty or object-oriented or well-encapsulated it is. With tests, we can change the behavior of our code quickly and verifiably. Without them, we really don’t know if our code is getting better or worse.
>
> -- Feathers, M. (2004). Working Effectively with Legacy Code: Preface


- [További definíciók](https://dzone.com/articles/defining-legacy-code)
- Legacy Code
    - [What are the key points of Working Effectively with Legacy Code?](http://programmers.stackexchange.com/questions/122014/what-are-the-key-points-of-working-effectively-with-legacy-code)
    - [Working Effectively With Legacy Code](http://www.slideshare.net/nashjain/working-effectively-with-legacy-code-presentation)
        - prezentáció


### The Legacy Code Dilemma

> When we change code, we should have tests in place. To put tests in place, we often have to change code.
>
> -- Feathers, M. (2004). Working Effectively with Legacy Code: Part I / Chapter 2


### Code Smells

- [Code Smells](https://blog.codinghorror.com/code-smells/)


##  Changing Software

> |                  | adding a feature | fix a bug | refactor | optimizing |
> | ---------------- | ---------------- | --------- | -------- | ---------- |
> | structure        | changes          | changes   | changes  |            |
> | functionality    | changes          |           |          |            |
> | new funcionality |                  | changes   |          |            |
> | resource usage   |                  |           |          | changes    |
>
> -- Feathers, M. (2004). Working Effectively with Legacy Code: WORK EFFECT LEG CODE p1. pp 6. Prentice Hall Professional.



## The legacy code algorithm

- [Working Effectively with Legacy Code](https://bssw.io/items/working-effectively-with-legacy-code)
- [Matthias Günther jegyzetei a „Working Effectively with Legacy Code” könyvből](https://wikimatze.de/books/working-effectively-with-legacy-code/)
- [Jeremy W. Sherman jegyzetei a „Working Effectively with Legacy Code” könyvből](https://gist.github.com/jeremy-w/6774525)


## Sensing & Separation

> 1. Sensing — We break dependencies to sense when we can’t access values our code computes.
> 2. Separation — We break dependencies to separate when we can’t even get a piece of code into a test harness to run.
>
> -- Feathers, M. (2004). Working Effectively with Legacy Code: Part I / Chapter 3


## Mocking

- [Type of Mocks](http://blog.tremblay.pro/2017/09/mocks.html)
- [Test Doubles — Fakes, Mocks and Stubs](https://blog.pragmatists.com/test-doubles-fakes-mocks-and-stubs-1a7491dfa3da)
    - ez egy másik írás, bővebb, ábrákkal, Java kódokkal...
- [Test Doubles](http://www.martinfowler.com/bliki/TestDouble.html)
    - az úriember blogján egyébként rengeteg hasonló hosszúságú, elég releváns bejegyzés van
- [How to write good tests](https://github.com/mockito/mockito/wiki/How-to-write-good-tests)


## Seams

> A seam is a place where you can alter behavior in your program without editing in that place.
>
> -- Feathers, M. (2004). Working Effectively with Legacy Code: Part I / Chapter 4

- [Nagyon rövid kivonata a Working Effectively with Legacy Code 1. rész / 4. fejezetének](https://medium.com/@biratkirat/working-effectively-with-legacy-code-changing-software-part-1-chapter-4-b997b78fc0a2)


# SOLID

![](https://devopedia.org/images/article/177/8101.1558682601.png)

- [S.O.L.I.D. Software Development, One Step at a Time](http://www.codemag.com/article/1001061)
    - igen részletes írás
- [SOLID Design Principles](https://devopedia.org/solid-design-principles)
- [Core Design Principles for Software Developers by Venkat Subramaniam](https://youtu.be/llGgO74uXMI)
    - Hosszabb (2,5 órás) előadás, a [Single Responsibility](https://www.youtube.com/watch?v=llGgO74uXMI&feature=youtu.be&t=3353) inenntől, ez olyan 25 perc

<!--
- [**S**ingle-responsibility principle](https://en.wikipedia.org/wiki/Single-responsibility_principle)
- [**O**pen–closed principle](https://en.wikipedia.org/wiki/Open%E2%80%93closed_principle)
- [**L**iskov substitution principle](https://en.wikipedia.org/wiki/Liskov_substitution_principle)
- [**I**nterface segregation principle](https://en.wikipedia.org/wiki/Interface_segregation_principle)
- [**D**ependency inversion principle](https://en.wikipedia.org/wiki/Dependency_inversion_principle)

https://softwareengineering.stackexchange.com/questions/122014/what-are-the-key-points-of-working-effectively-with-legacy-code
-->
