package edu.isi.bmkeg.digitalLibrary.citations.view
{
	import edu.isi.bmkeg.digitalLibrary.citations.events.CitationsListSelectionChangedEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.model.CitationsListModel;
	import edu.isi.bmkeg.digitalLibrary.model.citations.ArticleCitation;
	import edu.isi.bmkeg.digitalLibrary.model.citations.Journal;
	
	import flash.events.Event;
	
	import mx.collections.ItemResponder;
	import mx.collections.errors.ItemPendingError;
	import mx.controls.Alert;
	import mx.events.CollectionEvent;
	import mx.managers.PopUpManager;
	import mx.utils.StringUtil;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ArticleCitationViewMediator extends Mediator
	{
		
		[Inject]
		public var view:ArticleCitationView;
		
		[Inject]
		public var citationsListModel:CitationsListModel;
		
		override public function onRegister():void
		{
			addContextListener(CitationsListSelectionChangedEvent.CHANGED,selectionChangedHandler);

			loadCurrentSelection();
		}
		
		private function selectionChangedHandler(event:CitationsListSelectionChangedEvent):void
		{
			loadCurrentSelection();
		}

		private function loadCurrentSelection():void
		{
			try
			{
				var a:ArticleCitation = citationsListModel.selectedCitation;
				if (a == null)
				{
					view.clearFormFields();
				}
				else
				{
					if (view.loadedArticle !== a)
					{
						view.loadArticleCitation(a);											
					}
				}
			}
			catch (e:ItemPendingError)
			{
				e.addResponder(new ItemResponder(itemPendingResult,null,citationsListModel.selectedIndex));
			}			
		}
		
		
		private function itemPendingResult(result:Object, token:Object = null):void
		{
			loadCurrentSelection();
			
//			if (citationsListModel.selectedIndex == int(token) &&
//				result is ArticleCitation)
//			{
//				view.loadArticleCitation(ArticleCitation(result));
//			}
		}
	}
}