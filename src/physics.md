# Az autó fizikája

Az autónak egy leegyszerűsített modellen keresztül ugyan, de mégis valóságosan kell viselkednie, ehhez pedig megfelelő fizikát kell leprogramozni. Az haladásához nyilván *sebességre* lesz szükség, amit a *motorerő* gyorsító ereje segítségével kaphatunk, és ami a gázpedál(t helyettesítő billentyű) elengedésével *nem szűnik meg azonnal*, tehát ha úgy tetszik lendületben marad, viszont a környezet (légellenállás, súrlódás) fokozatosan *fékezi*. Nem kell az egész univerzumot szimulálni, de legalább egy gyorsító és egy fékező erő például biztosan szükséges lesz.

Ezen jelenségeket (és még sok minden mást) egy autós játék fizikájáról Marco Monster szépen összefoglalta [Car Physics for Games](http://www.asawicki.info/Mirror/Car%20Physics%20for%20Games/Car%20Physics%20for%20Games.html) című írásában (angol nyelven).

Szintén hasznos lehet még [ezen írás](http://www.iforce2d.net/b2dtut/top-down-car) is, természetesen továbbra is angol nyelven, vagy tetszőleges egyéb irodalom.

## Kanyarodás 

* http://gamedev.stackexchange.com/questions/50022/typical-maximum-steering-angle-of-a-real-car
* http://engineeringdotnet.blogspot.hu/2010/04/simple-2d-car-physics-in-games.html

![](https://i.stack.imgur.com/DQsP9.png)

A fordulókör sugarának kiszámításához a fönti linkből származó képlet használható:

> atan(wheelbase / (turning circle - car width)) = angle

A [`car_2_white.png`](https://raw.githubusercontent.com/SzFMV2018-Osz/handout/master/resources/car_2_white.png) esetében a szélesség kb. 90px, a tengelytáv kb. 130px-nek tekinthető. Tegyük fel, hogy maximum 60°-ban kormányozható, ekkor a fordulókör sugara:

> - atan(130px / (r - 90px)) = 60°
>
> - tan(60) = 130/(r-90)
> - r = 130/tan(60) + 90
> - r = ~165px

**Figyelem, ezek lényegesen valósághűbb autó szimulálását tűzték ki célul mint ami itt minimálisan elvárt!**


## Szenzorok (2. sprint)

![](https://raw.githubusercontent.com/SzFMV2018-Osz/handout/master/docs/images/camera.png)
![](https://raw.githubusercontent.com/SzFMV2018-Osz/handout/master/docs/images/radar.png)
![](https://raw.githubusercontent.com/SzFMV2018-Osz/handout/master/docs/images/ultrasonic.png)

[Driver Assistance Systems, an introduction to Adaptive Cruise Control](http://www.eetimes.com/document.asp?doc_id=1272754)

## Parkolás (3. sprint)

1. Bring your car to a stop alongside the car at the front of the space.
2. Reverse into the space with an S motion.
3. Once the car is parallel with the curb, pull forward to center your car within the space.

![](https://www.dmv.ca.gov/imageserver/dmv/images/dlhdbk/perfect1.jpg)
![](https://www.dmv.ca.gov/imageserver/dmv/images/dlhdbk/perfect2.jpg)
![](https://www.dmv.ca.gov/imageserver/dmv/images/dlhdbk/perfect3.jpg)

[forrás](https://www.dmv.ca.gov/portal/dmv/detail/pubs/hdbk/parking)
