//OpenSCAD PuzzleCut Library Demo - by Rich Olson
//http://www.nothinglabs.com
//Tested on build 2012.08.22
//License: http://creativecommons.org/licenses/by/3.0/


module xMaleCut(offset = 0, cut = xCut1)
{
	difference()
	{
		child(0);	
		translate([0,offset,0]) makePuzzleStamp(cutLocations = cut);
	}
}


module xFemaleCut(offset = 0, cut = xCut1)
{
	intersection()
	{
		child(0);
		translate([0,offset,0]) makePuzzleStamp(cutLocations = cut,
			 kerf = kerf);	//only set kerf on female side
	}
}


module yMaleCut(offset = 0, cut = yCut1)
{
	difference()
	{
		child(0);	
		rotate ([0,0,90]) translate([0,offset,0]) makePuzzleStamp(cutLocations = cut);
	}
}


module yFemaleCut(offset = 0, cut = yCut1)
{
	intersection()
	{
		child(0);
		rotate ([0,0,90]) translate([0,offset,0]) makePuzzleStamp(cutLocations = cut,
			 kerf = kerf);	//only set kerf on female side
	}
}


module ZMaleCut(offset = 0, cut = zCut1)
{
	intersection()
	{
		difference()
		{
			difference()
			{
				cube(stampSize, center = true);	
				rotate ([0,90,90]) translate([0,offset,0]) makePuzzleStamp(cutLocations = cut);
			}
			//make the cube
			translate ([stampSize[0] / 2 - kerf,0,0])
				cube (stampSize, center = true);
		}
		child(0);
	}
}


module ZFemaleCut(offset = 0, cut = zCut1)
{
	intersection()
	{
		child(0);	
		rotate ([-90,90,0]) translate([0,offset,0]) makePuzzleStamp(cutLocations = cut);
	}
}

module makePuzzleStamp(kerf = 0)
{
	difference()
	{
		//make the cube
		translate ([0,stampSize[0] / 2 - kerf,0])
			cube (stampSize, center = true);
		
		//make the cuts
		for ( i = cutLocations )
		{
			translate([i,0,0])
				cube ([(cutSize / 2) - kerf * 2, cutSize - kerf * 2,stampSize[2]], center = true);
			translate([i,cutSize / 2,0])
				cube ([cutSize - kerf *  2,(cutSize / 2) - kerf * 2, stampSize[2]], center = true);
		}		
	}
}
