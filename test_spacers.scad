// Test spacers — stack on top of the L-bracket topper to find
// the right top_thickness. Each is 0.5mm thick.
// Print 3, then try 1, 2, or 3 stacked to see what feels best.

spacer_length = 69.7; // mm — match your bracket_length
spacer_width = 26.5;  // mm — match your bracket_width
spacer_thickness = 0.5; // mm
corner_radius = 2; // mm
spacing = 5; // mm gap between spacers on the plate

module rounded_rect(l, w, h, r) {
    linear_extrude(height = h)
        offset(r = r)
            square([l - 2*r, w - 2*r], center = true);
}

for (i = [0 : 2]) {
    translate([0, i * (spacer_width + spacing), 0])
        rounded_rect(spacer_length, spacer_width, spacer_thickness, corner_radius);
}
