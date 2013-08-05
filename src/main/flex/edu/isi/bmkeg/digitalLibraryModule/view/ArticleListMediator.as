package edu.isi.bmkeg.digitalLibraryModule.view
{
	
	import edu.isi.bmkeg.digitalLibrary.events.*;
	import edu.isi.bmkeg.digitalLibrary.model.citations.*;
	import edu.isi.bmkeg.digitalLibrary.model.qo.citations.*;
	import edu.isi.bmkeg.digitalLibrary.rl.events.*;
	import edu.isi.bmkeg.digitalLibrary.rl.events.FindArticleCitationDocumentByIdEvent;
	import edu.isi.bmkeg.digitalLibraryModule.model.*;
	import edu.isi.bmkeg.pagedList.events.*;
	import edu.isi.bmkeg.pagedList.model.*;
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
	
	import mx.collections.ArrayCollection;
	
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
						
			addViewListener(FindArticleCitationDocumentByIdEvent.FIND_ARTICLECITATIONDOCUMENT_BY_ID, 
				dispatch);

			addViewListener(UploadPdfFileEvent.UPLOAD_PDF_FILE, uploadPdfFileEventHandler);

			
			listModel.pageSize = model.listPageSize;
		
			// If we already have a targetCorpus specified, then run this. 
			if( model.corpus != null ) {
				
				view.documentsList = listModel.pagedList;
				view.listLength = listModel.pagedListLength;
				
			}
			
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
		
		
	}
	
}