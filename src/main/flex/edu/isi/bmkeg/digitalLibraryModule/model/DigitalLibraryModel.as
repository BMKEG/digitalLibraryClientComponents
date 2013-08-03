package edu.isi.bmkeg.digitalLibraryModule.model
{
	
	import edu.isi.bmkeg.digitalLibrary.model.citations.*;
	import edu.isi.bmkeg.ftd.model.FTD;
	import edu.isi.bmkeg.digitalLibrary.model.qo.citations.*;
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
	
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	import mx.utils.UIDUtil;
	
	import org.robotlegs.mvcs.Actor;

	[Bindable]
	public class DigitalLibraryModel extends Actor
	{
		public var listPageSize:int = 200;
		
		public var corpora:ArrayCollection = new ArrayCollection();
		
		public var triageCorpora:ArrayCollection = new ArrayCollection();
		
		public var corpus:Corpus;		

		public var queryLiteratureCitation:ArticleCitation_qo;

		public var currentCitation:ArticleCitation;

		public var currentInOutCode:String;
		
	}

}