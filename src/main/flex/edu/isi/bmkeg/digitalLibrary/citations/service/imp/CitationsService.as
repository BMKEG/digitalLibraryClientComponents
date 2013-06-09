package edu.isi.bmkeg.digitalLibrary.citations.service.imp
{

	import edu.isi.bmkeg.digitalLibrary.citations.events.ArticleCitationRetrievedEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.CitationsStorageChangedEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.JournalRetrievedEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.ServiceFailureEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.model.CitationsListModel;
	import edu.isi.bmkeg.digitalLibrary.citations.service.ICitationsService;
	import edu.isi.bmkeg.digitalLibrary.citations.service.serverinteraction.ICitationsServer;
	import edu.isi.bmkeg.digitalLibrary.model.citations.ArticleCitation;
	import edu.isi.bmkeg.digitalLibrary.model.citations.Journal;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AbstractService;
	import mx.rpc.AsyncResponder;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.robotlegs.mvcs.Actor;
	
	public class CitationsService extends Actor implements ICitationsService
	{
		private var _citationsServer:ICitationsServer;
		
//		private var _requestedListOffset:int;
//		private var _requestedListPageSize:int;
		
		[Inject]
		public var citationsListModel:CitationsListModel;
		
		[Inject]
		public function get citationsServer():ICitationsServer
		{
			return _citationsServer;
		}
		
		public function set citationsServer(s:ICitationsServer):void
		{
			_citationsServer = s;
			initServer();
		}
		
		public function retrieveJournalByAbbr(abbr:String):void
		{
			citationsServer.findJournalByAbbr.cancel();
			citationsServer.findJournalByAbbr.addEventListener(ResultEvent.RESULT,
				findJournalByAbbrResultHandler);

			citationsServer.findJournalByAbbr.send(abbr);			
		}

		public function insertArticle(article:ArticleCitation):void
		{
			citationsServer.insertArticleCitation.addEventListener(ResultEvent.RESULT,insertArticleResultHandler);
			citationsServer.insertArticleCitation.send(article);
		}
		
		public function updateArticle(article:ArticleCitation):void
		{
			citationsServer.updateArticleCitation.addEventListener(ResultEvent.RESULT,updateArticleResultHandler);
			citationsServer.updateArticleCitation.send(article);
		}
		
		public function retrieveArticle(bmkegId:int):void
		{
			citationsServer.findArticleByVpdmfId.cancel();
			citationsServer.findArticleByVpdmfId.addEventListener(ResultEvent.RESULT,retrieveArticleResultHandler);
			citationsServer.findArticleByVpdmfId.send(bmkegId);			
		}
			
		private function retrieveArticleResultHandler(event:ResultEvent):void
		{
			var article:ArticleCitation = ArticleCitation(event.result);
			dispatch(new ArticleCitationRetrievedEvent(article));
		}

		private function findJournalByAbbrResultHandler(event:ResultEvent):void
		{
			var journal:Journal = Journal(event.result);
			dispatch(new JournalRetrievedEvent(journal));
		}

		public function fetchAllArticlesCount():void
		{
			citationsServer.countArticles.cancel();
			citationsServer.countCorpusArticles.cancel();
			citationsServer.countArticles.addEventListener(ResultEvent.RESULT,countArticlesResultHandler);
			citationsServer.countArticles.send();			
		}
		
		public function fetchCorpusArticlesCount(corpusName:String):void
		{
			citationsServer.countArticles.cancel();
			citationsServer.countCorpusArticles.cancel();
			citationsServer.countCorpusArticles.addEventListener(ResultEvent.RESULT,countArticlesResultHandler);
			citationsServer.countCorpusArticles.send(corpusName);			
		}
		
		private function countArticlesResultHandler(event:ResultEvent):void
		{
			var cnt:int = int(event.result);
			citationsListModel.citationsListLength = cnt;
		}
		
		public function fetchAllArticles(offset:int, cnt:int):void
		{
	
			var token:AsyncToken = citationsServer.retrieveAllArticlesPaged.send(offset,cnt);
			var synRes:MyAsyncResponder = new MyAsyncResponder(
											fetchArticlesResultHandler,
											asyncResponderFailHandler,
											{citations:citationsListModel.citationsList, 
												offset:offset});

			token.addResponder(synRes);
			
		}

		public function fetchCorpusArticles(corpusName:String, offset:int, cnt:int):void
		{
			var token:AsyncToken = citationsServer.retrieveCorpusArticlesPaged.send(corpusName, offset,cnt);
			token.addResponder(new MyAsyncResponder(fetchArticlesResultHandler,asyncResponderFailHandler,
				{citations:citationsListModel.citationsList, offset:offset}));
			
		}
		
		internal function fetchArticlesResultHandler(result:Object, token:Object):void
		{
			if (! (result is ResultEvent))
			{
				trace("result argument to fetchArticlesResultHandler not ResultEvent");
				return;
			}

			var citations:IList = ResultEvent(result).result as IList;
			var originalModelCitationsList:IList = token.citations as IList;
			var offset:int = int(token.offset);
						
			// Only update citationsListModel if the citationsList at the time the request
			// was initiated is still current
			
			if (citations)
			{
				if (originalModelCitationsList === citationsListModel.citationsList)
				{
					citationsListModel.storeCitationsAt(offset, citations.toArray());				
				}				
			}
		}
		
		private function asyncResponderFailHandler(fail:Object, token:Object):void
		{
			faultHandler(fail as FaultEvent);
		}
		
		private function insertArticleResultHandler(event:ResultEvent):void
		{	
			dispatch(new CitationsStorageChangedEvent);
		}
		
		private function updateArticleResultHandler(event:ResultEvent):void
		{	
			dispatch(new CitationsStorageChangedEvent);
		}

		private function initServer():void
		{
			if (_citationsServer is AbstractService)
			{
				AbstractService(_citationsServer).addEventListener(FaultEvent.FAULT,faultHandler);
			}
		}
		
		private function faultHandler(event:FaultEvent):void
		{
			var failureEvent:ServiceFailureEvent = new ServiceFailureEvent(event);
			dispatch(failureEvent);
		}
	}
}