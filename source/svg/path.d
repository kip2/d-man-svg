module svg.path;

import std.stdio;
import std.string;
import svg.svgElement;

class Path : SvgElement {
    string d, fill, stroke, fillRule;
    uint strokeWidth;

    this(string d, string fill, string stroke, uint strokeWidth, string fillRule) {
        this.d = d;
        this.fill = fill;
        this.stroke = stroke;
        this.strokeWidth = strokeWidth;
        this.fillRule = fillRule;
    }

    string toSvg() {
        return format(`<path d="%s" fill="%s" stroke="%s" stroke-width="%s" fill-rule="%s" />`, d, fill, stroke, strokeWidth, fillRule);
    }
}

unittest {
    Path testPath = new Path("M110 100 A20 20", "black", "none", 1, "evenodd");
    version(unittest) writeln(format("Running test: path(%s) should return path element.", testPath));
    assert(testPath.toSvg == `<path d="M110 100 A20 20" fill="black" stroke="none" stroke-width="1" fill-rule="evenodd" />`);
    version(unittest) writeln("Test Success.");
}