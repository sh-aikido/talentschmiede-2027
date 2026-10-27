// ========================================================
// HORSCH BOARDING PASS — TALENTSCHMIEDE LAUF 2 (2026/2027)
// Parametric CAD Model for 3D Printing (Dual-Color / FDM / SLA)
// Passenger: Samuel Haas | Flight: TS-2027 | Route: USA -> SAD
// ========================================================

$fn = 64; // High resolution curves

// Dimensions (mm)
card_length = 110.0;
card_width  = 54.0;
card_thick  = 3.0;
corner_r    = 3.0;

// Perforation / Abrisskante
tear_x      = 78.0;
groove_w    = 1.0;
groove_d    = 1.2;
notch_r     = 2.5;

// QR-Code Pocket (25x25mm, 0.6mm deep)
qr_size     = 25.0;
qr_depth    = 0.6;
qr_center_x = 94.0;
qr_center_y = 27.0;

// Lanyard Hole
lanyard_x   = 6.0;
lanyard_y   = 48.0;
lanyard_d   = 3.5;

// Emboss height (for dual-color 3D printing)
emboss_h    = 0.4;

module rounded_card(l, w, h, r) {
    hull() {
        translate([r, r, 0]) cylinder(r=r, h=h);
        translate([l-r, r, 0]) cylinder(r=r, h=h);
        translate([r, w-r, 0]) cylinder(r=r, h=h);
        translate([l-r, w-r, 0]) cylinder(r=r, h=h);
    }
}

// --- BASE BOARDING PASS BODY ---
module base_boarding_pass() {
    difference() {
        // Main rounded card
        rounded_card(card_length, card_width, card_thick, corner_r);

        // Lanyard hole (through)
        translate([lanyard_x, lanyard_y, -0.5])
            cylinder(d=lanyard_d, h=card_thick + 1);

        // Tear-off groove (Sollbruchstelle)
        translate([tear_x - groove_w/2, -0.5, card_thick - groove_d])
            cube([groove_w, card_width + 1, groove_d + 1]);

        // Bottom tear notch
        translate([tear_x, 0, -0.5])
            cylinder(r=notch_r, h=card_thick + 1);

        // Top tear notch
        translate([tear_x, card_width, -0.5])
            cylinder(r=notch_r, h=card_thick + 1);

        // QR Code Pocket on Stub
        translate([qr_center_x - qr_size/2, qr_center_y - qr_size/2, card_thick - qr_depth])
            cube([qr_size, qr_size, qr_depth + 0.1]);
    }
}

// --- EMBOSSED SURFACE DETAILS (+0.4mm for dual-color print) ---
module embossed_graphics() {
    color([0.85, 0.15, 0.1]) // HORSCH Red
    translate([0, 0, card_thick]) {
        // HORSCH Logo
        translate([11, 43.5, 0])
            linear_extrude(emboss_h)
                text("HORSCH", size=4.8, font="Arial:style=Bold");

        // Talent Class Pill
        translate([37, 44, 0])
            linear_extrude(emboss_h)
                text("TALENT CLASS", size=2.8, font="Arial:style=Bold");

        // Route Hero: USA -> SAD
        translate([11, 27, 0])
            linear_extrude(emboss_h)
                text("USA", size=8.0, font="Arial:style=Bold");

        translate([52, 27, 0])
            linear_extrude(emboss_h)
                text("SAD", size=8.0, font="Arial:style=Bold");

        // Flight Center Label
        translate([34.5, 30, 0])
            linear_extrude(emboss_h)
                text("FLIGHT TS-2027", size=2.4, font="Arial:style=Bold", halign="center");

        // Airplane icon
        translate([34.5, 27, 0])
            linear_extrude(emboss_h)
                text(">", size=3.2, font="Arial:style=Bold", halign="center");

        // Passenger info
        translate([11, 16, 0])
            linear_extrude(emboss_h)
                text("PASSENGER: SAMUEL HAAS", size=2.6, font="Arial:style=Bold");

        translate([11, 10.5, 0])
            linear_extrude(emboss_h)
                text("INDUSTRIEKAUFMANN (2. LJ)", size=2.2, font="Arial");

        translate([11, 5.5, 0])
            linear_extrude(emboss_h)
                text("GATE: TS-02   SEAT: 01A", size=2.3, font="Arial:style=Bold");

        // Stub Label
        translate([qr_center_x, 44, 0])
            linear_extrude(emboss_h)
                text("COUPON", size=2.8, font="Arial:style=Bold", halign="center");

        translate([qr_center_x, 6.5, 0])
            linear_extrude(emboss_h)
                text("SCAN FOR AUDIO", size=2.2, font="Arial:style=Bold", halign="center");
    }
}

// --- SEPARATE QR INLAY TILE (24.8 x 24.8 x 0.6 mm) ---
module qr_inlay_plate() {
    inlay_size = 24.8;
    inlay_thick = 0.6;
    inlay_r = 0.6;
    translate([0, -35, 0]) {
        hull() {
            translate([inlay_r, inlay_r, 0]) cylinder(r=inlay_r, h=inlay_thick);
            translate([inlay_size-inlay_r, inlay_r, 0]) cylinder(r=inlay_r, h=inlay_thick);
            translate([inlay_r, inlay_size-inlay_r, 0]) cylinder(r=inlay_r, h=inlay_thick);
            translate([inlay_size-inlay_r, inlay_size-inlay_r, 0]) cylinder(r=inlay_r, h=inlay_thick);
        }
    }
}

// Assemble full model
base_boarding_pass();
embossed_graphics();
// qr_inlay_plate(); // Uncomment to render separate inlay
