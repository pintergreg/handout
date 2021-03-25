# Review

![](https://i.pinimg.com/originals/e2/7e/30/e27e30d4a5664bc266aff8b03ccc4028.jpg)

Az első két cikk inkább technikai, számokkal meg minden, a harmadik (ez kétrészes), sokkal inkább az emberi oldalt taglalja, igen jól!

- [What is Code Review?](https://smartbear.com/learn/code-review/what-is-code-review/)
- [Best Practices for Code Review](https://smartbear.com/learn/code-review/best-practices-for-peer-code-review/)
- [How to Do Code Reviews Like a Human (Part One)](https://mtlynch.io/human-code-reviews-1/)
    - [Part Two](https://mtlynch.io/human-code-reviews-2/)
- [Code Review Guidelines for Humans](https://phauer.com/2018/code-review-guidelines/)
- [Code Review Checklist – To Perform Effective Code Reviews](https://www.evoketechnologies.com/blog/code-review-checklist-perform-effective-code-reviews/)


## Review típusok

- [What are the types of review?](http://tryqa.com/what-are-the-types-of-review/)
    - Nem említi az informálist
- [Prezentáció a review typusokról, hasonlóan tárgyalja mint a Bosch-os](https://www.slideshare.net/Chandukar/istqb-foundation-chapter-3)
    - a 27. diáig ajánlom
- [Formális review részei](http://tryqa.com/what-is-formal-review/)


### Sorrendben

1. informal
    - Ez akár csak annyi, hogy megkérsz egy kollégát, hogy „nézz már rá erre picit, szerinted ez így jó?”, gyorsan tud valami visszajelzést adni, de semmi nyoma nem marad. A pair programming folyamatos informális review.
2. [walkthrough](http://tryqa.com/what-is-walkthrough-in-software-testing/)
    - a GitHub-os review majdnem ezen a szinten van, visszakövethető módon dokumentált a GitHub felületének hála, bár nem egy meeting folyamán történik a review, hanem egyénileg, szigorú protokoll nélkül. (Vezetője sincs, bár lehetne úgy is csinálni.)
3. [technical](http://tryqa.com/what-is-technical-review-in-software-testing/)
4. [inspection](http://tryqa.com/what-is-inspection-in-software-testing/)


### Összefoglaló táblázat a fentebbiek alapján

| type        | formality      | led by                            | effort   | documentation         |
| :---------: | :------------: | :-------------------------------: | :------: | :-------------------: |
| informal    | not formal     | noone                             | minimal  | undocumented          |
| walkthrough | not formal[^1] | authors                           | very low | normal, fault-finding |
| technical   | less formal    | trained moderator, NOT the author | moderate | more detailed         |
| inspection  | most formal    | trained moderator                 | high     | thorough; based on  standards, checklists |

[^1]:
Sometimes it can be somewhat formal.

<!--
https://www.cs.jhu.edu/~jorgev/cs106/bug.pdf
https://www.slideshare.net/philipmjohnson/06softwarereview
https://stackoverflow.com/questions/3533348/how-does-this-code-generate-the-map-of-india
https://www.tutorialspoint.com/software_testing_dictionary/code_walkthrough.htm
-->

---

<!-- https://spectrum.ieee.org/aerospace/aviation/how-the-boeing-737-max-disaster-looks-to-a-software-developer -->
