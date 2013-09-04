package edu.isi.bmkeg.digitalLibraryModule.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.digitalLibrary.rl.services.IDigitalLibraryService;
	import edu.isi.bmkeg.digitalLibrary.model.citations.Corpus;
	import edu.isi.bmkeg.digitalLibrary.rl.events.*;
	
	import flash.events.Event;
	
	public class UpdateCorpusCommand extends Command
	{
		
		[Inject]
		public var event:UpdateCorpusEvent;
		
		[Inject]
		public var service:IDigitalLibraryService;
		
		override public function execute():void
		{
			service.updateCorpus(event.object);
		}
		
	}
	
}