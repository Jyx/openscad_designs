include <nuts_and_bolts_v1.95.scad>

//SC8UU bearing block
quality=36; //set to 36 before editing, set 360 before compiling
W=80; // Height of main block
H=80; // Height of main block
D=6; // Depth of main block


shaft=8; //8mm rail
m3bolt=3; //m3
m4bolt=4; //m4

m3nut=5.5; //m3 nut size

nozzle=0.4; //hole exact fit
vint=3; //shaft lock m3

BW=30; // Bearing outer width
BH=34; // Bearing outer height
BD=22.3; // Bearing outer depth

//  hex_nut (height, thread_d, size, tolerance, quality, thread, pitch);

/*******************************************************************/
/**  Nut bolts                                                    **/
/*******************************************************************/
module m2_5_nut(x, y, z) {
    translate ([x, y, z]) hex_nut (2, 2.6, 5, 1/128, 32, 0, "metric", thread ? 0.45 : "");
}

module m3_nut(x, y, z, thread) {
    translate ([x, y, z]) hex_nut (2.6, 3.1, 5.5, 1/128, 32, 0, "metric", thread ? 0.5 : "");
}

module m4_nut(x, y, z, thread) {
    translate ([x, y, z]) hex_nut (3.44, 4.1, 7, 1/128, 32, 0, "metric", thread ? 0.7 : "");
}

module m5_nut(x, y, z, thread) {
    translate ([x, y, z]) hex_nut (4.24, 5.1, 8, 1/128, 32, 0, "metric", thread ? 0.8 : "");

}

module m6_nut(x, y, z, thread) {
    translate ([x, y, z]) hex_nut (5.24, 6.1, 10, 1/128, 32, 0, "metric", thread ? 1.0 : "");

}

module m8_nut(x, y, z, thread) {
    translate ([x, y, z]) hex_nut (6.24, 8.1, 14, 1/128, 32, 0, "metric" , thread ? 1.25 : "");
}

module m10_nut(x, y, z, thread) {
    translate ([x, y, z]) hex_nut (8.4, 10.1, 16, 1/128, 32, 0, "metric" , thread ? 1.5 : "");
}

/*******************************************************************/
/**  Hex bolts                                                    **/
/*******************************************************************/
//  hex_bolt (lenght, thread_d, head_h, head_d, tolerance, quality, thread, pitch);
module m2_5_hexbolt(x, y, z, length, as_insert, thread) {
    translate ([x, y, z + length + 1.9])
        rotate([0, 180, 0])
            hex_bolt (length, 2.98, 1.9, 5, 1/128, 32, 0, "metric", thread ? 1 : 0, 0.45);
}

module m3_hexbolt(x, y, z, length, as_insert, thread) {
    head_size = as_insert ? 5.5: 5.75;
    head_thickness = 2.2;    
    translate ([x, y, z + length + head_thickness])
        rotate([0, 180, 0])
            hex_bolt (length, 3.48, head_thickness, head_size, 1/128, 32, 0, "metric", thread ? 1 : 0, 0.5);
}

module m4_hexbolt(x, y, z, length, as_insert, thread) {
    head_size = as_insert ? 7.25 : 7;
    head_thickness = 3.1;
    translate ([x, y, z + length + head_thickness])
        rotate([0, 180, 0])
            hex_bolt (length, 4.48, head_thickness, head_size, 1/128, 32, 0, "metric", thread ? 1 : 0, 0.7);
}

module m5_hexbolt(x, y, z, length, as_insert, thread) {
    head_size = as_insert ? 8.28 : 8;
    head_thickness = 3.875;
    translate ([x, y, z + length + head_thickness])
        rotate([0, 180, 0])
            hex_bolt (length, 5.48, head_thickness, head_size, 1/128, 64, 0, "metric", thread ? 1 : 0, 0.8);
}

module m6_hexbolt(x, y, z, length, as_insert, thread) {
    head_size = as_insert ? 10.3 : 10;
    head_thickness = 4.375;
    translate ([x, y, z + length + head_thickness])
        rotate([0, 180, 0])
            hex_bolt (length, 6.48, head_thickness, head_size, 1/128, 64, 0, "metric", thread ? 1 : 0, 1);
}

module m8_hexbolt(x, y, z, length, as_insert, thread) {
    head_size = as_insert ? 13.3 : 13;
    head_thickness = 5.675;
    translate ([x, y, z + length + head_thickness])
        rotate([0, 180, 0])
            hex_bolt (length, 8.58, head_thickness, head_size, 1/128, 64, 0, "metric", thread ? 1 : 0, 1.25);
}

