dir = getDirectory("Choose a Directory");
files = getFileList(dir);

for(i=0;i<files.length;i++){
	shortname = substring(files[i],0,indexOf(files[i],"."));
	if (endsWith (files[i], ".tif"))
	
	   {
		
		open(dir+files[i]);
	    
	    run("Threshold...");
	    setAutoThreshold("MaxEntropy dark");
		setThreshold(40, 50);

        setOption("BlackBackground", true);
        run("Convert to Mask");	   
         
		run("Set Measurements...", "centroid nan redirect=None decimal=0");
        run("Analyze Particles...", "size=2-100 pixel circularity=0.50-1.00 show=[Count Masks] display exclude overlay add");
        selectWindow("Count Masks of " + files[i]);
        run("Flatten");
        saveAs(dir + "detected_particles_" + shortname + ".tif");
        
		saveAs("Results", dir + shortname+ ".csv");


		}	

	run("Close All");
	
}