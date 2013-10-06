package edu.isi.bmkeg.digitalLibrary.services
{

	import edu.isi.bmkeg.ftd.model.*;
	import mx.collections.ArrayCollection;
	
	public interface IExtendedDigitalLibraryService {

		// ~~~~~~~~~~~~~~~
		//  functions
		// ~~~~~~~~~~~~~~~
		
		function addPmidEncodedPdfToCorpus(pdfFileData:Object, fileName:String, corpusName:String=null):void;
		
		function removeFragmentBlock(frgBlk:FTDFragmentBlock):void;
		
		//java: public List<String> listTermViews() throws Exception
		function listTermViews():void;

		function addArticlesToCorpus(articleIds:ArrayCollection, corpusId:Number):void;

		function removeArticlesFromCorpus(articleIds:ArrayCollection, corpusId:Number):void;

		function fullyDeleteArticle(articleId:Number):void;		
		
	}

}
