package edu.isi.bmkeg.digitalLibrary.citations.service.imp
{
	import edu.isi.bmkeg.digitalLibrary.citations.events.CorpusRetrievedEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.ServiceFailureEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.model.CorporaModel;
	import edu.isi.bmkeg.digitalLibrary.citations.service.ICorporaService;
	import edu.isi.bmkeg.digitalLibrary.citations.service.serverinteraction.ICitationsServer;
	import edu.isi.bmkeg.digitalLibrary.model.citations.Corpus;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AbstractService;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.robotlegs.mvcs.Actor;
	
	public class CorporaService extends Actor implements ICorporaService
	{
		private var _citationsServer:ICitationsServer;
		
		private static const CORPORA_PAGE_SIZE:int = 999;
		
		[Inject]
		public var corporaModel:CorporaModel;
		
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
		
		public function loadCorpora():void
		{
			citationsServer.listAllCorporaPaged.cancel();
			citationsServer.listAllCorporaPaged.addEventListener(ResultEvent.RESULT,
				loadCorporaResultHandler);
			
			// I'm asuming that the number of corpora will not excede CORPORA_MAX_SIZE.
			// If there are more than CORPORA_MAX_SIZE corpora the exceding corpora
			// will be ignored.
			// This is a reasonable simplifying assumption. The safest behavior should be
			// to handle paging of corpora.
			citationsServer.listAllCorporaPaged.send(0,CORPORA_PAGE_SIZE);
				
		}
	
		public function insertCorpus(corpus:Corpus):void
		{
			citationsServer.insertCorpus.addEventListener(ResultEvent.RESULT,insertCorpusResultHandler);
			citationsServer.insertCorpus.send(corpus);
		}
		
		public function updateCorpus(corpus:Corpus):void
		{
			citationsServer.updateCorpus.addEventListener(ResultEvent.RESULT,updateCorpusResultHandler);
			citationsServer.updateCorpus.send(corpus);
		}

		public function retrieveCorpus(corpusId:int):void
		{
			citationsServer.findCorpusById.cancel();
			citationsServer.findCorpusById.addEventListener(ResultEvent.RESULT,retrieveCorpusResultHandler);
			citationsServer.findCorpusById.send(corpusId);			
		}
		
		private function retrieveCorpusResultHandler(event:ResultEvent):void
		{
			var corpus:Corpus = Corpus(event.result);
			dispatch(new CorpusRetrievedEvent(corpus));
		}
		
		private function insertCorpusResultHandler(event:ResultEvent):void
		{	
			loadCorpora();
		}

		private function updateCorpusResultHandler(event:ResultEvent):void
		{	
			loadCorpora();
		}

		private function loadCorporaResultHandler(event:ResultEvent):void
		{
			var corpora:ArrayCollection  = ArrayCollection(event.result);
			corporaModel.loadCorpora(corpora);
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