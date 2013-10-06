package edu.isi.bmkeg.digitalLibraryModule.view
{
	
	import edu.isi.bmkeg.digitalLibrary.events.*;
	import edu.isi.bmkeg.digitalLibrary.model.citations.*;
	import edu.isi.bmkeg.digitalLibrary.model.qo.citations.*;
	import edu.isi.bmkeg.digitalLibrary.rl.events.*;
	import edu.isi.bmkeg.digitalLibrary.rl.events.FindArticleCitationByIdEvent;
	import edu.isi.bmkeg.digitalLibraryModule.model.*;
	import edu.isi.bmkeg.digitalLibraryModule.view.forms.*;
	import edu.isi.bmkeg.pagedList.events.*;
	import edu.isi.bmkeg.pagedList.model.*;
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
	
	import mx.collections.ArrayCollection;
	import mx.managers.PopUpManager;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ArticleListMediator extends Mediator
	{
		[Inject]
		public var view:ArticleList;
		
		[Inject]
		public var listModel:DigitalLibraryPagedListModel;

		[Inject]
		public var model:DigitalLibraryModel;
		
		override public function onRegister():void
		{
			
			addContextListener(PagedListUpdatedEvent.UPDATED + DigitalLibraryPagedListModel.LIST_ID, 
				targetDocumentsListUpdatedHandler);
						
			//
			// SelectCorpus is an intermediate event thrown by the CorpusListPopup view.	
			//
			addContextListener(SelectCorpus.SELECT_CORPUS, 
				addArticlesToCorpus);

			addViewListener(RemoveArticleCitationFromCorpusEvent.REMOVE_ARTICLE_CITATION_FROM_CORPUS, 
				handleRemoveArticlesFromCorpus);

			addViewListener(FullyDeleteArticleEvent.FULLY_DELETE_ARTICLE, 
				dispatch);
			
			addViewListener(FindArticleCitationByIdEvent.FIND_ARTICLECITATION_BY_ID, 
				dispatch);

			addViewListener(UploadPdfFileEvent.UPLOAD_PDF_FILE, uploadPdfFileEventHandler);

			addViewListener(ActivateCorpusListPopupEvent.ACTIVATE_CORPUS_LIST_POPUP, 
				activateCorpusListPopup);

			listModel.pageSize = model.listPageSize;

			var qo:ArticleCitation_qo = new ArticleCitation_qo();
			var event:ListArticleCitationPagedEvent = new ListArticleCitationPagedEvent(qo,0,200);
			this.dispatch( event );
			
		}
		
		private function targetDocumentsListUpdatedHandler(event:PagedListUpdatedEvent):void
		{
			
			view.documentsList = listModel.pagedList;
			view.listLength = listModel.pagedListLength;
			
		}
		
		private function uploadPdfFileEventHandler(event:UploadPdfFileEvent):void
		{
			
			if( model.corpus != null ) {
				event.corpusName = model.corpus.name;
			}
			dispatch(event);
			
		}
		
		private function activateCorpusListPopup(e:ActivateCorpusListPopupEvent):void {
			
			var popup:CorpusListPopup = PopUpManager.createPopUp(this.view, CorpusListPopup, true) 
				as CorpusListPopup;
			PopUpManager.centerPopUp(popup);
			
			mediatorMap.createMediator( popup );
					
		}
		
		private function addArticlesToCorpus(event:SelectCorpus):void 
		{

			var selectedArticles:Vector.<Object> = view.targetDocumentListDataGrid.selectedItems;
			
			if( selectedArticles.length == 0 ) {
				return;
			}
			
			var ids:ArrayCollection = new ArrayCollection();
			for each( var a:Object in selectedArticles) {
				var n:Number = new Number(a.vpdmfId);
				ids.addItem( n );
			}

			dispatch(new AddArticleCitationToCorpusEvent(ids, event.corpusId));
			
		}
		
		private function handleRemoveArticlesFromCorpus(event:RemoveArticleCitationFromCorpusEvent):void 
		{
			
			var selectedArticles:Vector.<Object> = view.targetDocumentListDataGrid.selectedItems;
			
			if( selectedArticles == null || selectedArticles.length == 0 ) {
				return;
			}
			
			var ids:ArrayCollection = new ArrayCollection();
			for each( var a:Object in selectedArticles) {
				var n:Number = new Number(a.vpdmfId);
				ids.addItem( n );
			}
			
			event.articleIds = ids;
			event.corpusId = model.corpus.vpdmfId;
			
			dispatch( event );
			
		}
		
	}
	
}