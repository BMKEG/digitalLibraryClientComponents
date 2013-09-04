package edu.isi.bmkeg.digitalLibrary.services
{

	import edu.isi.bmkeg.ftd.model.*;

	public interface IExtendedDigitalLibraryService {

		// ~~~~~~~~~~~~~~~
		//  functions
		// ~~~~~~~~~~~~~~~
		
		function addPmidEncodedPdfToCorpus(pdfFileData:Object, fileName:String, corpusName:String=null):void;
		
		function removeFragmentBlock(frgBlk:FTDFragmentBlock):void;
		
		//java: public List<String> listTermViews() throws Exception
		function listTermViews():void;
	}

}
