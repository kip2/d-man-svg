module svg.circle;

import std.stdio;
import std.string;
import svg.svgElement;

class Circle : SvgElement {
    uint cx, cy, r;
    string fill;

    this(uint cx, uint cy, uint r, string fill) {
        this.cx = cx;
        this.cy = cy;
        this.r = r;
        this.fill = fill;
    }

    string toSvg() {
        return format(`<circle cx="%s" cy="%s" r="%s" fill="%s" />`, cx, cy, r, fill);
    }
}

unittest {
    Circle testCircle = new Circle(100, 100, 50, "red");
    version(unittest) writeln(format("Running test: circle(%s) should return circle element.", testCircle));
    assert(testCircle.toSvg == `<circle cx="100" cy="100" r="50" fill="red" />`);
    version(unittest) writeln("Test Success.");
}