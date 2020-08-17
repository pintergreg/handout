# Implementáció

## C#

A korábbi félévek visszajelzései visszetérő eleme volt, hogy C#-ban is meg lehessen oldani a feladatot. A cross-plastform fejleszés ugyan feltétel, így „csak” a [.NET Core](https://dotnet.microsoft.com/download/dotnet-core) jöhet szóba, ennek is a 3.1-es verziója (LTS).

A .NET 5 egyesíti majd a .NET Framework-öt és a .NET Core továbbá bevezeti a MAUI-t mint multiplatform keretrendszert grafikus felületek készítéséhez, ez azonban ma még [nem elérhető](https://devblogs.microsoft.com/dotnet/introducing-net-multi-platform-app-ui/).

Addig is szükség volt egy áthidaló megoldásra miután a WPF nem használható Windows-on kívül, erre a _3rd party_ [Avalonia](http://avaloniaui.net/) keretrendszert fogjuk használni. Az Avalonia a WPF-hez hasonlóan egy XAML alapú Model-View-ViewModel (MVVM) rendszer.

![.NET stack](images/dotnet_stack.png)

Használható fejlesztői környezetek: Visual Studio, VS Code (kizárólag a hivatalos, MS változattal működik együtt a .NET debugger), IntelliJ Rider, stb.


## Java

A feladat megoldásához Java nyelvet, annak is a 11-es verzióját kell használni (LTS), [Maven](https://maven.apache.org/guides/getting-started/index.html) projekt menedzsment eszközzel. (A kiinduló projekt ezeket már teljesíti). Egyaránt használható az [Oracle JDK 11](https://www.oracle.com/technetwork/java/javase/downloads/jdk11-downloads-5066655.html) vagy az [OpenJDK 11](http://openjdk.java.net/projects/jdk/11/) is, operációs rendszer sincs megszabva.
Az automatizált CI eszközök jogi okokból az OpenJDK-t használják, linuxon. Szóval már csak emiatt is „érdemes” platformfüggetlen kódot írni!

Az ajánlott és támogatott fejlesztői környezet az [IntelliJ IDEA](https://www.jetbrains.com/idea/#chooseYourEdition). A Community Edition ingyenes, ez tartalmaz mindent amire szükség lehet a félév során.Egyetemi e-mail címmel elvileg ingyen igényelhető Pro verzió.

Nincs elvi akadálya a [NetBeans](https://netbeans.org/), az [Eclipse](https://eclipse.org/downloads/) vagy tetszőleges _editor_ használatának sem, de ezek beállítása az elvárásoknak megfelelően egyéni felelősség.
NetBeanshez ajánlott plugin(-ek): [Git toolbar](http://plugins.netbeans.org/plugin/51604/git-toolbar)

<!--TODO-->
A fejlesztői környezetek rendelkeznek Git integrációval, de a parancssoron kívül grafikus kliensek is [léteznek](https://git-scm.com/downloads/guis), többek között a [GitHub saját asztali kliense](https://desktop.github.com/).


### Hasznos írások az implementációhoz

- [Billentyű/input kezelés](https://gamedev.stackexchange.com/questions/56017/java-best-implementation-keylistener-for-games)
- [Időzítés](https://web.archive.org/web/20190403012130/https://gafferongames.com/post/fix_your_timestep/)
- [Villódzásmentes rajzolás](https://docs.oracle.com/javase/tutorial/extra/fullscreen/doublebuf.html)
