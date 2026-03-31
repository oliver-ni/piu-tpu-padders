// PIU LX Pad — Corner Bracket Topper (TPU Tape Mod Replacement)
// Sits on top of the L-shaped plastic corner bracket, held in place
// by the screw. A raised lip on the outer edges prevents the
// acrylic panel from sliding around.
//
// Print with TPU filament for foam-like compressibility.
// Print right-side up (lip grows upward from flat base).
// You need one per corner bracket (typically 4 per panel, 20 per pad).
//
// Based on 4199's PIU Pad Setup and Maintenance Guide.

// ============================================================
// PARAMETERS — Measure your corner brackets and adjust!
// ============================================================

// The corner bracket is L-shaped:
//
//       arm_width
//      |<----->|
//      +-------+
//      |       |  ^  arm_length_y
//      |       |  v
//      |   +---+------+
//      |   | O        |  <- screw hole near the corner
//      +---+----------+
//          |<-------->|
//           arm_length_x
//
// Cross-section (viewing from arm end):
//
//    +-+                      lip
//    | |  lip_height           |
//    | +----------------------+
//    |    thickness            |
//    +------------------------+
//    |gap|    arm_width        |

// Length of each arm of the L (measured from the outer corner)
arm_length_x = 56.2; // mm — MEASURE THIS
arm_length_y = 56.2; // mm — MEASURE THIS

// Width of each arm
arm_width = 25.4; // mm — MEASURE THIS

// Thickness of the spacer (sits between bracket and panel)
thickness = 3; // mm

// Corner rounding radius
corner_radius = 2; // mm

// --- Panel Lip ---
// Raised edge along the outer side of both arms to prevent
// the acrylic panel from sliding around.
lip_height = 8; // mm (panel is 10.2mm tall)
lip_thickness = 1.5; // mm
panel_gap = 3; // mm — gap between bracket outer edge and panel edge

// --- Screw Hole ---
// Diameter of the screw clearance hole (measure your screw)
screw_hole_diameter = 8.5; // mm — should be slightly larger than screw shaft

// Position of screw hole, measured from the inner corner of the L
screw_hole_x = 5; // mm — MEASURE THIS
screw_hole_y = 5; // mm — MEASURE THIS

// ============================================================
// DERIVED
// ============================================================

total_height = thickness + lip_height;

// ============================================================
// MODEL
// ============================================================

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

// Outer dimensions including the panel gap extension
outer_arm_length_x = arm_length_x + panel_gap;
outer_arm_length_y = arm_length_y + panel_gap;
outer_arm_width = arm_width + panel_gap;

module corner_bracket_topper() {
    // The base and lip are shifted by panel_gap so the outer edge
    // (where the lip is) extends to meet the panel edge.
    difference() {
        union() {
            // Base: flat L-shaped spacer (extended to panel edge)
            linear_extrude(height = thickness)
                l_shape_rounded(outer_arm_length_x, outer_arm_length_y,
                                outer_arm_width, corner_radius);

            // Lip: full height along outer edges only
            linear_extrude(height = total_height)
                l_shape_rounded(outer_arm_length_x, outer_arm_length_y,
                                outer_arm_width, corner_radius);
        }

        // Carve away inner area above thickness, leaving outer lip
        translate([lip_thickness, lip_thickness, thickness])
            linear_extrude(height = lip_height + 0.01)
                l_shape(outer_arm_length_x, outer_arm_length_y,
                        outer_arm_width);

        // Screw hole (all the way through)
        // screw_hole_x/y measured from the inner (concave) corner of the L
        translate([panel_gap + arm_width - screw_hole_x,
                   panel_gap + arm_width - screw_hole_y, -0.5])
            cylinder(h = total_height + 1, d = screw_hole_diameter, $fn = 32);
    }
}

corner_bracket_topper();
