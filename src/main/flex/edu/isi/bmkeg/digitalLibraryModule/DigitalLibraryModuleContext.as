package edu.isi.bmkeg.digitalLibraryModule
{
	import edu.isi.bmkeg.terminology.rl.events.*;
	import edu.isi.bmkeg.terminology.rl.services.ITerminologyService;
	import edu.isi.bmkeg.terminology.rl.services.impl.TerminologyServiceImpl;
	import edu.isi.bmkeg.terminology.rl.services.serverInteraction.ITerminologyServer;
	import edu.isi.bmkeg.terminology.rl.services.serverInteraction.impl.TerminologyServerImpl;
	
	import edu.isi.bmkeg.ftd.rl.events.*;
	import edu.isi.bmkeg.ftd.rl.services.IFtdService;
	import edu.isi.bmkeg.ftd.rl.services.impl.FtdServiceImpl;
	import edu.isi.bmkeg.ftd.rl.services.serverInteraction.IFtdServer;
	import edu.isi.bmkeg.ftd.rl.services.serverInteraction.impl.FtdServerImpl;
	
	import edu.isi.bmkeg.digitalLibrary.rl.events.*;
	import edu.isi.bmkeg.digitalLibrary.rl.services.IDigitalLibraryService;
	import edu.isi.bmkeg.digitalLibrary.rl.services.impl.DigitalLibraryServiceImpl;
	import edu.isi.bmkeg.digitalLibrary.rl.services.serverInteraction.IDigitalLibraryServer;
	import edu.isi.bmkeg.digitalLibrary.rl.services.serverInteraction.impl.DigitalLibraryServerImpl;
	
	import edu.isi.bmkeg.digitalLibrary.events.*;
	import edu.isi.bmkeg.digitalLibrary.services.*;
	import edu.isi.bmkeg.digitalLibrary.services.impl.*;
	import edu.isi.bmkeg.digitalLibrary.services.serverInteraction.*;
	import edu.isi.bmkeg.digitalLibrary.services.serverInteraction.impl.*;
	
	import edu.isi.bmkeg.digitalLibraryModule.controller.*;
	import edu.isi.bmkeg.digitalLibraryModule.events.*;
	import edu.isi.bmkeg.digitalLibraryModule.model.*;
	import edu.isi.bmkeg.digitalLibraryModule.view.*;
	import edu.isi.bmkeg.digitalLibraryModule.view.forms.*;
	
	import edu.isi.bmkeg.pagedList.model.*;
	import edu.isi.bmkeg.pagedList.events.*;
		 	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;

	public class DigitalLibraryModuleContext extends ModuleContext
	{

		public function DigitalLibraryModuleContext(contextView:DisplayObjectContainer,
													injector:IInjector)
		{
			super(contextView, true, injector);
		}
		
		override public function startup():void
		{		
			
			mediatorMap.mapView(CorpusControl, CorpusControlMediator);
			mediatorMap.mapView(ArticleList, ArticleListMediator);
			mediatorMap.mapView(ArticleCitationView, ArticleCitationViewMediator);
			mediatorMap.mapView(FragmenterView, FragmenterViewMediator);
			
			// Need a bit of extra detail to deal with popups
			mediatorMap.mapView(CorpusPopup, CorpusPopupMediator, null, false, false);
			mediatorMap.mapView(CorpusListPopup, CorpusListPopupMediator, null, false, false);
			
			injector.mapSingleton(DigitalLibraryModel);
			injector.mapSingleton(DigitalLibraryPagedListModel);
			
			injector.mapSingletonOf(IDigitalLibraryService, DigitalLibraryServiceImpl);
			injector.mapSingletonOf(IDigitalLibraryServer, DigitalLibraryServerImpl);
			injector.mapSingletonOf(IExtendedDigitalLibraryService, ExtendedDigitalLibraryServiceImpl);
			injector.mapSingletonOf(IExtendedDigitalLibraryServer, ExtendedDigitalLibraryServerImpl);
			injector.mapSingletonOf(IFtdServer, FtdServerImpl);
			injector.mapSingletonOf(IFtdService, FtdServiceImpl);
			injector.mapSingletonOf(ITerminologyServer, TerminologyServerImpl);
			injector.mapSingletonOf(ITerminologyService, TerminologyServiceImpl);
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// list the corpora on the server
			commandMap.mapEvent(ListCorpusEvent.LIST_CORPUS, ListCorpusCommand);
			commandMap.mapEvent(ListCorpusResultEvent.LIST_CORPUS_RESULT, ListCorpusResultCommand);

			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// load the target corpus
			commandMap.mapEvent(FindCorpusByIdEvent.FIND_CORPUS_BY_ID, FindCorpusByIdCommand);
			commandMap.mapEvent(FindCorpusByIdResultEvent.FIND_CORPUSBY_ID_RESULT, FindCorpusByIdResultCommand);
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// Run a paged list query for articles in the target corpus
			commandMap.mapEvent(ListArticleCitationPagedEvent.LIST_ARTICLECITATION_PAGED, ListArticleCitationPagedCommand);
			commandMap.mapEvent(ListArticleCitationPagedResultEvent.LIST_ARTICLECITATION_PAGED_RESULT, ListArticleCitationPagedResultCommand);
			commandMap.mapEvent(CountArticleCitationResultEvent.COUNT_ARTICLECITATION_RESULT, CountArticleCitationResultCommand);
			commandMap.mapEvent(PagedListRetrievePageEvent.PAGEDLIST_RETRIEVE_PAGE
					+ DigitalLibraryPagedListModel.LIST_ID, 
					DigitalLibraryPagedListRetrievePageCommand);
			commandMap.mapEvent(CountPagedListLengthEvent.COUNT_PAGED_LIST_LENGTH
					+DigitalLibraryPagedListModel.LIST_ID, 
					CountArticleCitationPagedListCommand);

			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// Change selection of the targetArticleCitation List control
			// Run a query for the Document. 
			commandMap.mapEvent(FindArticleCitationByIdEvent.FIND_ARTICLECITATION_BY_ID, 
					FindArticleCitationByIdCommand);
			commandMap.mapEvent(FindArticleCitationByIdResultEvent.FIND_ARTICLECITATIONBY_ID_RESULT, 
					FindArticleCitationByIdResultCommand);

			commandMap.mapEvent(UploadPdfFileEvent.UPLOAD_PDF_FILE, 
					UploadPdfFileCommand);
			commandMap.mapEvent(UploadPdfFileResultEvent.UPLOAD_PDF_FILE_RESULT, 
					UploadPdfFileResultCommand);
			
			commandMap.mapEvent(InsertCorpusEvent.INSERT_CORPUS, InsertCorpusCommand);
			commandMap.mapEvent(InsertCorpusResultEvent.INSERT_CORPUS_RESULT, 
					InsertCorpusResultCommand);
			
			commandMap.mapEvent(UpdateCorpusEvent.UPDATE_CORPUS, UpdateCorpusCommand);
			commandMap.mapEvent(UpdateCorpusResultEvent.UPDATE_CORPUS_RESULT, 
					UpdateCorpusResultCommand);
								
			commandMap.mapEvent(DeleteCorpusByIdEvent.DELETE_CORPUS_BY_ID, 
				DeleteCorpusByIdCommand);
			commandMap.mapEvent(DeleteCorpusByIdResultEvent.DELETE_CORPUS_BY_ID_RESULT, 
				DeleteCorpusByIdResultCommand);
			
			commandMap.mapEvent(ClearCorpusEvent.CLEAR_CORPUS, ClearCorpusCommand);
			commandMap.mapEvent(LoadingPdfSwfCompleteEvent.LOADING_PDF_SWF_COMPLETE, 
				LoadingPdfSwfCompleteCommand);
			
			commandMap.mapEvent(AddArticleCitationToCorpusEvent.ADD_ARTICLE_CITATION_TO_CORPUS, 
				AddArticleCitationToCorpusCommand);
			
			commandMap.mapEvent(RemoveArticleCitationFromCorpusEvent.REMOVE_ARTICLE_CITATION_FROM_CORPUS, 
				RemoveArticleCitationFromCorpusCommand);
			
			commandMap.mapEvent(FullyDeleteArticleEvent.FULLY_DELETE_ARTICLE, 
				FullyDeleteArticleCommand);
			
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// Fragment based functions. 
			commandMap.mapEvent(ListArticleDocumentEvent.LIST_ARTICLEDOCUMENT, ListArticleDocumentCommand);
			commandMap.mapEvent(ListArticleDocumentResultEvent.LIST_ARTICLEDOCUMENT_RESULT, ListArticleDocumentResultCommand);

			commandMap.mapEvent(InsertFTDFragmentEvent.INSERT_FTDFRAGMENT, 
					InsertFTDFragmentCommand);
			commandMap.mapEvent(InsertFTDFragmentResultEvent.INSERT_FTDFRAGMENT_RESULT, 
				InsertFTDFragmentResultCommand);

			commandMap.mapEvent(ListFTDFragmentEvent.LIST_FTDFRAGMENT, 
				ListFTDFragmentCommand);
			commandMap.mapEvent(ListFTDFragmentResultEvent.LIST_FTDFRAGMENT_RESULT, 
				ListFTDFragmentResultCommand);

			commandMap.mapEvent(RemoveAnnotationEvent.REMOVE_ANNOTATION, 
				RemoveAnnotationCommand);
			commandMap.mapEvent(RemoveAnnotationResultEvent.REMOVE_ANNOTATION_RESULT, 
				RemoveAnnotationResultCommand);

			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// Term-based functions. 
			commandMap.mapEvent(ListTermViewsEvent.LIST_TERM_VIEWS, ListTermViewsCommand);
			commandMap.mapEvent(ListTermViewsResultEvent.LIST_TERM_VIEWS_RESULT, ListTermViewsResultCommand);
			
		}
		
		override public function dispose():void
		{
			mediatorMap.removeMediatorByView(contextView);
			super.dispose();
		}
		
	}
	
}