module m10_hexbolt(x, y, z, length, as_insert, thread) {
    head_size = as_insert ? 16.3 : 16;
    head_thickness = 6.85;
    translate ([x, y, z + length + head_thickness])
        rotate([0, 180, 0])
            hex_bolt (length, 10.58, head_thickness, head_size, 1/128, 128, 0, "metric", thread ? 1 : 0, 1.5);
}


/*******************************************************************/
/**  Test prints for hex nut inserts                              **/
/*******************************************************************/
module m4_test(x, y, z) {
    difference() {
        translate ([x, y, z]) cube([12, 12, 6]);
        rotate([0, 180, 0]) m4_hexbolt(-x - 6, y + 6, -z - 6.1, 2.5 + 3.7, "ins");
    }
}

module m5_test(x, y, z) {
    difference() {
        translate ([x, y, z]) cube([12, 12, 6]);
        rotate([0, 180, 0]) m5_hexbolt(-x - 6, y + 6, -z - 6.1, 2.5 + 3.7, "ins");
    }
}

module m6_test(x, y, z) {
    difference() {
        translate ([x, y, z]) cylinder(r=8, h=10, $fn=64);
        rotate([0, 180, 0]) m6_hexbolt(x, y , z - 10.1, 2.5 + 3.7, "ins");
    }
}

module m8_test(x, y, z) {
    difference() {
        translate ([x, y, z]) cylinder(r=10, h=10, $fn=64);
        rotate([0, 180, 0]) m8_hexbolt(-x, y , z - 10.1, 2.5 + 3.7, "ins");
    }
}


module bearing_holes(x, y, z) {
        // Lower left
        translate ([x + 6,      y + 5,      z - 0.5]) cylinder(d=4, h=BD + 1, $fn=quality);
        // Lower right
        translate ([x + BW - 6, y + 5,      z - 0.5]) cylinder(d=4, h=BD + 1, $fn=quality);
        // Upper left
        translate ([x + 6,      y + BH - 5, z - 0.5]) cylinder(d=4, h=BD + 1, $fn=quality);
        // Upper right
        translate ([x + BW - 6, y + BH - 5, z - 0.5]) cylinder(d=4, h=BD + 1, $fn=quality);
}

module bearing(x, y, z) {
    difference() {
        difference() {
            // Main cube
            translate ([x, y, z]) cube([BW, BH, BD]);
            // And the four holes
            bearing_holes(x, y, z);
        }
    
        // The hole for the shaft
        translate ([x - 0.5, y + (BH/2), z + 11]) rotate([0, 90, 0]) cylinder(d=shaft, h=BW + 1, $fn=quality);
    }
}

module inv_bearing(x, y, z) {
    color("Green");
    intersection() {
        bearing_holes(x, y, z);
        translate ([x, y, z]) cube([BW, BH, BD]);
    }
}

XC_W = 20;
XC_H = H;
XC_D = 25;
module x_carriage_mount(x, y, z) {
    translate ([x, y, z]) cube ([XC_W, XC_H, XC_D]);
}

module main_block(x, y, z) {
    color("Blue");
    difference () {
        translate ([x, y, z]) cube ([W, H, D]);
    
        // Start carveout
        translate ([x, y, z - 0.5]) cube(r=30, h=D + 1);
        translate ([x + W, y, z - 0.5]) cube(r=30, h=D + 1);
        
//        translate ([x, y, z - 0.5]) cylinder(r=30, h=D+1, $fn=quality);
//        translate ([x + W, y, z - 0.5]) cylinder(r=30, h=D+1, $fn=quality);
    }
}



//main_block(0, 0, 0);
//bearing(0, H/2 - 2, 0);
//bearing(W - BW, H/2 - 2, 0);
//x_carriage_mount(W/2 - XC_W/2, 0, 0);
//inv_bearing(0, 0, 0);

m6_test(0, 0, 0);
m8_test(20, 0, 0);


//m3_hexbolt(0, 20, 0, 2.5);
//m3_nut(10, 20, 0);
//
//m4_hexbolt(0, 10, 0, 2.5);
//m4_nut(10, 10, 0);
//
//m5_hexbolt(0, 0, 0, 2.5);
//m5_nut(11, 0, 0);
//
//m6_hexbolt(0, -11, 0, 2.5);
//m6_nut(14, -11, 0);
//
//m8_hexbolt(0, -25, 0, 2.5);
//m8_nut(18, -25, 0);
//
//m10_hexbolt(0, -43, 0, 2.5 );
//m10_nut(23, -43, 0);



//m3_nut(0, -10, 0);
//
//m4_nut(10, -10, 0);
//
//m5_nut(20, -10, 0);
//m5_nut(20, -30, 0, "with_thread");
//
//m6_nut(33, -10, 0);
//m6_nut(33, -30, 0, "with_thread");
//
//m8_nut(50, -10, 0);
//m8_nut(50, -30, 0, "with_thread");


