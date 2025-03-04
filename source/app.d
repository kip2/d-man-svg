module app;

import std.stdio;
import std.file;
import svg;

void createDMan() {
    SVG fileSize = {400, 600};

    SvgElement[] elements = cast(SvgElement[]) [
        // left arm
        new Path("M250 200 l60 -60 l-120 -120 ", "none", "black", 7, "none"),
        // left hand
        new Ellipse(190, 30, 20, 30,"white", "black", 3),

        // inner right side
        new Path("
        M 190 160
        C 190 160, 270 210 , 170, 370
        C 180, 370, 350 210 , 190 160
        ",
        "red", "black", 5, "nonzero"),

        // bottom side
        new Path("
        M 40 390
        L 190 390
        C 170 390, 220 390, 250 330
        Z
        ", "red", "black", 5, "nonzero"),


        // D-man body
        new Path("
        M 100 100 
        C 100 100, 170 170, 70 380
        L 180 380
        C 310 380, 350 100, 140 100
        Z

        M 170 170
        C 170 170, 200 230, 140 350
        L 160 350
        C 260 350, 280 170, 190 170
        Z
        ", "red", "black", 5, "evenodd"),

        // left side
        new Path("
        M 100 100 
        L 80 110
        C 90 110, 150 180, 40 390
        L 70 380
        C 70 380, 170 170, 100 100
        ", "red", "black", 5, "nonzero"),


        // right arm
        new Path("M110 210 l-70 -70 l120 -120 ", "none", "black", 7, "none"),
        // right hand
        new Ellipse(160, 30, 20, 30,"white", "black", 3),

        // right eye
        new Ellipse(160, 160, 23, 30,"white", "black", 3),
        // right eye bole
        new Ellipse(170, 170, 10, 12,"black", "black", 3),
        // left eye
        new Ellipse(210, 170, 23, 30,"white", "black", 3),
        // left eye bole
        new Ellipse(220, 180, 10, 12,"black", "black", 3),

        // left leg
        new Path("M230 365 l60 60 l-60 60", "none", "black", 7, "none"),
        // right leg
        new Path("M130 380 l-60 60 l60 60", "none", "black", 7, "none"),
        // left foot
        new Ellipse(250, 495, 30, 15,"white", "black", 3),
        // right foot
        new Ellipse(110, 510, 30, 15,"white", "black", 3),

    ];

    string svg = createSvg(fileSize, elements);
    svg.toFile("d-man.svg");
}

void main() {
    createDMan();
}
