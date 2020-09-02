function rec(data) {
    data.p = {f: true};
    for (var i in data.c) {
        rec(data.c[i]);
    }
}

markdown = document.getElementById("markmap-source").childNodes[1].childNodes[1].innerHTML;
const data = markmap.transform(markdown);

rec(data);
data.p.f = false;
markmap.Markmap.create("#markmap-target", null, data);
