# GitHub

A félév során a GitHubot használjuk a kód tárolására, a feladatok menedzselésére is és kommunikációra is.

## Oktatóanyagok

- [**interaktív oktatófelület**](https://lab.github.com/)
- [GitHub Guides](https://guides.github.com/)


## Áttekintés

Minden hallgató tagja lesz a [SzFMV2020-Osz](https://github.com/SzFMV2020-Osz/) szervezetnek (`Organization`), és egy-egy csapatnak (Team A[1-4], Team B[1-4]). Minden csapat külön issue board-dal rendelkezik (`Projects`), ezen kell vezetni a feladatok (`issue`) megoldását (részletében lásd [Munkafolyamat](workflow.md)).

Issue-t nem csak feladatra lehet felvenni, akár kérdésre is (felénk vagy más csapatok felé is), probléma megvitatására is. Ez esetben célszerű megjelölni a ``type: question`` címkével. 2017 őszétől csapat (`team`) szintű fórummal (`Discussions`) is rendelkezik a GitHub. A szervezeten belül a csapatok hierarchikus struktúrában vannak. A gyökér az [Everyone](https://github.com/orgs/szfmv2020-osz/teams/everyone), az összes többi csapat ennek tagja (Group A, Group B csapatokon keresztül). Az Everyone falára írt üzeneteket mindenki megkapja. Ezen keresztül fogunk a félév során kurzus szintű közleményeket kiadni, de bárki használhatja kommunikációra. Ugyanilyen üzenőfallal rendelkezik az összes többi csapat is, amelyre szintén bárki írhat. Ha például a Team2-ből szeretné elérni valaki a Team3-at, akkor mindösszesen annyi a dolga, hogy ír a Team3 üzenőfalára. A [Instructors](https://github.com/orgs/SzFMV2020-Osz/teams/instructors) nevű team-en keresztül az oktatókat lehet elérni ugyanilyen módon.

A comment szekciókban is élnek az @ jeles említések, ez a mi esetünkben `@ravaszla` és `@pintergreg`, ugyanígy működik csapatra is pl. `@szfmv2020-osz/team-a1`, illetve `@szfmv2020-osz/instructors ` a mi esetünkben. Csapat esetében a csapat valamennyi tagja kap értesítést az hivatkozásról.

A GitHub valamennyi elemén használhatóak formázási lehetőségek [Markdown stílusban](https://guides.github.com/features/mastering-markdown/), kód kiemelésre is lehetőség van, amelyet több mint célszerű használni. Ehhez csak a nyelv nevét kell csak a nyitó  ``` jelek után írni:

<pre>
```python
def get_random_number():
    return 4;  # chosen by fair dice roll. guaranteed to be random.
```
</pre>

Eredmény:

```python
def get_random_number():
    return 4;  # chosen by fair dice roll. guaranteed to be random.
```

## Pull requestek kezelése:  review és ütközésfeloldás

Előfordulhat, hogy a git nem tudja feloldani a változtatásokat és emberi beavatkozást igényel a merge-elés. Például létrehoztad a feature branchet a csapat branch adott állapotáról, ám az időközben módosult és a módosítás ugyanazon fájl ugyanazon részét érintette. A GitHubon ez az alábbihoz hasonlóan néz ki:

![PR conflict](https://raw.githubusercontent.com/SzFMV2018-Osz/handout/master/docs/images/conflict.png)

Ezen belül is egyszerűbb esetekben a GH felajánlja a webes szerkesztőjét, de összetettebb esetekben ki kell checkolni az adott ágat és „kézzel” (editorral) feloldani helyzetet.

**Fontos!** A masterbe nem fogadunk el olyan PR-et, amelyben ütközés van, mivel jellemzően nem tudjuk eldönteni, hogy melyik változat fele meg „az utoljára megbeszélteknek”.

### Webes szerkesztő

A képen az  látható, hogy Hegedűs kolléga a `master` azon állapotában írta be a nevét, amikor a 64. sor volt az utolsó. Időközben egyéb PR-eket is elfogadtam így a git nem tudja, hogy a 68-73. sorokat kell megtartani vagy a 66.-at (ennek szintaktikáját látni a „kacsacsőrökkel”).

![GH web editor](https://raw.githubusercontent.com/SzFMV2018-Osz/handout/master/docs/images/conflict_web_editor.png)

 Jelen esetben persze mindkettő kell, így kézzel átrendezem, majd ezt megjelölöm feloldottnak:

![GH web editor](https://raw.githubusercontent.com/SzFMV2018-Osz/handout/master/docs/images/conflict_web_editor2.png)
![conflict resolved](https://raw.githubusercontent.com/SzFMV2018-Osz/handout/master/docs/images/conflict_mark_resolved.png)

**További tippek a témában**: https://stackoverflow.com/questions/161813/how-to-resolve-merge-conflicts-in-git

Ekkor a GH azt mutatja, hogy nincs ütközés, de review szükséges (ha nem is volt ütközés, akkor innen indul a történet).

### Lokális szerkesztő

Ha a GH webes felületén nem engedi az ütközés feloldását, akkor lokálisan kell. Az IDEA pl. az alábbi három paneles megoldást kínálja. Csak rá kell kattintgatni arra, amelyiket meg akarjuk tartani (vagy kézzel összemásolni mint a fönti példa esetében).

Ha valaki parancssorból intézi, akkor a beállított editorral nyitja meg (vi, nano, stb.) és szintaktikailag ugyanazt a megoldást kapja mint a webes editor esetében.

![](http://www.tilcode.com/wp-content/uploads/2015/09/intellij_merge_conflict_tool.png)

### Review

![review required](https://raw.githubusercontent.com/SzFMV2018-Osz/handout/master/docs/images/review_required.png)

Erre az „add your review” szolgál. Fájlonként át lehet nézni minden módosítást, soronként kommentelni, illetve egy globális véleményt írni a PR-ről (+1, -1, -2). A comment opció semleges, nem elfogadás, de nem is elutasítás. A másik két opció elég egyértelmű. Ha változtatást kérsz, akkor addig amíg a PR forrásbranche nem módosul nem lehet újra próbálkozni a PR elfogadásával.

![review](https://raw.githubusercontent.com/SzFMV2018-Osz/handout/master/docs/images/review_approved.png)

Ha minden rendben, akkor el lehet fogadni a PR-et:

![](https://raw.githubusercontent.com/SzFMV2018-Osz/handout/master/docs/images/mergable.png)

Elfogadás után így néz ki:

![](https://raw.githubusercontent.com/SzFMV2018-Osz/handout/master/docs/images/merged.png)

Ezen a ponton a feature branch nem szükséges továbbá, törölhető. Persze egy ideig még visszaállítható:

![](https://raw.githubusercontent.com/SzFMV2018-Osz/handout/master/docs/images/restore_branch.png)



## Branching modell

[War of the Git Flows](https://dev.to/scottshipp/war-of-the-git-flows-3ec2)

https://trunkbaseddevelopment.com/
https://www.endoflineblog.com/oneflow-a-git-branching-model-and-workflow#oneflow-advantages
https://docs.gitlab.com/ee/topics/gitlab_flow.html
https://guides.github.com/introduction/flow/

Az „[A successful Git branching model](http://nvie.com/posts/a-successful-git-branching-model/)” című posztban lehet olvasni egy szélesebb körben kedvelt modellről. A félév során használt többé-kevésbé ehhez hasonló.

![](https://raw.githubusercontent.com/SzFMV2018-Osz/handout/master/docs/images/branching.png)

A `master` branch védett, nem lehet bele commitolni. Nem egy, hanem több (4) fejlesztői branch-ünk van (`team1`, ..., `team4`), ezek szintén védettek. Minden feladathoz létre kell hozni egy *feature branch-et*, azon lehet dolgozni. Ha a feladat elkészült, akkor a csapat branchbe lehet *merge-eni*. Ami mivel védett [*pull request-et*](https://help.github.com/articles/about-pull-requests/) (továbbiakban PR) küldeni. A PR lehetőséget biztosít ellenőrzésekre és [review-zásra](https://help.github.com/articles/about-pull-request-reviews/). Csak a lefordítható, teszteknek megfelelő, ütközés (conflict) mentes PR kerülhet elfogadásra!

**Fontos**: Ha egy PR *nem* fogadható el, akkor sem kell a PR-t lezárni, lehet tovább dolgozni a forrás branchen, az új commit-okkal automatikusan frissül a PR is addig míg a teszteknek meg nem felel és elfogadásra nem került.

Ha a PR el lett fogadva, a feature branch-re nincs már tovább szükség. Le lehet törölni és be kell zárni azt az *issue-t* is, amihez a branch kapcsolódott. Tehát ideálisan minden (nem user-story és kérdés) issue-hoz készül(t) egy branch.

### Érdekes írások a témában

* [A _fork_ és a _branch_ közötti különbségekről](https://www.gitprime.com/the-definitive-guide-to-forks-and-branches-in-git/)
* [a simple git branching model](https://gist.github.com/jbenet/ee6c9ac48068889b0912)
* [Comparing Workflows](https://www.atlassian.com/git/tutorials/comparing-workflows)
* [Git branching and forking in the enterprise: why fork?](https://www.atlassian.com/blog/git/git-branching-and-forking-in-the-enterprise-why-fork)
* [Using the Fork-and-Branch Git Workflow](https://blog.scottlowe.org/2015/01/27/using-fork-branch-git-workflow/)
* [Stackoverflow / Forking vs. Branching in GitHub](https://stackoverflow.com/a/34343080/4737417)
* [A succesful Git branching model considered harmful](https://barro.github.io/2016/02/a-succesful-git-branching-model-considered-harmful/)

## Társszerzők

A munkafolyamat alapvetően egyéni munkára van kitalálva, de legkevésbé sem tilos a [pair programming](https://en.wikipedia.org/wiki/Pair_programming) sem. Volt, hogy Skype-os képernyő-megosztásos módszerrel dolgoztak _távolról_ párban... Ilyenkor mindig felvetődik a kérdés, hogy csak az egyik kolléga nevében történhet a commit de mi van a másikkal... A GitHub [bevezetett egy új funkciót](https://github.com/blog/2496-commit-together-with-co-authors) ennek orvoslására. Részletek [elérhetőek itt](https://help.github.com/articles/creating-a-commit-with-multiple-authors/).

Ebben az esetben a commit üzenet törzse után 2 üres sorral elválasztva kell a társszerzőket feltüntetni. Pl.:

```
Commit message header

Commit message body preceded by an empty line and followed by
two empty lines and the trailer.


Co-authored-by: name <name@example.com>
Co-authored-by: another-name <another-name@example.com>"
```

Ahhoz, hogy a GitHub a társszerzőt össze is tudja rendelni a felhasználói fiókjával fontos, hogy az a `name` és különösen az az `e-mail` szerepeljen, amelyet egyébként git beállításként használ!

### Ímélcím védelme

A GH minden felhasználónak biztosít egy "proxy ímélcímet", hogy titokban tarthassa a címét, ez xxxxxxx+username@users.noreply.github.com szerkezetű, ahogy xxxxxxx egy hétjegyű felhasználói azonosító. Bővebben [itt](https://help.github.com/articles/about-commit-email-addresses/). Ezt is lehet használni, nem csak társszerzőhöz hanem saját címnek is, csak legyen konzisztens!