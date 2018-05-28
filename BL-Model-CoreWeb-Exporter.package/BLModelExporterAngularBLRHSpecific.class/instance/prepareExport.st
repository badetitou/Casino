api
prepareExport
	super prepareExport.
	
	BLActionAttribute moulinetteStrategy: (BLMoulinetteSweetFileStrategy new
		rootFolder: 'D:\Users\benoit.verhaeghe\Documents\Sweet\BLGRH\BLGRHGwt').