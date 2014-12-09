//OpenSCAD PuzzleCut Library Demo - by Rich Olson
//http://www.nothinglabs.com
//Tested on build 2012.08.22
//License: http://creativecommons.org/licenses/by/3.0/
//demo object "Bucket O' Octopodes (thicker legs)" - http://www.thingiverse.com/thing:8896

//NOTE: Complex objects may result in "normalized tree" errors / rendering problems
//These can be worked around by doing a full render (just hit F6)

include <puzzlecutlib.scad>

stampSize = [1500,1500,1000];		//size of cutting stamp (should cover 1/2 of object)

cutSize = 4;	//size of the puzzle cuts

xCut1 = [-45, -35, -35, -25 ,-15, -5, , 5, 15, 25, 35, 45]; //locations of puzzle cuts relative to X axis center
yCut1 = [-4, 5, 16];	//for Y axis

kerf = -0.3;		//supports +/- numbers (greater value = tighter fit)
					//using a small negative number may be useful to assure easy fit for 3d printing
					//using positive values useful for lasercutting
					//negative values can also help visualize cuts without seperating pieces


cutInTwo();	//cuts in two along y axis
//cutInFour();	//cuts in four along x / y axis

//comment out lines as needed to render individual pieces

module cutInTwo()
{
	translate([0,0,0])
		xMaleCut() drawOcto();

	rotate ([0,0,0]) translate([0,-55,20])
		xFemaleCut() drawOcto();
}

module cutInFour()
{
	translate([6,-6,0])
		xMaleCut() yMaleCut() drawOcto();

	translate([-6,-6,0])
		xMaleCut() yFemaleCut() drawOcto();

	translate([6,6,0])
		xFemaleCut() yMaleCut() drawOcto();

	translate([-6,6,0])
		xFemaleCut() yFemaleCut() drawOcto();
}


module drawOcto()
{
//	translate([-50,0,0]) rotate ([90,0,90]) 
//	import("zendome_3d_mainframe.stl");

	translate([0,-60,0]) rotate ([90,0,90]) 
	import("zendome_3d_nexus_7_Plate.stl");

}