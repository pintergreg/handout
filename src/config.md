# Külső konfiguráció

Értelem szerűen nem akarunk minden opciót beledrótozni a kódba, hogy aztán csak újrafordítással lehessen ezeken módosítani. Ehhez szokás konfigurációs állományokat használni, amely tartalmazza a különböző beállítások alapértelmezett értékeit.

A projekt konfigurációs állománya a [`resources/config.toml`](https://github.com/SzFMV2018-Osz/AutomatedCar/blob/master/src/main/resources/config.toml) fájl. A [TOML nyelv](https://github.com/toml-lang/toml) meglehetősen komplex struktúrákat is megenged. Ezekre nem feltétlenül lesz ugyan szükség, viszont akár kommentezhetőek is az egyes opciók. A tárolhatóak numerikus, szöveges, logikai és dátum-idő típusú értékek is.

A legnyilvánvalóbb ilyen opció, amelyet már a kezdeti kód is használnál az a debug mód kapcsolója. Ez a `general.debug` úton érhető el, alapértelmezetten `false` értéket tartalmaz. Az összes hibakeresési céllal megjelenítendő extra információt ehhez a kapcsolóhoz kell kötni.
