dir = getDirectory("Choose a Directory");
files = getFileList(dir);

for(i=0;i<files.length;i++){
	shortname = substring(files[i],0,indexOf(files[i],"."));
	if (endsWith (files[i], ".tif"))
	
	   {
		
		open(dir+files[i]);
		//run("Split Channels"); use this two lines if the channels are merged together
		//selectWindow(files[i]+" (red)");
		run("Brightness/Contrast...");
		setMinAndMax(0, 80);
		run("Apply LUT");
		run("Close")
		run("Rotate 90 Degrees Right");
		run("Rotate... "); //use the dialog window to adjust the angle if the slice is a bit tilted. IMP! click on Preview to see the changes. Press OK when done.
        setTool("Rectangle");
        waitForUser("Select region for cropping. \nClick ‘OK’ when done.");
        run("Crop");
        run("Scale...", "x=- y=- width=1140 height=800 interpolation=Bilinear fill average create"); //to match reference atlas
        run("Coordinates...", "left=0 right=1140 top=0 bottom=800");
		
		//selectWindow(files[i]+ " (red)-1");

		saveAs(dir + "downsampled_" + shortname + ".tif");

		}	

	run("Close All");
	
}

