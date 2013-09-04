package edu.isi.bmkeg.digitalLibraryModule.model
{
	
	import edu.isi.bmkeg.digitalLibrary.model.citations.*;
	import edu.isi.bmkeg.digitalLibrary.model.qo.citations.*;
	import edu.isi.bmkeg.ftd.model.FTD;
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
	
	import flash.display.*;
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	import mx.utils.UIDUtil;
	
	import org.robotlegs.mvcs.Actor;
	
	[Bindable]
	public class DigitalLibraryModel extends Actor
	{
		
		// number of entries returned in each page for the article list
		public var listPageSize:int = 200;
		
		// list of all corpora in the system
		public var corpora:ArrayCollection = new ArrayCollection();
		
		// the currently selected corpus
		public var corpus:Corpus;		

		// conditions that specify the articles currently listed
		public var queryLiteratureCitation:ArticleCitation_qo;

		// the selected article
		public var citation:ArticleCitation;

		// A light version (equivalent of a LightViewInstance) of the FTD associated with the citation
		// We don't load the 'heavy' swf data or the lapdftext binary over the application's 
		// standard amf interface to cut down the I/O to just what is needed. 
		public var lightFtd:FTD;
		
		// the SWF of the PDF file
		public var swf:MovieClip;
		
		// An array of adapted org.ffilmation.utils.rtree.fRTree objects 
		public var rTreeArray:ArrayCollection = new ArrayCollection();
		
		// An array of arrays of words, indexed by page, then by rtree index
		public var indexedWordsByPage:ArrayCollection = new ArrayCollection();
		
		// The fragmenter renders each page as a bitmap. This is the scaling factor 
		// used to mitigate pixelation so that the pages look OK in the interface.
		public var pdfScale:Number = 2.0;

		// All fragments loaded from the current document
		public var fragments:ArrayCollection = new ArrayCollection();
		
		// All terms loaded to annotate the current fragment
		public var terms:ArrayCollection = new ArrayCollection();
	
		// The term currently set to annotate new fragments
		public var frgType:String;

	}

}