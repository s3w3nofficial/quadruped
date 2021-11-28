use <components.scad>

$fn = 50;

// assembly
color("red") translate([20-7+10, 15, 36.5+3]) servoHubAdapter25T();
color("blue") translate([10, 5, 0]) MG995();
translate([0, 0, 26.6-5]) tibia();

color("red") translate([20-7+10+80, 15, 36.5+3]) servoHubAdapter25T();
color("blue") translate([10+80, 5, 0]) MG995();
translate([20-7+10, 15, 36.5+3+4.5]) femur();

translate([80, 0, 26.6-5]) servoHolderAnkle();
color("red") translate([20-7+10+80-15+3, 50, 0]) rotate([0, -90, 0]) servoHubAdapter25T();
color("blue") translate([10+80+40, 40, -13]) rotate([0, -90, 0]) MG995();
translate([95, 35, 26.6+10]) servoHolderFemur();

module servoHolderFemur() {
	HEIGHT = 5;
	WIDTH = 15;
	RWIDTH = 60;
	RDEPTH = 30;
	
	rotate([0, 90, 00]) hull() {
		translate([WIDTH/2, WIDTH/2, 0]) cylinder(h=HEIGHT, d=WIDTH);
		translate([RWIDTH-WIDTH/2, WIDTH/2, 0]) cylinder(h=HEIGHT, d=WIDTH);
		translate([RWIDTH-WIDTH/2, RDEPTH-WIDTH/2, 0]) cylinder(h=HEIGHT, d=WIDTH);
		translate([WIDTH/2, RDEPTH-WIDTH/2, 0]) cylinder(h=HEIGHT, d=WIDTH);
	}
}

module servoHolderAnkle() {
	HEIGHT = 5;
	WIDTH = 15;
	RWIDTH = 60;
	RDEPTH = 30;
	
	difference() {
		hull() {
			translate([WIDTH/2, WIDTH/2, 0]) cylinder(h=HEIGHT, d=WIDTH);
			translate([RWIDTH-WIDTH/2, WIDTH/2, 0]) cylinder(h=HEIGHT, d=WIDTH);
			translate([RWIDTH-WIDTH/2, RDEPTH-WIDTH/2, 0]) cylinder(h=HEIGHT, d=WIDTH);
			translate([WIDTH/2, RDEPTH-WIDTH/2, 0]) cylinder(h=HEIGHT, d=WIDTH);
		}
		
		// servo hole
		translate([(RWIDTH-40)/2, (RDEPTH-20)/2, 0]) cube([40, 20, HEIGHT]);
		
		// servo screw holes
		translate([10+2-6.4+1, RDEPTH-4-9/2-2, 0]) cylinder(h=HEIGHT, d=4);
		translate([10+2-6.4+1, RDEPTH-4-9/2-9-2, 0]) cylinder(h=HEIGHT, d=4);
		translate([40+4+(RWIDTH-40)/2, RDEPTH-4-9/2-2, 0]) cylinder(h=HEIGHT, d=4);
		translate([40+4+(RWIDTH-40)/2, RDEPTH-4-9/2-9-2, 0]) cylinder(h=HEIGHT, d=4);
	}
	
		translate([RWIDTH-10, 30, 0]) cube([5, 20-2.5, HEIGHT]);
		translate([RWIDTH-10+2.5, 30+20-2.5, 0]) cylinder(h=HEIGHT, d=5);
		translate([RWIDTH-5, 40, 0]) cube([6, 5, HEIGHT]);
		translate([RWIDTH-30, 30, 0]) cube([20, 5, HEIGHT]);
		translate([RWIDTH-50, 35, 0]) cube([40, 5, HEIGHT]);
		translate([RWIDTH-38, 30, 0]) cube([4, 1, HEIGHT]);
		translate([RWIDTH-38, 35-1, 0]) cube([4, 1, HEIGHT]);
}
module femur() {
	HEIGHT = 5;
	LENGTH = 80;
	
	difference() {
		hull(){
			cylinder(h=HEIGHT, r=12.5);
			translate([LENGTH, 0, 0]) cylinder(h=HEIGHT, r=12.5);
		}
		
		cylinder(h=HEIGHT, r=3);
		translate([LENGTH, 0, 0]) cylinder(h=HEIGHT, r=3);
		
		translate([14/2, 0, 0]) cylinder(h=HEIGHT, d=3);
		translate([-14/2, 0, 0]) cylinder(h=HEIGHT, d=3);
		translate([0, 14/2, 0]) cylinder(h=HEIGHT, d=3);
		translate([0, -14/2, 0]) cylinder(h=HEIGHT, d=3);
		
		translate([14/2+LENGTH, 0, 0]) cylinder(h=HEIGHT, d=3);
		translate([-14/2+LENGTH, 0, 0]) cylinder(h=HEIGHT, d=3);
		translate([0+LENGTH, 14/2, 0]) cylinder(h=HEIGHT, d=3);
		translate([0+LENGTH, -14/2, 0]) cylinder(h=HEIGHT, d=3);
		
		translate([10+30, 96, 0]) cylinder(h=HEIGHT, r=80);
		translate([10+30, -96, 0]) cylinder(h=HEIGHT, r=80);
	}
}

module tibia() {
	HEIGHT = 5;
	WIDTH = 15;
	RWIDTH = 60;
	RDEPTH = 30;
	
	difference() {
		
		union() {
			hull() {
				hull() {
					translate([WIDTH/2, WIDTH/2, 0]) cylinder(h=HEIGHT, d=WIDTH);
					translate([RWIDTH-WIDTH/2, WIDTH/2, 0]) cylinder(h=HEIGHT, d=WIDTH);
					translate([RWIDTH-WIDTH/2, RDEPTH-WIDTH/2, 0]) cylinder(h=HEIGHT, d=WIDTH);
					translate([WIDTH/2, RDEPTH-WIDTH/2, 0]) cylinder(h=HEIGHT, d=WIDTH);
				}
				
				translate([WIDTH/2-20, RDEPTH/2, 0]) cylinder(h=HEIGHT, d=WIDTH);
			}
			
			hull() {
				translate([WIDTH/2, RDEPTH-WIDTH/2, 0]) cylinder(h=HEIGHT, d=WIDTH);
				
				translate([-35, WIDTH/2, 0]) cylinder(h=HEIGHT, d=WIDTH);
			}
		}
		
		// servo hole
		translate([(RWIDTH-40)/2, (RDEPTH-20)/2, 0]) cube([40, 20, HEIGHT]);
		
		// servo screw holes
		translate([10+2-6.4+1, RDEPTH-4-9/2-2, 0]) cylinder(h=HEIGHT, d=4);
		translate([10+2-6.4+1, RDEPTH-4-9/2-9-2, 0]) cylinder(h=HEIGHT, d=4);
		translate([40+4+(RWIDTH-40)/2, RDEPTH-4-9/2-2, 0]) cylinder(h=HEIGHT, d=4);
		translate([40+4+(RWIDTH-40)/2, RDEPTH-4-9/2-9-2, 0]) cylinder(h=HEIGHT, d=4);
	}
}