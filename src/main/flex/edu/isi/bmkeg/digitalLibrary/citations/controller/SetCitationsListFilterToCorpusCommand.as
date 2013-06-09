package edu.isi.bmkeg.digitalLibrary.citations.controller
{	
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestCitationsListFilterChangeToCorpusEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.model.CitationsListFilterModel;
	
	import org.robotlegs.mvcs.Command;
	
	public class SetCitationsListFilterToCorpusCommand extends Command
	{
		
		[Inject]
		public var citationsListFilterModel:CitationsListFilterModel;
		
		[Inject]
		public var event:UserRequestCitationsListFilterChangeToCorpusEvent;
		
		override public function execute():void
		{
			citationsListFilterModel.setFilterToCorpus(event.corpusName);	
		}
	}
}