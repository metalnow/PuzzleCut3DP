//OpenSCAD PuzzleCut Library Demo - by Rich Olson
//http://www.nothinglabs.com
//Tested on build 2012.08.22
//License: http://creativecommons.org/licenses/by/3.0/

//NOTE: Complex objects may result in "normalized tree" errors / rendering problems
//These can be worked around by doing a full render (just hit F6)

include <puzzlecutlib.scad>
include <demoobject.scad>

stampSize = [500,500,100];		//size of cutting stamp (should cover 1/2 of object)

cutSize = 4;	//size of the puzzle cuts

xCut1 = [-64, -8, 8, 27, 45, 64];	//locations of puzzle cuts relative to X axis center
yCut1 = [-64, -8, 8, 64];				//for Y axis

kerf = 0;		//supports +/- numbers (greater value = tighter fit)
					//using a small negative number may be useful to assure easy fit for 3d printing
					//using positive values useful for lasercutting
					//negative values can also help visualize cuts without seperating pieces

cutInTwo(); //cuts in two along y axis
//cutInFour();  //cuts in four along x / y axis

//comment out lines as needed to render individual pieces

module cutInTwo()
{
	translate([5,0,0])
		yMaleCut() drawDemoObject();

	translate([-5,0,0])
		yFemaleCut() drawDemoObject();
}

module cutInFour()
{
	translate([5,-5,0])
		xMaleCut() yMaleCut() drawDemoObject();

	translate([-5,-5,0])
		xMaleCut() yFemaleCut() drawDemoObject();

	translate([5,5,0])
		xFemaleCut() yMaleCut() drawDemoObject();

	translate([-5,5,0])
		xFemaleCut() yFemaleCut() drawDemoObject();
}
