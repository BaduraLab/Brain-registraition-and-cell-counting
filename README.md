Workflow to count cells/objects in histological brain slices and get the brain location using SharpTrack register function.  
Pre-requisits: download the ShaprTrack package, important to have all documents and subfunctions! https://github.com/cortex-lab/allenCCF/tree/master/SHARP-Track

Summary of steps  
1- Run pre-processing code ijm - Fiji  
2- Run Navigate and Register brain slices SharpTrack - Matlab   
3- Run cell counting ijm - Fiji   
4- Run ROI analysis Sharptrack - Matlab   
  4.1 Create ROI array with information from cell counting   
  4.2 Analyze ROIs to get exact coordinates in brain   
5- After that you can plot in different ways to visualize the data  

