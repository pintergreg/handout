# Az autó fizikája

Az autónak egy leegyszerűsített modellen keresztül ugyan, de mégis valóságosan kell viselkednie, ehhez pedig megfelelő fizikát kell leprogramozni. Az haladásához nyilván *sebességre* lesz szükség, amit a *motorerő* gyorsító ereje segítségével kaphatunk, és ami a gázpedál(t helyettesítő billentyű) elengedésével *nem szűnik meg azonnal*, tehát ha úgy tetszik lendületben marad, viszont a környezet (légellenállás, súrlódás) fokozatosan *fékezi* (akár egyetlen lassító erő is elegendő). Nem kell az egész univerzumot szimulálni, de legalább egy gyorsító és egy fékező erő például biztosan szükséges lesz.

Ezen jelenségeket (és még sok minden mást) egy autós játék fizikájáról Marco Monster szépen összefoglalta [Car Physics for Games](http://www.asawicki.info/Mirror/Car%20Physics%20for%20Games/Car%20Physics%20for%20Games.html) című írásában (angol nyelven).

Szintén hasznos lehet még [ezen írás](http://www.iforce2d.net/b2dtut/top-down-car) is, természetesen továbbra is angol nyelven, vagy tetszőleges egyéb irodalom (hint: Google, Stackoverflow, Wikipedia).

Az autóhoz [automata váltót](https://auto.howstuffworks.com/automatic-transmission.htm) kell megvalósítani, de az automata vátóban is vannak „belső” fokozatok (1, 2, 3, 4 stb. előremenetben), tehát meg kell különböztetni a „külső” fokozatokat (P, R, N, D) és D állapotban a belsőket.

## Kanyarodás

* http://gamedev.stackexchange.com/questions/50022/typical-maximum-steering-angle-of-a-real-car
* http://engineeringdotnet.blogspot.hu/2010/04/simple-2d-car-physics-in-games.html

![](https://i.stack.imgur.com/DQsP9.png)

A fordulókör sugarának kiszámításához a fönti linkből származó képlet használható:

> atan(wheelbase / (turning circle - car width)) = angle

A [`car_2_white.png`](resources/car_2_white.png) esetében a szélesség kb. 90px, a tengelytáv kb. 130px-nek tekinthető. Tegyük fel, hogy maximum 60°-ban kormányozható, ekkor a fordulókör sugara:

> - atan(130px / (r - 90px)) = 60°
>
> - tan(60) = 130/(r-90)
> - r = 130/tan(60) + 90
> - r = ~165px

**Figyelem, ezek lényegesen valósághűbb autó szimulálását tűzték ki célul mint ami itt minimálisan elvárt!**
