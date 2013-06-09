package edu.isi.bmkeg.digitalLibrary.citations.controller
{
	
	import edu.isi.bmkeg.digitalLibrary.citations.events.CitationsListPageFaultEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.model.CitationsListFilterModel;
	import edu.isi.bmkeg.digitalLibrary.citations.service.ICitationsService;
	
	import org.robotlegs.mvcs.Command;
	
	public class FetchCitationsListPageCommand extends Command
	{
		[Inject]
		public var event:CitationsListPageFaultEvent;
		
		[Inject]
		public var citationsService:ICitationsService;
		
		[Inject]
		public var model:CitationsListFilterModel;
		
		override public function execute():void
		{
			if (model.filterCriteria == CitationsListFilterModel.FILTER_CRITERIA_CORPUS)
			{
				citationsService.fetchCorpusArticles(model.corpusName, event.offset,event.count);
			}
			else
			{
				citationsService.fetchAllArticles(event.offset,event.count);
			}

		}
	}
}