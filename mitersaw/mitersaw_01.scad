module main () {
    difference() {
        difference (){
            cube([66,56,4],center=false);
            translate([8, 10, -0.5]) {
                cylinder(h=5, r=2, $fn=60, center=false);
                translate([40, 0, 0]) {
                    cylinder(h=5, r=2, $fn=60, center=false);
                }
            }
        }
        
        union() {
            translate([56/2, 30, -0.5]) {
                cylinder(h=10, r=18, $fn=120, center=true);
            }
            translate([56/2 - 8, -6, -0.5]) {
                cube([16,20,5],center=false);
            }
        }
    }
}

module back () {
    translate([0, 52, 0]) {
    cube([66,4,30],center=false);
    }    
}

module back_holes () {
    rotate([90, 0, 0]) {
        translate([8, 15+2, -57]) {
            cylinder(h=6, r=2, $fn=60, center=false);
            translate([50, 0, 0]) {
                cylinder(h=6, r=2, $fn=60, center=false);
            }
        }
    }
}

module mount_one() {
    difference() {
        union () {
            main();
            back();
        }

        back_holes();
    }
}

module mount_two_back() {
    translate([-4, 56, -30]) {
        cube([74,4,60],center=false);
    }
}

module hole_bars() {    
    translate([6, 60.5, -22]) {
        rotate([90, 0, 0]) {
            cube([4, 45, 5], center=false);
        }
    }
    translate([56, 60.5, -22]) {
        rotate([90, 0, 0]) {
            cube([4, 45, 5], center=false);
        }
    }
}

module mount_two() {
    difference () {
        mount_two_back();
        hole_bars();
    }

    translate([-4, 11, -30]) {
        cube([3, 45, 35], center=false);
    }
    
    translate([67, 11, -30]) {
        cube([3, 45, 35], center=false);
    }
}

mount_one();
mount_two();
