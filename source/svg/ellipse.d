module svg.ellipse;

import std.stdio;
import std.string;
import svg.svgElement;

class Ellipse : SvgElement  {
    uint cx, cy, rx, ry, strokeWidth;
    string fill, stroke;

    this(uint cx, uint cy, uint rx, uint ry, string fill, string stroke, uint strokeWidth){
        this.cx = cx;
        this.cy = cy;
        this.rx = rx;
        this.ry = ry;
        this.stroke = stroke;
        this.fill = fill;
        this.strokeWidth = strokeWidth;
    }

    string toSvg() {
        return format(`<ellipse cx="%s" cy="%s" rx="%s" ry="%s" fill="%s" stroke="%s" stroke-width="%s" />`, cx, cy, rx, ry, fill, stroke, strokeWidth);
    }
}

unittest {
    Ellipse testEllipse = new Ellipse(50, 150, 20, 10, "white", "black", 2);
    version(unittest) writeln(format("Running test: ellipse(%s) should return ellipse element.", testEllipse));
    assert(testEllipse.toSvg == `<ellipse cx="50" cy="150" rx="20" ry="10" fill="white" stroke="black" stroke-width="2" />`);
    version(unittest) writeln("Test Success.");
}
