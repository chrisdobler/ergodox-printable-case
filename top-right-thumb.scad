
outsideCircle = 72;
platformWidth = 16;
platformDepth = 4.5;
supportBeamWidth = 9;
supportCenterCircleRadius = 12;
centerHoleRadius = 3.5;


drawObject();

module drawObject()
{
    keyboard();
	//linear_extrude(height = platformDepth) supportPlatform();
}

module puzzlePiece()
{
    translate([-.5,-.5,0]) cube([10,3.5,20]);
    translate([2.5,0,0]) {
        cube([4.5,9,20]);
    }
}


module keyboard()
{

    $fn=500;

    hpos= [[31.365,65.345],[32.000,168.266],[94.103,113.809],[114.931,168.266],[165.731,168.266],[127.707,47.642],[179.244,39.564+.6],[173.478,83.735]];

    //left hand vs. right? idk
    mirror([1,0,0])

    difference() {

        union() {
            color("green")
                linear_extrude(height = 4.01 + 0.8)
                    import (file = "ErgoDOX Case Layer 3 Plate - Left.dxf");


            translate([0,0,4])
                color("yellow")
                    linear_extrude(height = 6.2+0.8)
                        import (file = "ErgoDOX Case Layer 1 Top - Left.dxf");

            // cover holes
            for (pos=hpos) {
                color("red")
                    translate([pos[0]+1,pos[1]+1,0])
                        cylinder(r=2.5,h=4.01+0.8);  
            }

            // cover end
            color("red")
                translate([130,183.557-20,0])
                    cube([40,20,4.01]);
            // cover chip

            color("red")
                translate([38,158,0])
                    cube([40,20,4.01]);

            // fins
            for (a=[0,4,8,12])  {
                color("red")
                    translate([22,158+a,7+2+2])
                        cube([66+92,2,1]);
            }
            color("red")
                translate([22+10,158+16,7+2+2])
                    cube([66+20,2,1]);

        }
// take away

        // place inside for ic
        translate([32,156,-0.01])
            cube([138,20,7.2]);



        //cut off everything except the thumb section //////////////////
        translate([0,0,-1]) {

            difference() {
                cube([230,164,40],center=false);
                translate([125,0,-1]) {
                    cube([240,104,100],center=false);
                }
                translate([145,75,-1]) {
                    cube([240,104,100],center=false);
                }
                translate([119,53.5,-1]) {
                    rotate([0,0,270]) puzzlePiece();
                }
            }
        }


        //cut off top area ////////////////////
        difference() {
            translate([0,157,-1]) {
                cube([200,100,100],center=false);
            }
            translate([130,163,-1]) {
                rotate([0,0,180]) puzzlePiece();
            }
        }

        translate([30,152,-1]) {
            puzzlePiece();
        }
        translate([60,152,-1]) {
            puzzlePiece();
        }
        ///////////////////////////////



        color("purple")
            translate([32+10,156+4,-0.01])
                cube([66,12,9.2]);

        color("purple")
            translate([138+1,156+2,-0.01])
                cube([20,20,6.2]);

        color("purple")
            translate([138+1-51,156+2,-0.01])
                cube([20,20,6.2]);

        // end part for cable
        translate([138+10+1,181+40-2,-1])
            cylinder(r=40,h=20);
        // speaker hole 3mm sunken ??
        color("purple")
            translate([138+10+1,181,2.5])
                rotate([90,0,0])
                    cylinder(r=3.5,h=10);
        // right side, also usb mini connector
        translate([138+10+1-51,181+40-2,-1])
            cylinder(r=40,h=20);

        // teensy reset hole !!!
        translate([(32+10+5),(160+6),-10])
            cylinder(r=1,h=100);

        translate([138+10+1-51-4.1+.5-1.5,181-6,0])
            cube([8.2,10,4.2]);

        translate([138+10+1-51-4.1-1.5,181-6,2])
            cube([9.2,10,4.2-2]);

        hpos2= [[24.623,51.478],[105.029,48.071],[188.331,11.241],[214.917,68.257],[173.175,175.792],[119.692,177.611],[24.623,175.793]];
        for (pos=hpos2) {
            color("black")
                translate([pos[0]+1.5,pos[1]+1.6,10.2-1.5+.8])
                    cylinder(r=3.2,h=3.01,center=true);  
        }


        // cut away for test print
        //translate([0,0,-1])
        //cube([250,150,15]);

    }


}