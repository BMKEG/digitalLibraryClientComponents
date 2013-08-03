package edu.isi.bmkeg.digitalLibraryModule
{
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
	
	import edu.isi.bmkeg.digitalLibraryModule.controller.*;
	import edu.isi.bmkeg.digitalLibraryModule.events.*;
	import edu.isi.bmkeg.digitalLibraryModule.model.*;
	import edu.isi.bmkeg.digitalLibraryModule.view.*;
	
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
			
			injector.mapSingleton(DigitalLibraryModel);
			injector.mapSingleton(DigitalLibraryPagedListModel);
			
			injector.mapSingletonOf(IDigitalLibraryService, DigitalLibraryServiceImpl);
			injector.mapSingletonOf(IDigitalLibraryServer, DigitalLibraryServerImpl);
			injector.mapSingletonOf(IFtdServer, FtdServerImpl);
			injector.mapSingletonOf(IFtdService, FtdServiceImpl);
			
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
			commandMap.mapEvent(ListArticleCitationDocumentPagedEvent.LIST_ARTICLECITATIONDOCUMENT_PAGED, ListArticleCitationDocumentPagedCommand);
			commandMap.mapEvent(ListArticleCitationDocumentPagedResultEvent.LIST_ARTICLECITATIONDOCUMENT_PAGED_RESULT, ListArticleCitationDocumentPagedResultCommand);
			commandMap.mapEvent(CountArticleCitationDocumentResultEvent.COUNT_ARTICLECITATIONDOCUMENT_RESULT, CountArticleCitationDocumentResultCommand);
			commandMap.mapEvent(PagedListRetrievePageEvent.PAGEDLIST_RETRIEVE_PAGE
					+ DigitalLibraryPagedListModel.LIST_ID, 
					DigitalLibraryPagedListRetrievePageCommand);
			commandMap.mapEvent(CountPagedListLengthEvent.COUNT_PAGED_LIST_LENGTH
					+DigitalLibraryPagedListModel.LIST_ID, 
					CountArticleCitationDocumentPagedListCommand);

			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// Change selection of the targetArticleCitation List control
			// Run a query for the Document. 
			commandMap.mapEvent(
					FindArticleCitationDocumentByIdEvent.FIND_ARTICLECITATIONDOCUMENT_BY_ID, 
					FindArticleCitationDocumentByIdCommand);
			commandMap.mapEvent(
					FindArticleCitationDocumentByIdResultEvent.FIND_ARTICLECITATIONDOCUMENTBY_ID_RESULT, 
					FindArticleCitationDocumentByIdResultCommand);
						
			commandMap.mapEvent(ClearCorpusEvent.CLEAR_CORPUS, ClearCorpusCommand);

		}
		
		override public function dispose():void
		{
			mediatorMap.removeMediatorByView(contextView);
			super.dispose();
		}
		
	}
	
}