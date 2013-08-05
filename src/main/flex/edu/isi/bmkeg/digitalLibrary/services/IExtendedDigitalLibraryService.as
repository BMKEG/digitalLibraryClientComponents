package edu.isi.bmkeg.digitalLibrary.services
{

	public interface IExtendedDigitalLibraryService {

		// ~~~~~~~~~~~~~~~
		//  functions
		// ~~~~~~~~~~~~~~~
		
		function addPmidEncodedPdfToCorpus(pdfFileData:Object, fileName:String, corpusName:String=null):void;
		
	}

}
