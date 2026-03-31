// Test spacer for corner bracket topper — 0.2mm shim
// Stack on top of the corner bracket topper to dial in thickness.

include <params.scad>

difference() {
    linear_extrude(height = spacer_thickness)
        l_shape_rounded(arm_length_x, arm_length_y, arm_width, corner_radius);

    translate([arm_width - screw_hole_x,
               arm_width - screw_hole_y, -0.5])
        cylinder(h = spacer_thickness + 1, d = screw_hole_diameter, $fn = 32);
}
