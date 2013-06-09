package edu.isi.bmkeg.digitalLibrary.citations.view
{
	import edu.isi.bmkeg.digitalLibrary.citations.events.CitationsListFilterChangedEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.CorporaUpdatedEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestCitationsListFilterChangeToAllEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestCitationsListFilterChangeToCorpusEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestCorpusEditorEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.model.CitationsListFilterModel;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class CitationsListFilterViewMediator extends Mediator
	{
		[Inject]
		public var view:CitationsListFilterView;
		
		[Inject]
		public var citationsListFilterModel:CitationsListFilterModel;
		
		override public function onRegister():void
		{
			addContextListener(CitationsListFilterChangedEvent.CHANGED, filterChangedHandler);
			
			addViewListener(UserRequestCitationsListFilterChangeToAllEvent.CHANGE,dispatch);
			addViewListener(UserRequestCitationsListFilterChangeToCorpusEvent.CHANGE,dispatch);
			
			updateView();
		}
		
		private function filterChangedHandler(event:CitationsListFilterChangedEvent):void
		{
			updateView();
		}
		
		private function updateView():void
		{
			if (citationsListFilterModel.filterCriteria == 
				CitationsListFilterModel.FILTER_CRITERIA_CORPUS)
			{
				view.setSelectionToCorpus(citationsListFilterModel.corpusName);
			}
			else
			{
				view.setSelectionToAll();
			}
		}

	}
}