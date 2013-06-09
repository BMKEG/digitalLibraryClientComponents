package edu.isi.bmkeg.digitalLibrary.citations
{
	import edu.isi.bmkeg.digitalLibrary.citations.controller.FetchCitationsListLengthCommand;
	import edu.isi.bmkeg.digitalLibrary.citations.controller.FetchCitationsListPageCommand;
	import edu.isi.bmkeg.digitalLibrary.citations.controller.InitializeCitationsListCommand;
	import edu.isi.bmkeg.digitalLibrary.citations.controller.LoadCorporaCommand;
	import edu.isi.bmkeg.digitalLibrary.citations.controller.RetrieveArticleCitationCommand;
	import edu.isi.bmkeg.digitalLibrary.citations.controller.RetrieveCorpusCommand;
	import edu.isi.bmkeg.digitalLibrary.citations.controller.RetrieveJournalCommand;
	import edu.isi.bmkeg.digitalLibrary.citations.controller.SaveArticleCitationCommand;
	import edu.isi.bmkeg.digitalLibrary.citations.controller.SaveCorpusCommand;
	import edu.isi.bmkeg.digitalLibrary.citations.controller.SelectCitationCommand;
	import edu.isi.bmkeg.digitalLibrary.citations.controller.SetCitationsListFilterToAllCommand;
	import edu.isi.bmkeg.digitalLibrary.citations.controller.SetCitationsListFilterToCorpusCommand;
	import edu.isi.bmkeg.digitalLibrary.citations.events.CitationsListFilterChangedEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.CitationsListPageFaultEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.CitationsStorageChangedEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.LoadCorporaEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.ServiceFailureEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.UnknownCitationsListLengthEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestArticleEditorEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestCitationsListFilterChangeToAllEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestCitationsListFilterChangeToCorpusEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestCitationsListSelectionChangeEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestCorpusEditorEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestRetrieveArticleEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestRetrieveCorpusEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestRetrieveJournalEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestSaveArticleEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestSaveCorpusEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.model.CitationsListFilterModel;
	import edu.isi.bmkeg.digitalLibrary.citations.model.CitationsListModel;
	import edu.isi.bmkeg.digitalLibrary.citations.model.CorporaModel;
	import edu.isi.bmkeg.digitalLibrary.citations.service.ICitationsService;
	import edu.isi.bmkeg.digitalLibrary.citations.service.ICorporaService;
	import edu.isi.bmkeg.digitalLibrary.citations.service.imp.CitationsService;
	import edu.isi.bmkeg.digitalLibrary.citations.service.imp.CorporaService;
	import edu.isi.bmkeg.digitalLibrary.citations.service.serverinteraction.ICitationsServer;
	import edu.isi.bmkeg.digitalLibrary.citations.service.serverinteraction.imp.CitationsServerImp;
	import edu.isi.bmkeg.digitalLibrary.citations.view.ActionControlCitationListItemRenderer;
	import edu.isi.bmkeg.digitalLibrary.citations.view.ActionControlCitationListItemRendererMediator;
	import edu.isi.bmkeg.digitalLibrary.citations.view.ArticleCitationEditorPopupAnchorView;
	import edu.isi.bmkeg.digitalLibrary.citations.view.ArticleCitationEditorPopupAnchorViewMediator;
	import edu.isi.bmkeg.digitalLibrary.citations.view.ArticleCitationEditorView;
	import edu.isi.bmkeg.digitalLibrary.citations.view.ArticleCitationEditorViewMediator;
	import edu.isi.bmkeg.digitalLibrary.citations.view.ArticleCitationView;
	import edu.isi.bmkeg.digitalLibrary.citations.view.ArticleCitationViewMediator;
	import edu.isi.bmkeg.digitalLibrary.citations.view.CitationsListFilterView;
	import edu.isi.bmkeg.digitalLibrary.citations.view.CitationsListFilterViewMediator;
	import edu.isi.bmkeg.digitalLibrary.citations.view.CitationsListView;
	import edu.isi.bmkeg.digitalLibrary.citations.view.CitationsListViewMediator;
	import edu.isi.bmkeg.digitalLibrary.citations.view.CorporaView;
	import edu.isi.bmkeg.digitalLibrary.citations.view.CorporaViewMediator;
	import edu.isi.bmkeg.digitalLibrary.citations.view.CorpusEditorPopupAnchorView;
	import edu.isi.bmkeg.digitalLibrary.citations.view.CorpusEditorPopupAnchorViewMediator;
	import edu.isi.bmkeg.digitalLibrary.citations.view.CorpusEditorView;
	import edu.isi.bmkeg.digitalLibrary.citations.view.CorpusEditorViewMediator;
	
	import org.robotlegs.core.ICommandMap;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.core.IMediatorMap;
	import org.robotlegs.core.IViewMap;
	import org.robotlegs.mvcs.Context;

	/**
	 * sets mapping used by the DigitalLibrary components
	 */
	public class DigitalLibraryAppContextHelper
	{
		public function DigitalLibraryAppContextHelper()
		{
		}
		
		public static function mapContext(injector:IInjector, mediatorMap:IMediatorMap, commandMap:ICommandMap, viewMap:IViewMap ):void{
			
			injector.mapSingleton(CitationsListFilterModel);
			injector.mapSingleton(CorporaModel);
			injector.mapSingleton(CitationsListModel);
			injector.mapSingletonOf(ICorporaService,CorporaService);
			injector.mapSingletonOf(ICitationsService,CitationsService);
			
			mediatorMap.mapView(CorporaView,CorporaViewMediator);
			mediatorMap.mapView(CitationsListFilterView,CitationsListFilterViewMediator);
			mediatorMap.mapView(CorpusEditorPopupAnchorView,CorpusEditorPopupAnchorViewMediator);
			mediatorMap.mapView(ArticleCitationEditorPopupAnchorView,ArticleCitationEditorPopupAnchorViewMediator);
			mediatorMap.mapView(ActionControlCitationListItemRenderer,ActionControlCitationListItemRendererMediator);
			mediatorMap.mapView(CitationsListView, CitationsListViewMediator);
			mediatorMap.mapView(ArticleCitationView, ArticleCitationViewMediator);
			
			// mediator Mappings for PopUp Views (mediator needs to be manually created/destroyed)
			mediatorMap.mapView(CorpusEditorView, CorpusEditorViewMediator,null,false,false);
			mediatorMap.mapView(ArticleCitationEditorView, ArticleCitationEditorViewMediator,null,false,false);
			
			commandMap.mapEvent(LoadCorporaEvent.LOAD,LoadCorporaCommand);
			commandMap.mapEvent(UnknownCitationsListLengthEvent.UNKNOWN,FetchCitationsListLengthCommand);
			commandMap.mapEvent(CitationsListPageFaultEvent.FAULT, FetchCitationsListPageCommand);
			commandMap.mapEvent(UserRequestSaveArticleEvent.SAVE,SaveArticleCitationCommand);
			commandMap.mapEvent(UserRequestSaveCorpusEvent.SAVE,SaveCorpusCommand);
			commandMap.mapEvent(UserRequestRetrieveCorpusEvent.RETRIEVE,RetrieveCorpusCommand);
			commandMap.mapEvent(UserRequestRetrieveArticleEvent.RETRIEVE,RetrieveArticleCitationCommand);
			commandMap.mapEvent(UserRequestRetrieveJournalEvent.RETRIEVE,RetrieveJournalCommand);
			commandMap.mapEvent(UserRequestCitationsListSelectionChangeEvent.CHANGE,SelectCitationCommand);
			commandMap.mapEvent(UserRequestCitationsListFilterChangeToAllEvent.CHANGE,SetCitationsListFilterToAllCommand);
			commandMap.mapEvent(UserRequestCitationsListFilterChangeToCorpusEvent.CHANGE,SetCitationsListFilterToCorpusCommand);
			commandMap.mapEvent(CitationsListFilterChangedEvent.CHANGED,InitializeCitationsListCommand);
			commandMap.mapEvent(CitationsStorageChangedEvent.CHANGED,InitializeCitationsListCommand);

		}

	}
}