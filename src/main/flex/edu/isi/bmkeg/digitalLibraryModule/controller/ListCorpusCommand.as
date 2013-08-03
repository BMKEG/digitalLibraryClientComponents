package edu.isi.bmkeg.digitalLibraryModule.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.digitalLibrary.rl.services.IDigitalLibraryService;
	import edu.isi.bmkeg.digitalLibrary.model.citations.Corpus;
	import edu.isi.bmkeg.digitalLibrary.rl.events.ListCorpusEvent;
	
	import flash.events.Event;
	
	public class ListCorpusCommand extends Command
	{
	
		[Inject]
		public var event:ListCorpusEvent;

		[Inject]
		public var service:IDigitalLibraryService;
				
		override public function execute():void
		{
			service.listCorpus(event.object);
		}
		
	}
	
}