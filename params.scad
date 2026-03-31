// Shared parameters for PIU LX Pad TPU spacers
// Include this file in other .scad files with:
//   include <params.scad>

// ============================================================
// L-BRACKET DIMENSIONS
// ============================================================

bracket_length = 69.7; // mm
bracket_width = 26.5; // mm
bracket_thickness = 3.6; // mm (metal + foam)

// ============================================================
// CORNER BRACKET DIMENSIONS
// ============================================================

arm_length_x = 56.2; // mm
arm_length_y = 56.2; // mm
arm_width = 25.4; // mm

// ============================================================
// SCREW HOLE
// ============================================================

screw_hole_diameter = 8.5; // mm
screw_hole_x = 5; // mm — from inner corner of L
screw_hole_y = 5; // mm — from inner corner of L

// ============================================================
// SHARED
// ============================================================

corner_radius = 2; // mm
spacer_thickness = 0.4; // mm — for test spacers

// ============================================================
// SHARED MODULES
// ============================================================

module rounded_rect(l, w, h, r) {
    linear_extrude(height = h)
        offset(r = r)
            square([l - 2*r, w - 2*r], center = true);
}

module l_shape(lx, ly, w) {
    union() {
        square([lx, w]);
        square([w, ly]);
    }
}

module l_shape_rounded(lx, ly, w, r) {
    offset(r = r)
    offset(delta = -r)
        l_shape(lx, ly, w);
}
