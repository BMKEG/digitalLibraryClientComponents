package edu.isi.bmkeg.digitalLibrary.citations.view
{
	
	import edu.isi.bmkeg.digitalLibrary.citations.events.CitationsListSelectionChangedEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.CitationsListUpdatedEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestCitationsListSelectionChangeEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.model.CitationsListModel;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class CitationsListViewMediator extends Mediator
	{
		[Inject]
		public var view:CitationsListView;
		
		[Inject]
		public var citationsListModel:CitationsListModel;
		
		override public function onRegister():void
		{
			addContextListener(CitationsListUpdatedEvent.UPDATED, citationsListUpdatedHandler);
			addContextListener(CitationsListSelectionChangedEvent.CHANGED, citationsListSelectionChangedHandler);
			
			addViewListener(UserRequestCitationsListSelectionChangeEvent.CHANGE, dispatch);
			
			view.citationsList = citationsListModel.citationsList;
		}
		
		private function citationsListUpdatedHandler(event:CitationsListUpdatedEvent):void
		{
			view.citationsList = citationsListModel.citationsList;
		}

		private function citationsListSelectionChangedHandler(event:CitationsListSelectionChangedEvent):void
		{
			if (event.selectedIndex != view.selectedIndex)
			{
				if (event.selectedIndex == -1)
				{
					view.clearSelection();
				}
				else
				{
					view.selectedIndex = event.selectedIndex;				
				}				
			}
		}
	}
}