// wall thickness
th = 2;

// board size
bx = 85.5;
by = 54.2;

// gap around board 
g = 0.4;
thg = th + g;

// outter dimensions
ox = bx + (thg * 2);
oy = by + (thg * 2);

// board z offset
bzo = 4 + th;

module basicBox()
{
    difference()
    {
        cube([ox, oy, 17]);
        translate([th, th, th])
            cube([bx + g * 2, by + g * 2, 17]);
    }
}

module stand( x, y )
{
    translate([x, y, 0])
    {
        difference() {
        cylinder( bzo, d = 6, $fn = 30 );
        cylinder( bzo, d = 2.5, $fn = 30 );
        }
    }
}

module BottomScrewHole( x, y )
{
    translate([x, y, -1])
    {
        cylinder( bzo + 2, d = 3.2, $fn = 30 );
        cylinder( 6 - th, d = 7.1, $fn = 6 );
    }
}

module TopScrewHole( x, y )
{
    translate([x, y, -1])
    {
        cylinder( 9.6 + 2 + th, d = 3.1, $fn = 30 );
        cylinder( th + 1, d = 6.2, $fn = 30 );
    }
}
module TopScrewMount( x, y )
{
    translate([x, y, 0])
    {
        cylinder( th + 9.6, d = 6.2, $fn = 60 );
    }
}

module frontHole(x, z, w, h)
{
    translate([x, -10, z + 1.25])
        cube([w, 13, h + (g * 2)]);
}

module bottom() 
{
    difference()
    {
        union()
        {
            basicBox();
            translate([thg, thg, 0])
            {
                stand( 4, 18.7 );
                stand( bx - 4, 18.7 );
                stand( 4, 50.2 );
                stand( bx - 4, 50.2 );
            }
            // more supports
            translate([44, th + 5, 0])
            {
                cylinder( bzo-1, d = 5, $fn = 30 );
            }
            translate([44, 53.5, 0])
            {
                cylinder( bzo-1, d = 5, $fn = 30 );
            }
            
            translate([6.5 - thg, 7.5 - thg, 0])
            {
                cube([6.66 + (2 * thg), 7.25 + (2 * thg), th +1]);
            }
        }
        union()
        {
            // SD card
            frontHole( 2.63, bzo - g, 13.45, 2.00 );
            
            // HDMI
            frontHole( 18.71, bzo - g, 16.45, 7.27 );
            
            // otg
            frontHole( 39.24, (bzo - 0.5) - g, 9.1, 4 );
            
            // USB1
            frontHole( 50.2, bzo - g, 16.7, 8.4 );
            
            // USB2
            frontHole( 70.5, bzo - g, 15.9, 8.4 );
            
            // power 
            translate([68.5, oy - 10, bzo + 1.25])
                cube([11.8, 20, 7]);
            
            // switches
            translate([6.5 - g, 7.5 - g, -1])
                cube([6.66 + (2 * g), 7.25 + (2 * g), bzo + 2]);
                
            // JTAG
            jtag_width = 7.32;
            jtag_length = 3.52;
            jtag_offset = 2.4;
            jtag_x = jtag_width + (2 * jtag_offset);
            jtag_y = jtag_length + (2 * jtag_offset);
            
            translate([27.8 + g, 45.5 + g, -1])
                cube([jtag_x, jtag_y, 17], center=true);
                
            // UART
            uart_width = 42.0;
            uart_length = 15.4;
            uart_thickness = 10.0;
            uart_offset = 2.0;
            uart_x = uart_width + (2 * uart_offset);
            uart_y = uart_length + (2 * uart_offset);
            
            //translate([8, by,  9])
                //cube([42 + 4, th + 4, 25]);
            
                // GPIO access
            //translate([9, thg - 3, -1])
              //  cube([42 + 4, 9.75, th + 2]);
              
            // screw holes with captured nuts
            translate([thg, thg, 0])
            {
                //BottomScrewHole( 4, 18.7 );
                //BottomScrewHole( bx - 4, 18.7 );
                //BottomScrewHole( 4, 50.2 );
                //BottomScrewHole( bx - 4, 50.2 );
            }
        }
    }
}

module topSupport(x, y, type)
{
    translate([x, y, th])
    {
        if( type == "a" )
            cube([th, 6, 5]);
        if( type == "b" )
            cube([6, th, 5]);
    }
}

module top()
{
    difference()
    {
        union()
        {
            cube([ox, oy, th]);
            //topSupport( thg, thg, "a" );
            //topSupport( thg, 34, "a" );
            topSupport( ox - (thg + th), thg, "a" );
            topSupport( ox - (thg + th), oy - (thg + 6 + 17), "a" );
            topSupport( thg, oy - (thg + 6), "a" );
            
            topSupport( 60, thg, "b");
            topSupport( 40, oy - (thg + th), "b");
            
            
            TopScrewMount( thg + 4, oy - (18.7 + thg) );
            TopScrewMount( thg + (bx - 4), oy - (18.7 + thg) );
            TopScrewMount( thg + 4, oy - (50.2 + thg) );
            TopScrewMount( thg + (bx - 4), oy - (50.2 + thg) );
            
        }
        union()
        {
            // GPIO access
            //translate([9.0, thg - 3, -1.99])
                //cube([42 + 4, 18, th + 2]);
            
            // recovery
            translate([15, 24, -1])
                cube([7.5, 4.5, th + 2]);
            
            TopScrewHole( thg + 4, oy - (18.7 + thg) );
            TopScrewHole( thg + (bx - 4), oy - (18.7 + thg) );
            TopScrewHole( thg + 4, oy - (50.2 + thg) );
            TopScrewHole( thg + (bx - 4), oy - (50.2 + thg) );
        }
    }
}

union()
{
    bottom();
    //translate([0, oy + 5, 0])top();
    //top();
}