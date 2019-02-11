## Online anyagok

Alább néhány, az interneten az ismert kulcsszavak alapján könnyen (legalábbis közepesen nehezen) elérhető link, amiket felhasználtam pl. az előadásokra való felkészülésre, így alkalmasnak tartom őket arra, hogy segítsenek benneteket a ZH-ra készülésben. Természetesen angol nyelven. ;)

- Clean code
    - [CleanCode intro](https://web.archive.org/web/20160610035745/http://www.itiseezee.com/?p=64)
    - [Names](https://web.archive.org/web/20160405060134/http://www.itiseezee.com/?p=83)
    - [Functions](http://www.itiseezee.com/?p=119)
    - [Formatting](http://www.itiseezee.com/?p=131)
- Verziókövetés
    - [Git könyv](https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control)
    - gyakorlati oldalról lást [Git anyagok](https://github.com/SzFMV2018-Osz/handout/Git-anyagok) szekció
- [Code review](https://smartbear.com/learn/code-review/what-is-code-review/)
- [Scrum](http://www.scrumhub.com/scrum-guide/)
    - [PDF verzió](http://www.scrumguides.org/docs/scrumguide/v1/scrum-guide-us.pdf)
    - [Scrum Master - Funny movie about The Power of Scrum](https://www.youtube.com/watch?v=P6v-I9VvTq4)
- [Kanban](https://www.scrumhub.com/kanban-fundamentals/)
- [The Rules of Extreme Programming](http://www.extremeprogramming.org/rules.html)
- [TDD Laws](http://butunclebob.com/ArticleS.UncleBob.TheThreeRulesOfTdd)
- [TDD wikiről](https://en.wikipedia.org/wiki/Test-driven_development)
- [Unit Testing with Junit](http://www.vogella.com/tutorials/JUnit/article.html)
- [Test Doubles](http://www.martinfowler.com/bliki/TestDouble.html)
    - az úriember blogján egyébként rengeteg hasonló hosszúságú, elég releváns bejegyzés van
- [The Transformation Priority Premise](https://8thlight.com/blog/uncle-bob/2013/05/27/TheTransformationPriorityPremise.html)
- [Advanced TDD: The Transformation Priority Premise](https://vimeo.com/97516288)
    - videó
- Refactoring
    - [Refactoring by Martin Fowler](https://martinfowler.com/books/refactoring.html)
    - [Refactoring methods](https://web.archive.org/web/20170606150219/http://www.integralist.co.uk/posts/refactoring-techniques.html)
    - [Refactoring methods](https://refactoring.com/catalog/)
    - [Refactoring Java Code](http://www.methodsandtools.com/archive/archive.php?id=4)
    - [Refactoring vs. Rewrite](https://www.targetprocess.com/blog/2009/11/refactoring-vs-rewrite/)
- [S.O.L.I.D.](http://www.codemag.com/article/1001061)
    - [Core Design Principles for Software Developers by Venkat Subramaniam](https://youtu.be/llGgO74uXMI)
        - Az egész előadás ajánlott, de a [Single Responsibility](https://www.youtube.com/watch?v=llGgO74uXMI&feature=youtu.be&t=3353) rész különösen, ez olyan 25 perc
- Legacy Code
    - [What are the key points of Working Effectively with Legacy Code?](http://programmers.stackexchange.com/questions/122014/what-are-the-key-points-of-working-effectively-with-legacy-code)
    - [Working Effectively With Legacy Code](http://www.slideshare.net/nashjain/working-effectively-with-legacy-code-presentation)
        - prezentáció
- [Code smells](https://blog.codinghorror.com/code-smells/)
- [Continuous Integration](https://martinfowler.com/articles/continuousIntegration.html)

## Javasolt (fel)készülési módszer

Mivel a diákat nem adjuk ki, célszerű jegyzetelni: **címszavakat**, **fogalmakat** leírni. Nem a diát kell lekörmölni, annak nincs értelme! Óra után (az óra hetében), ezekre rákeresni (pl. Google), illetve elolvasni az fönt elhelyezett anyagokat. A ZH előtti estén nem lehet ezt feldolgozni.

## Címszavak

Címszavak (különösebb sorrend nélkül) amelyeket az elméleti több-kevésbé lefedik. Ha valakinek valami nem tiszta, akkor célszerű megkérdezni a Googlet vagy a Wikit. ;)

agile, software craftmanship, extreme programming, user story, backlog, task, sprint, sprint review, sprint planning, standup, retro, clean code, version control, refactor, review (informal, wlakthrough, technical, inspection), pair programming, scrum, scrum master, product owner, developement team, cross functional team, self-organizing team, kanban, scrumban, demo, TDD, unit, unit testing (arrange, act, assert, annihilate), coding kata, code golf, legacy code, code smell, rotting code, dependency reduction, seams, continous integration, automated testing, continous deployment, nightly build, minimized context switch, DevOps, coding dojo, SOLID priciples, clean code, definition of done, milestone, deadline, mocking (dummy, stub, spy, mock, fake), requirement, requirement engineering, centralized version control, distributed version control, burndown chart, scrum of scrums, business value, traceability, finding, bug fixing, optimizing, refactoring, feature envy, code complexity

## Egyéb

Ezen anyagok nem képezik részét a ZH-n számon kért ismereteknek, ám úgy gondolom, hogy érdemes elolvasni és elgondolkodni rajtuk mindenkinek, aki a szoftverfejlesztést komolyabban gondolja puszta kreditszerzésnél.

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

## Ajánlott olvasmányok 

1. The Software Craftsman: Professionalism, Pragmatism, Pride – Robert C. Martin
2. The Clean Coder: A Code of Conduct for Professional Programmers – Robert C. Martin
3. Clean Code: A Handbook of Agile Software Craftsmanship – Robert C. Martin
4. Working Effectively with Legacy Code - Michael Feathers
5. TDD by Example – Kent Beck
6. XP Explained – Kent Beck

## Irónia

<img src="https://raw.githubusercontent.com/thepracticaldev/orly-full-res/master/blamingtheuser-big.png" alt="blamingtheuser" width="300px"/>
<img src="https://raw.githubusercontent.com/thepracticaldev/orly-full-res/master/expertexcusesfornotwritingunittests-big.png" alt="expertexcusesfornotwritingunittests" width="300px"/>
<img src="https://raw.githubusercontent.com/thepracticaldev/orly-full-res/master/nobodyelsecanread-big.png" alt="nobodyelsecanread" width="300px"/>
<img src="https://raw.githubusercontent.com/thepracticaldev/orly-full-res/master/temporaryworkarounds-big.png" alt="temporaryworkarounds" width="300px"/>
<img src="https://raw.githubusercontent.com/thepracticaldev/orly-full-res/master/googlingtheerrormessage-big.png" alt="googlingtheerrormessage" width="300px"/>
<img src="https://raw.githubusercontent.com/thepracticaldev/orly-full-res/master/notwritingdocs-big.png" alt="notwritingdocs" width="300px"/>
<img src="https://raw.githubusercontent.com/thepracticaldev/orly-full-res/master/uninformativegitcommit-big.png" alt="uninformativegitcommit" width="300px"/>
<img src="https://raw.githubusercontent.com/thepracticaldev/orly-full-res/master/changinstuff-big.png" alt="changinstuff" width="300px"/>
<img src="https://raw.githubusercontent.com/thepracticaldev/orly-full-res/master/tryingstuffuntilitworks-big.png" alt="tryingstuffuntilitworks" width="300px"/>
<img src="https://raw.githubusercontent.com/thepracticaldev/orly-full-res/master/coffeeintocode-big.png" alt="coffeeintocode" width="300px"/>
<img src="https://raw.githubusercontent.com/thepracticaldev/orly-full-res/master/codingontheweekend-big.png" alt="codingontheweekend" width="300px"/>
