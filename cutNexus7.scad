//OpenSCAD PuzzleCut Library Demo - by Rich Olson
//http://www.nothinglabs.com
//Tested on build 2012.08.22
//License: http://creativecommons.org/licenses/by/3.0/
//demo object "Bucket O' Octopodes (thicker legs)" - http://www.thingiverse.com/thing:8896

//NOTE: Complex objects may result in "normalized tree" errors / rendering problems
//These can be worked around by doing a full render (just hit F6)

include <puzzlecutlib.scad>

stampSize = [500,500,500];		//size of cutting stamp (should cover 1/2 of object)

cutSize = 4;	//size of the puzzle cuts

xCut1 = [-65, -55, -45, -35, -35, -25 ,-15, -5, 5, 15]; //locations of puzzle cuts relative to X axis center
yCut1 = [-80, -60, -40, -20, 20, 40, 60, 80];	//for Y axis

zCut1 = [-15, -5, 5, 15];	//for Z axis

kerf = -0.3;		//supports +/- numbers (greater value = tighter fit)
					//using a small negative number may be useful to assure easy fit for 3d printing
					//using positive values useful for lasercutting
					//negative values can also help visualize cuts without seperating pieces

//makePuzzleStamp(cutLocations=zCut1);
//ZFemaleCut() drawObj();

//cutInTwo();	//cuts in two along y axis
cutInFour();	//cuts in four along x / y axis

//comment out lines as needed to render individual pieces
module cutInTwo()
{
	translate([0,0,0])
		xMaleCut() drawObj();

	rotate ([0,0,0]) translate([0,-55,20])
		xFemaleCut() drawObj();
}

module cutInFour()
{

	translate([5,-10,0])
		xMaleCut() yMaleCut() drawObj();

	translate([5,-10,0])
		xMaleCut() ZMaleCut() drawObj();

	translate([5,10,0])
		xFemaleCut() yMaleCut() drawObj();

	translate([5,10,0])
		xFemaleCut() ZMaleCut() drawObj();

	translate([-5,-10,0])
		xMaleCut() yFemaleCut() ZFemaleCut() drawObj();

	translate([-5,10,0])
		xFemaleCut() yFemaleCut() ZFemaleCut() drawObj();
}

module drawObj()
{
	translate([-74,0,0]) rotate ([90,0,90]) 
	import("zendome_3d_mainframe.stl");

//	translate([0,-60,0]) rotate ([90,0,90]) 
//	import("zendome_3d_nexus_7_Plate.stl");
}