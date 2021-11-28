use <threads-library-by-cuiso-v1.scad>

$fn = 50;

/*
translate([0, 20, 0]) {
	thread_for_screw(diameter=6, length=13);
	cylinder(d=12, h=1, $fn=6);
}

difference() {
	cylinder(d=12, h=2, $fn=6);
	thread_for_nut(diameter=6, length=4);
}
*/

module servoHubAdapter25T() {
	HEIGHT = 4.50;
	GEAR_HEIGHT = 2.50;
	
	difference() {
		cylinder(h=HEGHT-GEAR_HEIGHT, d=20);
		cylinder(h=HEGHT-GEAR_HEIGHT, d=3);
		#translate([14/2, 0, 0]) cylinder(h=HEGHT-GEAR_HEIGHT, d=3);
		#translate([-14/2, 0, 0]) cylinder(h=HEGHT-GEAR_HEIGHT, d=3);
		#translate([0, 14/2, 0]) cylinder(h=HEGHT-GEAR_HEIGHT, d=3);
		#translate([0, -14/2, 0]) cylinder(h=HEGHT-GEAR_HEIGHT, d=3);
	}
	
	difference() {
		translate([0, 0, GEAR_HEGHT]) cylinder(h=GEAR_HEIGHT, d=9);
		translate([0, 0, GEAR_HEGHT]) cylinder(h=GEAR_HEIGHT, d=6.05);
	}
}

module sg90() {
	
	FULL_WIDTH = 31.90;
	BODY_WIDTH = 22.50;
	BODY_DEPTH = 11.80;
	BODY_HEIGHT = 22.70;
	EAR_WIDTH = (FULL_WIDTH-BODY_WIDTH)/2;
	EAR_HEIGTH = 15.9078;
	
	// body
	cube([BODY_WIDTH, BODY_DEPTH, BODY_HEIGHT]);
	
	// left ear
	difference() {
		translate([-EAR_WIDTH, 0, EAR_HEIGTH]) cube([EAR_WIDTH, BODY_DEPTH, 2.50]);
		translate([-EAR_WIDTH/2, BODY_DEPTH/2, EAR_HEIGTH]) cylinder(h=2.50, d=2);
		translate([-EAR_WIDTH, BODY_DEPTH/2-1.30/2, EAR_HEIGTH]) cube([EAR_WIDTH/2, 1.30, 2.5]);
	}
	
	// right ear
	difference() {
		translate([BODY_WIDTH, 0, EAR_HEIGTH]) cube([EAR_WIDTH, BODY_DEPTH, 2.50]);
		translate([BODY_WIDTH+EAR_WIDTH/2, BODY_DEPTH/2, EAR_HEIGTH]) cylinder(h=2.50, d=2);
		translate([BODY_WIDTH+EAR_WIDTH/2, BODY_DEPTH/2-1.30/2, EAR_HEIGTH]) cube([EAR_WIDTH/2, 1.30, 2.5]);
	}
	
	// big gear
	translate([5.90, BODY_DEPTH/2, BODY_HEIGHT]) cylinder(h=4, r=5.90);
	translate([5.90+2.90+2.50, BODY_DEPTH/2, BODY_HEIGHT]) cylinder(h=4, r=2.50);
	
	// small gear
	difference() {
		translate([5.90, BODY_DEPTH/2, BODY_HEIGHT+4]) cylinder(h=7.20-4, d=4.60);
		translate([5.90, BODY_DEPTH/2, BODY_HEIGHT+4]) cylinder(h=7.20-4, d=1.70);
	}
	
	// cabels
	translate([BODY_WIDTH, BODY_DEPTH/2-3.6/2, 4.5]) cube([3, 3.6, 1.2]);
}