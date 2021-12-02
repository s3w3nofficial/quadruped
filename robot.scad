use <components.scad>

$fn = 50;
	
// assembly
translate([41.25, 25, 0]) {
	rotate([90, 0, 0]) {
		color("red") translate([20-7+10, 15, 36.5+3]) servoHubAdapter25T();
		color("blue") translate([10, 5, 0]) MG995();
		translate([1.25, 0, 26.6-5]) tibia();

		color("red") translate([20-7+10+80, 15, 36.5+3]) servoHubAdapter25T();
		color("blue") translate([10+80, 5, 0]) MG995();
		translate([20-7+10, 15, 36.5+3+4.5]) femur();

		translate([80, 0, 26.6-5]) servoHolderAnkle();
		color("red") translate([20-7+10+80-15+3-5, 50, 2.5+15]) rotate([180, 90, -180]) servoHubAdapter25T();
		color("blue") translate([10+80+40, 60, 32]) rotate([0, 90, -180]) MG995();
		translate([102.5, 35, 26.6+15]) servoHolderFemur();
	}
}

translate([41.25, -25+125, 0]) mirror([0, 1, 0]) {
	rotate([90, 0, 0]) {
		color("red") translate([20-7+10, 15, 36.5+3]) servoHubAdapter25T();
		color("blue") translate([10, 5, 0]) MG995();
		translate([1.25, 0, 26.6-5]) tibia();

		color("red") translate([20-7+10+80, 15, 36.5+3]) servoHubAdapter25T();
		color("blue") translate([10+80, 5, 0]) MG995();
		translate([20-7+10, 15, 36.5+3+4.5]) femur();

		translate([80, 0, 26.6-5]) servoHolderAnkle();
		color("red") translate([20-7+10+80-15+3-5, 50, 2.5+15]) rotate([180, 90, -180]) servoHubAdapter25T();
		color("blue") translate([10+80+40, 60, 32]) rotate([0, 90, -180]) MG995();
		translate([102.5, 35, 26.6+15]) servoHolderFemur();
	}
}

translate([167.5, 0, 50]) rotate([0, 90, 0])  sidePlate();


module sidePlate() {
	HEIGHT = 5;
	WIDTH = 4;
	
	hull() {
		translate([-15, 0, 10]) cylinder(h=HEIGHT, r=WIDTH);
		translate([-15, 125, 10]) cylinder(h=HEIGHT, r=WIDTH);
		translate([10, 125, 10]) cylinder(h=HEIGHT, r=WIDTH);
		translate([10, 0, 10]) cylinder(h=HEIGHT, r=WIDTH);
	}
}

module servoHolderFemur() {
	HEIGHT = 5;
	WIDTH = 15;
	RWIDTH = 60;
	RDEPTH = 30;
	
	SERVO_WIDTH = 42.5;
	
	rotate([0, 90, 00]) {
	
		difference() {
			hull() {
				translate([WIDTH/2, WIDTH/2, 0]) cylinder(h=HEIGHT, d=WIDTH);
				translate([RWIDTH-5, 0, 0]) cube([5, 5, 5]);
				translate([RWIDTH-WIDTH/2, RDEPTH-WIDTH/2, 0]) cylinder(h=HEIGHT, d=WIDTH);
				translate([WIDTH/2, RDEPTH-WIDTH/2, 0]) cylinder(h=HEIGHT, d=WIDTH);
			}
			
			// servo hole
			translate([(RWIDTH-SERVO_WIDTH)/2, (RDEPTH-20)/2, 0]) cube([SERVO_WIDTH, 20, HEIGHT]);
			
			// servo screw holes
			translate([10+2-6.4+1-0.5, RDEPTH-4-9/2-2, 0]) cylinder(h=HEIGHT, d=4);
			translate([10+2-6.4+1-0.5, RDEPTH-4-9/2-9-2, 0]) cylinder(h=HEIGHT, d=4);
			translate([40+4+(RWIDTH-40)/2+0.5, RDEPTH-4-9/2-2, 0]) cylinder(h=HEIGHT, d=4);
			translate([40+4+(RWIDTH-40)/2+0.5, RDEPTH-4-9/2-9-2, 0]) cylinder(h=HEIGHT, d=4);	
			
			translate([14.5, 0, 0]) cube([6, 5, 5]);
		}
		
		translate([10, -10, 0]) cube([4.5, 10, 5]);
		translate([14.5, -5, 0])  difference() {
			cube([6, 5, 5]);
			translate([2.5, 2.5, 0]) cylinder(h=HEIGHT, d=2);
		}
		translate([20.5, -5, 0]) cube([29.5, 5, 5]);
		translate([20.5, -10, 0]) cube([29.5, 5, 5]);
		translate([45, -30, 0]) cube([5, 20, 5]);
		translate([20, -35, 0]) cube([30, 5, 5]);
	}
}

