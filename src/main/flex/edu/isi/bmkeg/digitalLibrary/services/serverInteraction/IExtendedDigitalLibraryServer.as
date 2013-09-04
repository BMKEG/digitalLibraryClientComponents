package edu.isi.bmkeg.digitalLibrary.services.serverInteraction
{

	import mx.rpc.AbstractOperation;

	public interface IExtendedDigitalLibraryServer {

		// ~~~~~~~~~~~~~~~
		//  functions
		// ~~~~~~~~~~~~~~~
		function get addPmidEncodedPdfToCorpus():AbstractOperation;

		function get removeFragmentBlock():AbstractOperation; 

		function get listTermViews():AbstractOperation; 
		
	}

}