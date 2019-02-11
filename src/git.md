# Interaktív online oktató anyagok

1. [Webes interaktív oktatóanyag](https://www.katacoda.com/courses/git)
    - GitHub fiókkal -többek közt- a git kurzus ingyenesen végigvihető
    - az első 6 modul mindenképpen ajánlott
2. [Learn Git Branching](http://learngitbranching.js.org/)
    - ez kifejezetten a branchelésre megy rá, szóval nem véletlenül a második!

# Online anyagok

- [Version Control Tutorial](http://smutch.github.io/VersionControlTutorial/)
    - kezdőknek, az alapoktól
- [git - the simple guide](http://rogerdudler.github.io/git-guide/)
    - inkább újrakezdőknek, ismétlés szintű
- [Altassian Git tutoriálja](https://www.atlassian.com/git/tutorials)
- [Git Notes for Professionals book](http://goalkicker.com/GitBook/)
    - haladókank, nem tanítja a git használatát, de _probléma: megoldás_ alapon összefoglalja a használatának majd minden aspektusát (a Stackoverflow válaszok alapján)
- [Git könyv](https://git-scm.com/book/en/v2/)
    - mindent tartalmaz a gitről, gyakorlatilag a fejlesztők által írt dokumentáció
    - ["git branching in a nutshell"](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell) fejezete viszont minimum ajánlott
- [Fork szinkronizálása](https://help.github.com/articles/syncing-a-fork/)

## GitHub

- [GitHub oktató anyaga](https://guides.github.com/activities/hello-world/)
- [Understanding the GitHub Flow](https://guides.github.com/introduction/flow/)

## puskák PDF formátumban

- [GitHubtól](https://education.github.com/git-cheat-sheet-education.pdf)
- [GitLabtól](https://about.gitlab.com/images/press/git-cheat-sheet.pdf)
- [Altassiantól (BitBucket)](https://www.atlassian.com/dms/wac/images/landing/git/atlassian_git_cheatsheet.pdf)

# Commit üzenetekről

![xkcd 1296](https://www.explainxkcd.com/wiki/images/d/de/git_commit.png)

- [How to Write a Git Commit Message](https://chris.beams.io/posts/git-commit/)
    - ez egy hosszabb, példákkal illusztrált írás (angol  nyelven) a jó commit üzenetekről,
    - amely [hét szabályban](https://chris.beams.io/posts/git-commit/#seven-rules) foglalja össze, hogy mire kell figyelni
    - ugyanez érvényes a Pull Requestek üzenetére is, sőt még akkor sem tilos összefoglalni tömören a PR-ben összegzett funkciók lényegét, ha a commit-ok egyébként teljes mértékben betartják a fenti szabályokat!
- Egy commit üzenet utólagos megváltoztatása [nem egyszerű](https://help.github.com/articles/changing-a-commit-message/) (különösen ha pusholva lett, lokálisan még nem is olyan vészes), így eleve írjuk meg korrekten.
- Ha többen dolgoztok egy módosításon akkor a commit üzenet láblécében tüntessétek föl a [**társszerzőket is**](https://help.github.com/articles/creating-a-commit-with-multiple-authors/).

## Társszerzők

A munkafolyamat alapvetően egyéni munkára van kitalálva, de legkevésbé sem tilos a [pair programming](https://en.wikipedia.org/wiki/Pair_programming) sem. Volt, hogy Skype-os képernyő-megosztásos módszerrel dolgoztak _távolról_ párban... Ilyenkor mindig felvetődik a kérdés, hogy csak az egyik kolléga nevében történhet a commit de mi van a másikkal... A GitHub [bevezetett egy új funkciót](https://github.com/blog/2496-commit-together-with-co-authors) ennek orvoslására. Részletek [elérhetőek itt](https://help.github.com/articles/creating-a-commit-with-multiple-authors/).

Ebben az esetben a commit üzenet törzse után 2 üres sorral elválasztva kell a társszerzőket feltüntetni. Pl.:

```
Commit message header

Commit message body preceded by an empty line and followed by two empty lines and the trailer.


Co-authored-by: name <name@example.com>
Co-authored-by: another-name <another-name@example.com>"
```

Ahhoz, hogy a GitHub a társszerzőt össze is tudja rendelni a felhasználói fiókjával fontos, hogy az a `name` és különösen az az `e-mail` szerepeljen, amelyet egyébként git beállításként használ!

### Ímélcím védelme

A GH minden felhasználónak biztosít egy "proxy ímélcímet", hogy titokban tarthassa a címét, ez xxxxxxx+username@users.noreply.github.com szerkezetű, ahogy xxxxxxx egy hétjegyű felhasználói azonosító. Bővebben [itt](https://help.github.com/articles/about-commit-email-addresses/). Ezt is lehet használni, nem csak társszerzőhöz hanem saját címnek is, csak legyen konzisztens!

## További „iskolák”

- [AngularJS Git Commit Message Conventions](https://github.com/angular/angular/blob/master/CONTRIBUTING.md)
    - a commit üzenet fejlécét a `<type>(<scope>): <subject>`  szabály szerint követeli meg, ahol [típus](https://github.com/angular/angular/blob/master/CONTRIBUTING.md#type) lehet build, ci, docs, feat, fix, perf, refactor, style és test
- Egy másik a [Conventional Commits](http://conventionalcommits.org/)

# Mikor érdemes commit-olni?

- [When to make a Git Commit](https://dev.to/gonedark/when-to-make-a-git-commit)
    - a poszthoz tartozó kommenteket is érdemes átfutni...

# Pull Request-ek

- A fentiek igazak a PR üzenetére is!
- A PR üzenete kötelezően tartalmazza a következőket:
    - Masterbe küldés esetén melyik csapattól érkezik
    - Mit javít, a vonatkozó issue-val pl. `#42`
    - Milyen új funkcionalitást ad a kódhoz, a vonatkozó issue-val pl. `#42`
    - Milyen viselkedést változtat/tör meg, a vonatkozó issue-val pl. `#42`
        - ![Workflow](https://www.explainxkcd.com/wiki/images/b/b5/workflow.png)
