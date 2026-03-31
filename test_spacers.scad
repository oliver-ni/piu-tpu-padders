// Test spacer for L-bracket topper — 0.2mm shim
// Stack on top of the L-bracket topper to dial in thickness.

include <params.scad>

rounded_rect(bracket_length, bracket_width, spacer_thickness, corner_radius);
