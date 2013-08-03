package edu.isi.bmkeg.digitalLibraryModule.view
{

	import edu.isi.bmkeg.digitalLibrary.model.citations.*;
	import edu.isi.bmkeg.digitalLibrary.rl.events.*;
	import edu.isi.bmkeg.pagedList.*;
	import edu.isi.bmkeg.pagedList.model.*;
	import edu.isi.bmkeg.digitalLibrary.model.citations.*;
	import edu.isi.bmkeg.digitalLibrary.model.qo.citations.*;
	import edu.isi.bmkeg.digitalLibrary.rl.events.*;
	import edu.isi.bmkeg.digitalLibraryModule.model.*;
	import edu.isi.bmkeg.digitalLibraryModule.events.*;
	
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
		public var model:DigitalLibraryModel;

		override public function onRegister():void {
			
			addContextListener(FindArticleCitationDocumentByIdResultEvent.FIND_ARTICLECITATIONDOCUMENTBY_ID_RESULT, 
				findArticleCitationDocumentByIdResultHandler);

			addContextListener(ListArticleCitationDocumentPagedEvent.LIST_ARTICLECITATIONDOCUMENT_PAGED, 
				ListArticleCitationDocumentPagedHandler);
			
			loadCurrentSelection();
		}
		
	
		private function ListArticleCitationDocumentPagedHandler(event:ListArticleCitationDocumentPagedEvent):void {
			
			loadCurrentSelection();
			
		}

		private function findArticleCitationDocumentByIdResultHandler(event:FindArticleCitationDocumentByIdResultEvent):void {
			
			loadCurrentSelection();
			
		}
		
		private function loadCurrentSelection():void {
			
			try {
				
				var a:LiteratureCitation = model.currentCitation;
				
				if (a == null) {

					view.clearFormFields();

				} else {
										
					if (view.loadedArticle !== a) {
						view.loadLiteratureCitation(a);											
					}
				}
			
			} catch (e:ItemPendingError) {

				e.addResponder(new ItemResponder(itemPendingResult, null));
			
			}			
		
		}

		private function itemPendingResult(result:Object, token:Object = null):void {

			loadCurrentSelection();
			
//			if (citationsListModel.selectedIndex == int(token) &&
//				result is ArticleCitation)
//			{
//				view.loadArticleCitation(ArticleCitation(result));
//			}
		}
		
		// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		// Reset everything
		//
		public function clearTriageCorpusHandler(event:ClearCorpusEvent):void {
			
			view.clearFormFields();
			
		}

		//
		// This function is called directly from within from within
		//
		private function requestFetchObjects(list:PagedList, index:int, count:int):void 
		{
			var qo:ArticleCitation_qo = model.queryLiteratureCitation;
						
			dispatch(new ListArticleCitationDocumentPagedEvent(qo, index, list.pageSize));
			
		}
		
	}

}