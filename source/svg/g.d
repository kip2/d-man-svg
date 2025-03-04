module svg.g;

import std.stdio;
import std.string;
import svg.svgElement;
import svg.path;

class G : SvgElement {
    uint strokeWidth;
    string transform, fill, stroke;
    SvgElement svgElement;

    this(SvgElement svgElement, string fill, string stroke, uint strokeWidth, string transform) {
        this.svgElement = svgElement;
        this.fill = fill;
        this.stroke = stroke;
        this.strokeWidth = strokeWidth;
        this.transform = transform;
    }

    string toSvg() {
        return format(`<g fill="%s" stroke="%s" stroke-width="%s" transform="%s" > %s </g>`, fill, stroke, strokeWidth, transform, svgElement.toSvg());
    }
}

unittest {
    Path testPath = new Path("M110 100 A20 20", "black", "none", 1, "evenodd");
    G testG = new G(testPath, "none", "black", 2,  "rotate(20, 100, 100)");
    version(unittest) writeln(format("Running test: g(%s) should return g element.", testG));
    assert(testG.toSvg == `<g fill="none" stroke="black" stroke-width="2" transform="rotate(20, 100, 100)" > <path d="M110 100 A20 20" fill="black" stroke="none" stroke-width="1" fill-rule="evenodd" /> </g>`);
    version(unittest) writeln("Test Success.");
}