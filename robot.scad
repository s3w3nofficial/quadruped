use <components.scad>

$fn = 50;

servoHubAdapter25T();

module femur() {
	difference() {
		hull(){
			cylinder(h=5, r=10);
			translate([60, 0, 0]) cylinder(h=5, r=10);
		}
		
		cylinder(h=5, r=3);
		translate([60, 0, 0]) cylinder(h=5, r=3);
		
		translate([-1.75, 6, 0]) cylinder(h=5, r=2);
		translate([1.75, 6, 0]) cylinder(h=5, r=2);
		
		translate([-1.75, -6, 0]) cylinder(h=5, r=1.2);
		translate([1.75, -6, 0]) cylinder(h=5, r=1.2);
		
		translate([-1.75+60, 6, 0]) cylinder(h=5, r=1.2);
		translate([1.75+60, 6, 0]) cylinder(h=5, r=1.2);
		
		translate([-1.75+60, -6, 0]) cylinder(h=5, r=1.2);
		translate([1.75+60, -6, 0]) cylinder(h=5, r=1.2);

		translate([10+20, 56, 0]) cylinder(h=5, r=50);
		translate([10+20, -56, 0]) cylinder(h=5, r=50);
	}
}

module tibia() {
	difference() {
		hull() {
			cylinder(h=5, r=5);
			translate([0, 20-10, 0]) cylinder(h=5, r=5);
			translate([28, 20-10, 0]) cylinder(h=5, r=5);
			translate([28, 0, 0]) cylinder(h=5, r=5);
		}
	}
	
	hull() {
		translate([0, 20-10, 0]) cylinder(h=5, r=5);
		translate([-30, 0, 0]) cylinder(h=5, r=5);
	}
}