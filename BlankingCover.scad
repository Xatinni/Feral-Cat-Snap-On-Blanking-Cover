// Feral Cat Snap-On Blanking Cover (Deep Version)
int_width = 72;   
int_height = 113.5; 
int_depth = 18; // <--- ADJUST THIS for internal room
wall = 1.2;     // <--- ADJUST THIS for wall thickness

width = int_width + (wall * 2);
height = int_height + (wall * 2);
depth = int_depth + wall;

overlap = 0.1; // Ensures a clean cut

difference() {
    // Outer Shell
    minkowski() {
        cube([width, height, depth], center=true);
        cylinder(r=3, h=0.1, $fn=32); 
    }

    // Hollow out the interior
    // We shift it up so the "floor" stays at the bottom
    translate([0, 0, wall/2 + overlap/2]) 
        cube([int_width, int_height, int_depth + overlap], center=true);
}

// Internal Snap Tabs
module snap_tab() {
    // Positioned relative to the NEW depth
    translate([0, (height/2) - 1, (depth/2) - 4])
        cube([15, 2, 3], center=true);
}

snap_tab(); 
rotate([0,0,180]) snap_tab();
