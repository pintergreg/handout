# Szenzorok

A vezetéstámogató rendszerek 3 fő szenzorra épülnek: kamera, radar és ultrahang. A valóságban adott esetben a vezetéstámogató rendszerek több szenzor együttes használatával működnek (a szoftverben ilyet nem kell megvalósítani).

További olvasmány: [Driver Assistance Systems, an introduction to Adaptive Cruise Control](http://www.eetimes.com/document.asp?doc_id=1272754)

## Kamera

A kamera a szélvédő mögött található, 60°-os látószöggel 80 méterre lát el. A [táblafelismerő rendszer](functions.md#t%C3%A1blafelismer%C5%91-traffic-sign-recognition---tsr) és a [sávtartó automatika](functions.md#s%C3%A1vtart%C3%B3-automatika-lane-keeping-assistant---lka) használja.

![](images/camera.png)

## Radar

A radar az autó lökhárítóján helyezkedik el, 60°-os látószöggel 200 méterre lát el. Az [adaptív tempomat](functions.md#adapt%C3%ADv-tempomat-adaptive-cruise-control---acc) és az [autonóm vészfékező rendszer](functions.md#auton%C3%B3m-v%C3%A9szf%C3%A9kez%C5%91-rendszer-automatic-emergency-brake---aeb) épül rá.

![](images/radar.png)

A valóságban a radar több járművet is azonosít. A azonos sávban közvetlenül előtte haladót, a szomszédos sávokban haladó autókat és a képes az azonos sávban haladó előttit is azonosítani (az autó alatt átverődő jelekkel). Ennek köszönhetően az olyan potenciálisan veszélyes manőverek mint a szomszéd sávból elénk bevágó autó is felismerhető mivel folyamatosan figyeli ezek helyzetét.

![](images/radar_lanes.png)


## Ultrahang

Az ultrahang szenzorból 8 darab van az autón, látótávolsága 3 méter, látószöge 100°, a [parkoló asszisztens](functions.md#parkol%C3%B3-asszisztens-parking-pilot---pp) és a [tolatóradar](functions.md#tolat%C3%B3radar) épül rá.

![](images/ultrasonic.png)
