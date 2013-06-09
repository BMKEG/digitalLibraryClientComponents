package edu.isi.bmkeg.digitalLibrary.citations.controller
{
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestSaveCorpusEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.service.ICorporaService;
	import edu.isi.bmkeg.digitalLibrary.model.citations.Corpus;
	
	import org.robotlegs.mvcs.Command;
	
	public class SaveCorpusCommand extends Command
	{
		
		[Inject]
		public var corporaService:ICorporaService;
		
		[Inject]
		public var event:UserRequestSaveCorpusEvent;
		
		override public function execute():void
		{
			var corpus:Corpus = event.corpus;
			if (corpus.vpdmfId == -1)	// Insert new corpus
			{
				corporaService.insertCorpus(event.corpus)
			}
			else
			{
				corporaService.updateCorpus(event.corpus)	
			}
		}
	}
}