module servoHolderAnkle() {
	HEIGHT = 5;
	WIDTH = 15;
	RWIDTH = 60;
	RDEPTH = 30;
	
	SERVO_WIDTH = 42.5;
	
	difference() {
		hull() {
			translate([WIDTH/2, WIDTH/2, 0]) cylinder(h=HEIGHT, d=WIDTH);
			translate([RWIDTH-WIDTH/2, WIDTH/2, 0]) cylinder(h=HEIGHT, d=WIDTH);
			translate([RWIDTH-WIDTH/2, RDEPTH-WIDTH/2, 0]) cylinder(h=HEIGHT, d=WIDTH);
			translate([WIDTH/2, RDEPTH-WIDTH/2, 0]) cylinder(h=HEIGHT, d=WIDTH);
		}
		
		// servo hole
		translate([(RWIDTH-SERVO_WIDTH)/2, (RDEPTH-20)/2, 0]) cube([SERVO_WIDTH, 20, HEIGHT]);
		
		// servo screw holes
		translate([10+2-6.4+1-0.5, RDEPTH-4-9/2-2, 0]) cylinder(h=HEIGHT, d=4);
		translate([10+2-6.4+1-0.5, RDEPTH-4-9/2-9-2, 0]) cylinder(h=HEIGHT, d=4);
		translate([40+4+(RWIDTH-40)/2+0.5, RDEPTH-4-9/2-2, 0]) cylinder(h=HEIGHT, d=4);
		translate([40+4+(RWIDTH-40)/2+0.5, RDEPTH-4-9/2-9-2, 0]) cylinder(h=HEIGHT, d=4);	
	}
	
	translate([RWIDTH-10, 25, 0]) cube([5, 35-2.5, HEIGHT]);
	translate([RWIDTH-10+2.5, 40+20-2.5, 0]) cylinder(h=HEIGHT, d=5);
	translate([RWIDTH-5, 50, 0]) cube([6, 5, HEIGHT]);
	translate([RWIDTH-25, 30, 0]) cube([15, 5, HEIGHT]);
	translate([RWIDTH-50, 35, 0]) cube([40, 5, HEIGHT]);
	translate([RWIDTH-33, 30, 0]) cube([4, 1, HEIGHT]);
	translate([RWIDTH-33, 35-1, 0]) cube([4, 1, HEIGHT]);
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
		
		translate([10+30, LENGTH+LENGTH/10, 0]) cylinder(h=HEIGHT, r=LENGTH);
		translate([10+30, -LENGTH-LENGTH/10, 0]) cylinder(h=HEIGHT, r=LENGTH);
	}
}

module tibia() {
	HEIGHT = 5;
	WIDTH = 15;
	RWIDTH = 60;
	RDEPTH = 30;
	
	SERVO_WIDTH = 42.5;
	
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
		translate([(RWIDTH-SERVO_WIDTH)/2, (RDEPTH-20)/2, 0]) cube([SERVO_WIDTH, 20, HEIGHT]);
		
		// servo screw holes
		translate([10+2-6.4+1-0.5, RDEPTH-4-9/2-2, 0]) cylinder(h=HEIGHT, d=4);
		translate([10+2-6.4+1-0.5, RDEPTH-4-9/2-9-2, 0]) cylinder(h=HEIGHT, d=4);
		translate([40+4+(RWIDTH-40)/2+0.5, RDEPTH-4-9/2-2, 0]) cylinder(h=HEIGHT, d=4);
		translate([40+4+(RWIDTH-40)/2+0.5, RDEPTH-4-9/2-9-2, 0]) cylinder(h=HEIGHT, d=4);
	}
}
