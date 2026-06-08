
// Garra Robótica Conceitual - Compatível com Servo SG90 9g
// OpenSCAD - Exportável STL/OBJ
//

$fn = 64;

// =========================
// SERVO SG90 9g
// =========================
servo_x = 23;
servo_y = 12.2;
servo_z = 24;

servo_clearance = 1.0;

servo_slot_x = servo_x + servo_clearance;
servo_slot_y = servo_y + servo_clearance;

servo_ear_total_x = 32;
servo_ear_y = 6;
servo_screw_spacing = 27.5;
servo_screw_d = 2.4;
servo_shaft_d = 7;

// =========================
// BASE
// =========================
base_w = 70;
base_l = 45;
base_h = 8;

// =========================
// GARRAS
// =========================
jaw_thickness = 6;
jaw_height = 10;
jaw_length = 55;
jaw_curve_angle = 0;
jaw_spacing = 32;

// deslocamento horizontal das garras
jaw_offset_x = 25.5;

// =========================
// FUROS
// =========================
mount_hole_d = 3.2;
relief_hole_d = 6;

// =========================
// DENTES
// =========================
tooth_count = 5;
tooth_w = 3;
tooth_h = 2.5;
tooth_depth = -4.5;

// =========================
// MÓDULOS DA BASE
// =========================

module fixation_holes()
{
    for(x=[-26,26])
    for(y=[-15,15])
    {
        translate([x,y,-base_h])
            cylinder(d=mount_hole_d, h=base_h*3);
    }
}

module servo_pocket()
{
    translate([
        -servo_slot_x/2,
        -servo_slot_y/2,
        -base_h/2 + 1
    ])
    cube([
        servo_slot_x,
        servo_slot_y,
        base_h + 2
    ]);

    translate([
        -servo_ear_total_x/2,
        -servo_ear_y/2,
        base_h/2 - 2.5
    ])
    cube([
        servo_ear_total_x,
        servo_ear_y,
        4
    ]);

    for(x=[-servo_screw_spacing/2, servo_screw_spacing/2])
    {
        translate([x,0,-base_h])
            cylinder(d=servo_screw_d, h=base_h*3);
    }

    translate([0,0,-base_h])
        cylinder(d=servo_shaft_d, h=base_h*3);
}

module decorative_base_holes()
{
    for(x=[-18,18])
    for(y=[-10,10])
    {
        translate([x,y,-base_h])
            cylinder(d=4, h=base_h*3);
    }
}

module base_plate()
{
    difference()
    {
        cube([base_w,base_l,base_h], center=true);

        servo_pocket();
        fixation_holes();
        decorative_base_holes();
    }
}

// =========================
// MÓDULOS DAS GARRAS
// =========================

module jaw_profile()
{
    union()
    {
        hull()
        {
            translate([0,0,0])
                cylinder(r=jaw_height/2, h=jaw_thickness);

            translate([jaw_length*0.65,0,0])
                cylinder(r=jaw_height/2, h=jaw_thickness);
        }

        hull()
        {
            translate([jaw_length*0.65,0,0])
                cylinder(r=jaw_height/2, h=jaw_thickness);

            translate([jaw_length,4,0])
                cylinder(r=jaw_height*0.35, h=jaw_thickness);
        }
    }
}

module jaw_relief_holes()
{
    for(pos=[12,25,38])
    {
        translate([pos,0,-1])
            cylinder(d=relief_hole_d, h=jaw_thickness+2);
    }
}

module jaw_teeth()
{
    for(i=[0:tooth_count-1])
    {
        translate([
            14 + i*7,
            -tooth_depth,
            jaw_thickness*0.15
        ])
        linear_extrude(height=jaw_thickness*0.7)
        polygon([
            [0,0],
            [tooth_w,0],
            [tooth_w/2,tooth_h]
        ]);
    }
}

module single_jaw()
{
    difference()
    {
        jaw_profile();
        jaw_relief_holes();
    }

    jaw_teeth();

    cylinder(d=7, h=jaw_thickness);
}

module left_jaw()
{
    translate([jaw_offset_x,-jaw_spacing/2,base_h/2])
    rotate([0,0,jaw_curve_angle])
        single_jaw();
}

module right_jaw()
{
    mirror([0,1,0])
    translate([jaw_offset_x,-jaw_spacing/2,base_h/2])
    rotate([0,0,jaw_curve_angle])
        single_jaw();
}

module pivot_boss()
{
    difference()
    {
        union()
        {
            translate([jaw_offset_x,-jaw_spacing/2,base_h/2])
                cylinder(d=12,h=8);

            translate([jaw_offset_x,jaw_spacing/2,base_h/2])
                cylinder(d=12,h=8);
        }

        translate([jaw_offset_x,-jaw_spacing/2,base_h/2-1])
            cylinder(d=3.2,h=12);

        translate([jaw_offset_x,jaw_spacing/2,base_h/2-1])
            cylinder(d=3.2,h=12);
    }
}

// =========================
// MONTAGEM
// =========================

union()
{
    base_plate();
    pivot_boss();
    left_jaw();
    right_jaw();
}
