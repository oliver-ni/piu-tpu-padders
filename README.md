# PIU TPU Padders

3D printable TPU spacers for Pump It Up LX dance pad maintenance. Replaces the traditional tape mod (masking tape + foam tape + gorilla tape stack) with reusable TPU parts.

Based on [4199's PIU Pad Setup and Maintenance Guide](https://docs.google.com/document/d/1Vow5lJfTmMCMnUaxqSn4V8mDBpO4-corKxJbdxzJcOY).

## Parts

### L-Bracket Topper (`l_bracket_topper.scad`)

Caps onto the metal L bracket with a pocket that grips the bracket and foam. The top surface sits between the bracket and the acrylic panel, raising it to the correct height.

- **Quantity needed:** 4 per panel, 20 per pad
- **Print orientation:** Upside down (flat top on bed)

### Corner Bracket Topper (`corner_bracket_topper.scad`)

Sits on top of the plastic corner bracket, held in place by the screw. A raised lip on the outer edges prevents the acrylic panel from sliding around.

- **Quantity needed:** 4 per panel, 20 per pad
- **Print orientation:** Right-side up (lip grows upward)

### Test Spacers (`test_spacers.scad`)

Three 0.5mm shims to stack on top of the L-bracket topper for dialing in the ideal padding thickness.

## Printing

- **Material:** TPU 95A (HF recommended for easier printing)
- **Infill:** 100% Rectilinear
- **Layer height:** 0.2mm (0.25mm for test spacers)

## Customization

All models are parametric OpenSCAD files. Open in [OpenSCAD](https://openscad.org/) and adjust the parameters at the top of each file to match your pad's measurements.
