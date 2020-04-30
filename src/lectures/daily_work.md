# Daily Work

## Communication

- A Remote communication strategies kifejezetten hasznos a [GitLab távmunka kézikönyvéből](https://learn.gitlab.com/all-remote/remote-playbook)
    - 18-26. oldal

> I am only responsible for what I said, not for what you understood

Igaz ez? Miért nem?

Számítsd bele, hogy a másik nem ugyanazzokkal az előismeretekkel rendelkezik, nem ugyanazzal a fogalomkészlettel, terminológiával, esetleg anyanyalvvel.

- [A Software Developer’s Guide to Project Communication: Part 1](https://www.lullabot.com/articles/effective-communication-part-1-greasing-the-wheels)
    - a 2. rész is ajánlott
- [Communication on Agile Software Teams](http://www.agilemodeling.com/essays/communication.htm)

## Requirement Engineering

- [Principles of Requirements Engineering](https://www.inflectra.com/Ideas/Whitepaper/Principles-of-Requirements-Engineering.aspx)
- Egy több részes cikk sorozat a Requirements Engineering-ről:
  - [Introduction (Part 1)](https://medium.com/omarelgabrys-blog/requirements-engineering-introduction-part-1-6d49001526d3)
  - [Elicitation & Analysis (Part 2)](https://medium.com/omarelgabrys-blog/requirements-engineering-elicitation-analysis-part-2-a02db801f135)
  - [Requirements Specification (Part 3)](https://medium.com/omarelgabrys-blog/requirements-engineering-elicitation-analysis-part-5-2dd9cffafae8)
  - [Requirements Validation (Part 4)](https://medium.com/omarelgabrys-blog/requirements-engineering-requirements-validation-part-6-29778d7bde24)
- [Requirements Engineering vs. Business Analysis](https://enfocussolutions.com/requirements-engineering-vs-business-analysis/)

---

- [HOW TO SPLIT A USER STORY](http://agileforall.com/wp-content/uploads/2018/02/Story-Splitting-Flowchart.pdf)
  - PDF, 1 oldal, flowchart

## Coding

![](https://miro.medium.com/max/978/1*jFw7ZZMoVcsEYM_fS33DBA.gif)

A TDD-ről részletesen a [TDD fejezetben](tdd.md).

### Cserkész szabály

> Always leave the campground cleaner than you found it
>
> -- Robert C. Martin (Uncle Bob)

- [Leave the code cleaner than the way you have found it!](https://codeburst.io/leave-the-code-cleaner-than-the-way-you-have-found-it-58c8e4ab3e83)

## Clean Code

> Always code as if the guy who ends up maintaining your code will be a violent psychopath who knows where you live. Code for readability. [source](https://groups.google.com/forum/#!msg/comp.lang.c++/rYCO5yn4lXw/oITtSkZOtoUJ)

A viccet félretéve az egész lényege az érthetőség és a karbantarthatóság. Két hét múlva is meg kell értened a saját kódod és nem csak neked.

<!--Elég vázlatos [összefoglalása](https://github.com/lastRoot/notes/wiki/Clean-Code-Rules-in-Java)-->

### Meaningful Names

Az alábbiak Robert C. Martin Clean Code című könyvénből a 2. fejezet (Meaningful Names) alfejezet címei, az idézetek is onnan valók.

- Use Intention-Revealing Names
    - > `int d; // elapsed time in days`
    - > `int elapsedTimeInDays;`
- Avoid Disinformation
- Make Meaningful Distinctions
    - > It is not sufficient to add number series or noise words, even though the compiler is satisfied. If names must be different, then they should also mean something different.
- Use Pronounceable Names
    - > If you can’t pronounce it, you can’t discuss it without sounding like an idiot. “Well, over here on the bee cee arr three cee enn tee we have a pee ess zee kyew int, see?”
    - Külön szempont ez nem angol anyanelyvűeknél, némely szavakat bonyolultabb kiejtenünk
- Use Searchable Names
    - > Single-letter names can ONLY be used as local variables inside short methods. *The length of a name should correspond to the size of its scope.*
- Avoid Mental Mapping
    - > Readers shouldn’t have to mentally translate your names into other names they already know.
    - > clarity is king
- Avoid Encodings
    - a modern IDE-k esetében már teljesen fölösleges típus vagy szerepjelöléseket tenni a nevekbe
- Pick One Word per Concept
- Don’t Pun or use humor
- Add Meaningful Context
    - > Imagine that you have variables named firstName, lastName, street, houseNumber, city, state, and zipcode. Taken together it’s pretty clear that they form an address. But what if you just saw the state variable being used alone in a method?

---

Nincs megjelölve forrás, de [ez az összefogleló](http://bensmith.io/20-tips-for-better-naming) is ezen a fejezeten alapszik.

### Functions

Az alábbiak Robert C. Martin Clean Code című könyvénből a 3. fejezetén alapulnak.

- A hossza legyen a lehető legrövidebb (akár 2-4 sor, bár személy szerint azt néha túlzásnak tartom)
- Do One Thing
- Use Descriptive Names
    - egy metódus valamit _csinál_, tehát kezdődjön igével, pl. `increaseSpeed`
    - a nevéből legyen egyértelmű, hogy mit csinál
    - > Robert C. Martin [The Inverse Scope Law of Function Names](https://www.informit.com/articles/article.aspx?p=1323426): The longer the scope of a function, the shorter its name should be. Functions that are called locally from a few nearby places should have long descriptive names, and the longest function names should be given to those functions that are called from just one place.
- Function Arguments
    - Lehetőleg ne használj 3-nál több paramétert
    - > Flag arguments are ugly [...] loudly proclaiming that this function does more than one thing.
- Have No Side Effects
    - >  [Wikipédiából](https://en.wikipedia.org/wiki/Side_effect_(computer_science)): an operation, function or expression is said to have a side effect if it modifies some state variable value(s) outside its local environment, that is to say has an observable effect besides returning a value (the main effect) to the invoker of the operation.
    - > Side effects are lies. Your function promises to do one thing, but it also does other hidden things.
- Prefer Exceptions to Returning Error Codes
    - a korábbiakból már adódik, hogy miért jobb egy FileNotFoundException mint egy ERRCODE_26375


### Comments

> One of the more common motivations for writing comments is bad code. We write a module and we know it is confusing and disorganized. We know it’s a mess. So we say to ourselves, “Ooh, I’d better comment that!” No! You’d better clean it!
>
> -- Robert C. Martin: Clean Code, pp 55.

- Gyakori a kód strukturálása kommentekkel, ilyenkor célszerű függvényeket használni inkább
- Kerülendő a TODO és a FIXME a kommentekben, ez azt jelenti, hogy nem vagy készen
- Kommentezni ajánlott viszont -szerintem- a domain specifikus részeket, amelyek megértését nem feltétlenül lehet elvárni egy fejlesztőtől. Pl. egy fizikai számítás.
- Továbbá nem haszontalan a dokumentációs kommentezés pl. Javadoc, kivéve ha egy `increaseSpeed` metódus kommentje annyi, hogy _"this method increases the speed"_, sokkal többet mondana az, hogy mennyivel, milyen korlátok között stb. amelyek révén aztán hasznos lesz a generált API dokumentáció anélkül, hogy a kódba kellene nézni.
<!--
- https://www.freecodecamp.org/news/code-comments-the-good-the-bad-and-the-ugly-be9cc65fbf83/
- [When Good Comments Go Bad](https://blog.codinghorror.com/when-good-comments-go-bad/)
-->
---

<img src="http://cdn.ttgtmedia.com/ITKE/uploads/blogs.dir/8/files/2008/07/goodcomments.jpg" width="320px" />

---

![](https://miro.medium.com/max/1400/0*g6BXiTlE5fsgAFyI.png)



## Verziókezelők

![](http://smutch.github.io/VersionControlTutorial/_images/vc-xkcd.jpg)

- [Ez az írás](https://tortoisesvn.net/docs/nightly/TortoiseSVN_en/tsvn-basics-versioning.html) összefoglalja a verziókezelési modelleket (Lock-Modify-Unlock, Copy-Modify-Merge), [emez pedig](https://homes.cs.washington.edu/~mernst/advice/version-control.html) összehasonlítja a centralizált és az elolszott verziókezelőket.
- [About Version Control](https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control)
  - a Git könyv első fejezete, rövid összefoglaló
- gyakorlati oldalról lást [Git](./git.md) fejezet


### Centralizált verziókezelő

![centralized_version_control](https://homes.cs.washington.edu/~mernst/advice/version-control-fig2.png)

### Elosztott verziókezelő

![distributed_version_control](https://homes.cs.washington.edu/~mernst/advice/version-control-fig3.png)

### Branching

- [Git Branching - Basic Branching and Merging](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging)
- [Gyakorlati oktatóanyagok](../git.md#interaktív-online-oktató-anyagok)

Az „[A successful Git branching model](http://nvie.com/posts/a-successful-git-branching-model/)” című posztban lehet olvasni egy szélesebb körben kedvelt modellről. A félév során használt többé-kevésbé ehhez hasonló.

![](https://www.rittmanmead.com/blog/content/images/2017/01/gitflow.png)


#### Egyéb érdekes írások a témában

* [A _fork_ és a _branch_ közötti különbségekről](https://www.gitprime.com/the-definitive-guide-to-forks-and-branches-in-git/)
* [a simple git branching model](https://gist.github.com/jbenet/ee6c9ac48068889b0912)
* [Comparing Workflows](https://www.atlassian.com/git/tutorials/comparing-workflows)
* [Git branching and forking in the enterprise: why fork?](https://www.atlassian.com/blog/git/git-branching-and-forking-in-the-enterprise-why-fork)
* [Using the Fork-and-Branch Git Workflow](https://blog.scottlowe.org/2015/01/27/using-fork-branch-git-workflow/)
* [Stackoverflow / Forking vs. Branching in GitHub](https://stackoverflow.com/a/34343080/4737417)
* [A succesful Git branching model considered harmful](https://barro.github.io/2016/02/a-succesful-git-branching-model-considered-harmful/)


### Commit üzenetek

![xkcd 1296](https://www.explainxkcd.com/wiki/images/d/de/git_commit.png)

A [How to Write a Git Commit Message](https://chris.beams.io/posts/git-commit/) egy hosszabb, példákkal illusztrált írás a jó commit üzenetekről, amely [hét szabályban](https://chris.beams.io/posts/git-commit/#seven-rules) foglalja össze, hogy mire kell figyelni. Ezt egészíteném ki egy nyolcadikkal.

1. [Separate subject from body with a blank line](https://chris.beams.io/posts/git-commit/#separate)
2. [Limit the subject line to 50 characters](https://chris.beams.io/posts/git-commit/#limit-50)
3. [Capitalize the subject line](https://chris.beams.io/posts/git-commit/#capitalize)
4. [Do not end the subject line with a period](https://chris.beams.io/posts/git-commit/#end)
5. [Use the imperative mood in the subject line](https://chris.beams.io/posts/git-commit/#imperative)
6. [Wrap the body at 72 characters](https://chris.beams.io/posts/git-commit/#wrap-72)
7. [Use the body to explain what and why vs. how](https://chris.beams.io/posts/git-commit/#why-not-how)
8. Reference the issue

#### További „iskolák”

- [AngularJS Git Commit Message Conventions](https://github.com/angular/angular/blob/master/CONTRIBUTING.md)
    - a commit üzenet fejlécét a `<type>(<scope>): <subject>`  szabály szerint követeli meg, ahol [típus](https://github.com/angular/angular/blob/master/CONTRIBUTING.md#type) lehet build, ci, docs, feat, fix, perf, refactor, style és test
    - nálunk nincs erre beállított tool
- Egy másik a [Conventional Commits](http://conventionalcommits.org/)

### Mikor commit-oljunk?

A [When to make a Git Commit](https://dev.to/gonedark/when-to-make-a-git-commit) poszthoz tartozó kommenteket is érdemes átfutni...

1. I complete a unit of work.
2. I have changes I may want to undo.


## Review

- [What is Code Review?](https://smartbear.com/learn/code-review/what-is-code-review/)
- [Best Practices for Code Review](https://smartbear.com/learn/code-review/best-practices-for-peer-code-review/)
- [Code Review Guidelines for Humans](https://phauer.com/2018/code-review-guidelines/)
- [Code Review Checklist – To Perform Effective Code Reviews ](https://www.evoketechnologies.com/blog/code-review-checklist-perform-effective-code-reviews/)
- [What are the types of review?](http://tryqa.com/what-are-the-types-of-review/)
    - Nem említi az informálist
- [Review fejezet](./review.md)

### A tárgy során

![review process](../images/proc3.png)

<!--## Java kódformázás-->
