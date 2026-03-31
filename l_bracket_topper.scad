// PIU LX Pad — L-Bracket Topper (TPU Tape Mod Replacement)
// Caps onto the L bracket with a pocket that grips the metal.
// The top surface sits between the bracket and the acrylic panel.
//
// Print with TPU filament for foam-like compressibility.
// Print UPSIDE DOWN (top/flat face on the bed) for best surface.
// You need one of these per L bracket (4 per panel, 20 per pad).
//
// Based on 4199's PIU Pad Setup and Maintenance Guide.

// ============================================================
// PARAMETERS — Measure your L brackets and adjust as needed!
// ============================================================

// Cross-section of the cap on the bracket:
//
//    +--+--------------+--+
//    |  | top_thickness |  |  ← top (contacts acrylic panel)
//    +--+--------------+--+
//    |  |bracket pocket|  |
//    |  |(brkt_thick)  |  |
//    |  +--------------+  |
//    +--+              +--+
//    wall              wall

// Length of the L bracket (long dimension)
bracket_length = 69.7; // mm

// Width of the flat top of the L bracket (short dimension)
bracket_width = 26.5; // mm

// Depth of the pocket — measure the metal bracket + stock foam
// together (the cap fits over both). Measure from the base of
// the metal to the top of the foam.
bracket_thickness = 3.6; // mm (metal + foam)

// Top thickness (above the bracket, contacts the acrylic panel)
// This is what raises the panel. Equivalent to the tape stack.
top_thickness = 3; // mm

// Wall thickness on each side of the pocket
wall_thickness = 1.5; // mm

// Clearance added to the pocket so it slides on.
// TPU is flexible so this can be small.
pocket_clearance = 0; // mm per side

// Corner rounding radius
corner_radius = 2; // mm


// ============================================================
// DERIVED
// ============================================================

total_height = top_thickness + bracket_thickness;
wall_and_clearance = wall_thickness + pocket_clearance;
outer_length = bracket_length + 2 * wall_and_clearance;
outer_width = bracket_width + 2 * wall_and_clearance;
pocket_length = bracket_length + 2 * pocket_clearance;
pocket_width = bracket_width + 2 * pocket_clearance;

// ============================================================
// MODEL
// ============================================================

module rounded_rect(l, w, h, r) {
    // 2D rounded rectangle extruded to height h, centered on XY
    linear_extrude(height = h)
        offset(r = r)
            square([l - 2*r, w - 2*r], center = true);
}

module l_bracket_topper() {
    difference() {
        // Outer shell
        rounded_rect(outer_length, outer_width, total_height, corner_radius);

        // Pocket: carved from the bottom for the metal bracket + foam
        translate([-pocket_length/2, -pocket_width/2, -0.01])
            cube([pocket_length, pocket_width, bracket_thickness + 0.01]);
    }
}

l_bracket_topper();
