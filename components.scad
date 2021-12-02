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
MG995();
//servoHubAdapter25T();

module MG995() {
	BODY_WIDTH = 40 + 2.5;
	BODY_DEPTH = 20;
	BODY_HEIGHT = 38.6;
	
	EAR_WIDTH = (52.8 - BODY_WIDTH) / 2;
	EAR_DEPTH = (20 - 2) / 2;
	EAR_HEIGHT = 2.50;
	EAR_OFFSET = 27.25;
	EAR_HOLE_DIAMETER = 4;
	
	// body
	cube([BODY_WIDTH, BODY_DEPTH, BODY_HEIGHT]);
	
	// EAR 1
	difference() {
		translate([-EAR_WIDTH, 1, EAR_OFFSET]) cube([EAR_WIDTH, EAR_DEPTH, EAR_HEIGHT]);
		translate([-EAR_WIDTH/2, EAR_DEPTH/2 + 1, EAR_OFFSET]) cylinder(h=EAR_HEIGHT, d=EAR_HOLE_DIAMETER);
		translate([-EAR_WIDTH, EAR_DEPTH/2 + 1 - 1, EAR_OFFSET]) cube([EAR_HOLE_DIAMETER, 2, EAR_HEIGHT]);
	}
	
	// EAR 2
	difference() {
		translate([-EAR_WIDTH, 1+EAR_DEPTH, EAR_OFFSET]) cube([EAR_WIDTH, EAR_DEPTH, EAR_HEIGHT]);
		translate([-EAR_WIDTH/2, EAR_DEPTH/2 + 1 + EAR_DEPTH, EAR_OFFSET]) cylinder(h=EAR_HEIGHT, d=EAR_HOLE_DIAMETER);
		translate([-EAR_WIDTH, EAR_DEPTH/2 + 1 - 1 + EAR_DEPTH, EAR_OFFSET]) cube([EAR_HOLE_DIAMETER, 2, EAR_HEIGHT]);
	}
	
	// EAR 3
	difference() {
		translate([BODY_WIDTH, 1, EAR_OFFSET]) cube([EAR_WIDTH, EAR_DEPTH, EAR_HEIGHT]);
		translate([BODY_WIDTH+EAR_WIDTH/2, EAR_DEPTH/2 + 1, EAR_OFFSET]) cylinder(h=EAR_HEIGHT, d=EAR_HOLE_DIAMETER);
		translate([BODY_WIDTH+EAR_WIDTH-EAR_HOLE_DIAMETER, EAR_DEPTH/2 + 1 - 1, EAR_OFFSET]) cube([EAR_HOLE_DIAMETER, 2, EAR_HEIGHT]);
	}
	
	// EAR 4
	difference() {
		translate([BODY_WIDTH, 1+EAR_DEPTH, EAR_OFFSET]) cube([EAR_WIDTH, EAR_DEPTH, EAR_HEIGHT]);
		translate([BODY_WIDTH + EAR_WIDTH/2, EAR_DEPTH/2 + 1 + EAR_DEPTH, EAR_OFFSET]) cylinder(h=EAR_HEIGHT, d=EAR_HOLE_DIAMETER);
		translate([BODY_WIDTH+EAR_WIDTH-EAR_HOLE_DIAMETER, EAR_DEPTH/2 + 1 - 1 + EAR_DEPTH, EAR_OFFSET]) cube([EAR_HOLE_DIAMETER, 2, EAR_HEIGHT]);
	}
	
	translate([3/2+14.4-EAR_WIDTH/2, BODY_DEPTH/2, BODY_HEIGHT]) cylinder(h=1.5, d=20);
	translate([14, 1, BODY_HEIGHT]) cube([20, 18, 1.5]);
	
	translate([3/2+14.4-EAR_WIDTH/2, BODY_DEPTH/2, BODY_HEIGHT]) cylinder(h=2.5, d=13);
	translate([3/2+14.4-EAR_WIDTH/2, BODY_DEPTH/2, BODY_HEIGHT]) cylinder(h=3, d=10);
	color("brown") {
		translate([3/2+14.4-EAR_WIDTH/2, BODY_DEPTH/2, BODY_HEIGHT]) cylinder(h=6, d=5);
	}
	
	translate([3/2+14.4-EAR_WIDTH/2+14+10/2, BODY_DEPTH/2, BODY_HEIGHT]) cylinder(h=1.5, d=10);

}

module servoHubAdapter25T() {
	HEIGHT = 4.50;
	GEAR_HEIGHT = 2.50;
	
	difference() {
		cylinder(h=HEIGHT, d=20);
		cylinder(h=HEIGHT, d=3);
		translate([14/2, 0, 0]) cylinder(h=HEIGHT, d=3);
		translate([-14/2, 0, 0]) cylinder(h=HEIGHT, d=3);
		translate([0, 14/2, 0]) cylinder(h=HEIGHT, d=3);
		translate([0, -14/2, 0]) cylinder(h=HEIGHT, d=3);
	}
	
	difference() {
		translate([0, 0, HEIGHT]) cylinder(h=GEAR_HEIGHT, d=9);
		translate([0, 0, HEIGHT]) cylinder(h=GEAR_HEIGHT, d=6.05);
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