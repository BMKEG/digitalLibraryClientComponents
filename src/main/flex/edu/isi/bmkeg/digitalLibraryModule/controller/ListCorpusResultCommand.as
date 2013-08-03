package edu.isi.bmkeg.digitalLibraryModule.controller
{	
	
	import edu.isi.bmkeg.digitalLibrary.model.citations.Corpus;
	import edu.isi.bmkeg.digitalLibrary.rl.events.ListCorpusResultEvent;
	import edu.isi.bmkeg.digitalLibraryModule.model.DigitalLibraryModel;
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Command;
	
	public class ListCorpusResultCommand extends Command
	{
		
		[Inject]
		public var event:ListCorpusResultEvent;
		
		[Inject]
		public var model:DigitalLibraryModel;
		
		
		override public function execute():void
		{
		
			model.corpora = new ArrayCollection();
			
		}
		
	}
	
}