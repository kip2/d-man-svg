module svg.svg;

import std.stdio;
import std.string;
import svg.svgElement;

struct SVG {
    uint width, height;
}

string createSvg (SVG data, SvgElement[] elements) {
    string svgContent =  format(`<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" width="%d" height="%d">`
, data.width, data.height);

    foreach(s; elements) {
        svgContent ~= s.toSvg();
    }

    svgContent ~= "\n</svg>";
    return svgContent;
}
