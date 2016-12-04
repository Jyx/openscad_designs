sander_w = 58;
sander_h = 24;

vacuum_w = 34;

fine = 300;

difference() {
    cylinder(h=sander_h, r=sander_w/2, center=false, $fn=fine);
    cylinder(h=sander_h, r=((sander_w/2) - 8), center=false, $fn=fine);
}


translate([0, 0, sander_h]) {
    difference() {
        cylinder(15, d1=sander_w,  d2=vacuum_w+20, center=false, $fn=fine);
        cylinder(15, d1=sander_w-16,  d2=vacuum_w, center=false, $fn=fine);
    }
}

translate([0, 0, sander_h + 15]) {
    difference() {
        cylinder(h=sander_h, r=((sander_w/2) - 2), center=false, $fn=fine);
        cylinder(h=sander_h, r=(vacuum_w/2)+0.2, center=false, $fn=fine);
}
}

//cylinder(h=15, r1=9.5, r2=19.5, center=false);
//cylinder(  15,    9.5,    19.5, false);
//cylinder(  15,    9.5,    19.5);
//cylinder(  15,    9.5, d2=39  );
//cylinder(  15, d1=19,  d2=39  );
//cylinder(  15, d1=19,  r2=19.5);