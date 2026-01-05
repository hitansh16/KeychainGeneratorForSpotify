// ==========================================
// KEYCHAIN GENERATOR FOR SPOTIFY
// ==========================================
//
// DISCLAIMER:
// This project is an independent tool created for educational purposes.
// It is not affiliated, associated, authorized, endorsed by, or in any way 
// officially connected with Spotify AB or any of its subsidiaries.
// The name Spotify, as well as related names, marks, emblems, and images 
// are registered trademarks of their respective owners.
// ==========================================

/* [Code Data] */
// Paste the string from the generator tool here:
data_string = "18,42,20,88,55,100,77,100,55,42,42,100,30,42,42,30,42,30,30,100,65,20,20";
// This is the code which generates a tag to my favorite song: Location by Khalid

/* [Tag Settings] */
// Total length of the tag in mm
tag_length = 70.0;

// Thickness of the backing
base_thickness = 3.0;    

// How much the white bars stick up
code_thickness = 1.0;  

// Size of keychain hole at narrowest point
hole_diameter = 4.0;     

/* [Hidden] */
tag_width = tag_length / 3.5;
bar_heights = parse_csv(data_string);
$fn = 100;             
edge_radius = 1.0;     

// ==========================================
// MAIN RENDER
// ==========================================
difference() {
    union() {
        color("black") 
        rounded_base_plate(tag_length, tag_width, base_thickness, edge_radius);
        
        color("white")
        translate([0, tag_width/2, base_thickness]) {
            start_x = tag_length * 0.2; 
            translate([start_x, 0, 0]) 
                draw_bars(tag_length - start_x - (tag_length * 0.08)); 
        }
    }
    
    translate([tag_width * 0.3, tag_width/2, 0])
        color("black")
        donut_hole_cut(base_thickness, hole_diameter, edge_radius);
}

// ==========================================
// MODULES
// ==========================================

module draw_bars(available_width) {
    bar_w = available_width / 34;
    gap = bar_w * 0.5; 
    max_h = tag_width * 0.70; 

    if (len(bar_heights) > 0) {
        for (i = [0 : len(bar_heights) - 1]) {
            h_percent = bar_heights[i];
            final_h = max((h_percent / 100) * max_h, bar_w); 
            x_pos = i * (bar_w + gap);
            translate([x_pos + bar_w/2, 0, 0])
                pill(bar_w, final_h, code_thickness);
        }
    }
}

module pill(width, height, thick) {
    radius = width / 2;
    offset_y = max(0, (height / 2) - radius);
    hull() {
        translate([0, -offset_y, 0]) cylinder(d=width, h=thick);
        translate([0, offset_y, 0])  cylinder(d=width, h=thick);
    }
}

module donut_hole_cut(h, d, r) {
    rotate_extrude($fn=100) {
        union() {
            square([d/2, h + 2]); 
            translate([d/2, h - r]) corner_shaper(r);
            translate([d/2, 0]) corner_shaper(r);
        }
    }
}

module corner_shaper(r) {
    difference() {
        square([r, r]);
        translate([r, 0]) circle(r=r);
    }
}

module rounded_base_plate(len, wid, thick, e_rad) {
    r = wid / 2;
    center_y = wid / 2;
    left_x = r;
    right_x = len - r;
    hull() {
        translate([left_x, center_y, 0]) filleted_cylinder(r, thick, e_rad);
        translate([right_x, center_y, 0]) filleted_cylinder(r, thick, e_rad);
    }
}

module filleted_cylinder(r, h, f_r) {
    rotate_extrude($fn=100) {
        hull() {
            square([r - f_r, h]);
            translate([0, f_r]) square([r, h - 2*f_r]);
            translate([r - f_r, h - f_r]) circle(r = f_r);
            translate([r - f_r, f_r]) circle(r = f_r);
        }
    }
}

function parse_csv(str) = 
    let(chars = [for(i=[0:len(str)-1]) str[i]])
    let(marks = concat([-1], [for(i=[0:len(chars)-1]) if(chars[i]==",") i], [len(str)]))
    [for(i=[0:len(marks)-2]) 
        let(sub = [for(j=[marks[i]+1 : marks[i+1]-1]) chars[j]])
        str_to_num(sub)
    ];

function str_to_num(chars) = 
    sum_pow([for(i=[0:len(chars)-1]) (ord(chars[i])-48) * pow(10, len(chars)-1-i)]);

function sum_pow(v, i=0, r=0) = i < len(v) ? sum_pow(v, i+1, r+v[i]) : r;