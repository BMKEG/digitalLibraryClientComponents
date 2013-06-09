package edu.isi.bmkeg.digitalLibrary.citations.service.serverinteraction.imp
{
	
	import edu.isi.bmkeg.digitalLibrary.citations.service.serverinteraction.ICitationsServer;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AbstractOperation;
	import mx.rpc.AbstractService;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	/**
	 * Uility methods for accessing the ArticlesService through Remoting.
	 */
	public class CitationsServerImp
		extends RemoteObject
		implements edu.isi.bmkeg.digitalLibrary.citations.service.serverinteraction.ICitationsServer
	{
		
		private static const CITATIONS_SERVICES_DEST:String = "citationsServiceImpl";

		public function CitationsServerImp()
		{
			destination = 	CITATIONS_SERVICES_DEST; 
			endpoint = Utils.getRemotingEndpoint();
			showBusyCursor = true;
		}

		public function get listAllCorporaPaged():AbstractOperation
		{
			return getOperation("listAllCorporaPaged");
		}

		public function get countArticles():AbstractOperation
		{
			return getOperation("countArticles");
		}
		
		public function get countCorpusArticles():AbstractOperation
		{
			return getOperation("countCorpusArticles");
		}
		
		public function get insertCorpus():AbstractOperation
		{
			return getOperation("insertCorpus");
		}
		
		public function get updateCorpus():AbstractOperation
		{
			return getOperation("updateCorpus");
		}
		
		public function get findCorpusById():AbstractOperation
		{
			return getOperation("findCorpusById");
		}

		public function get retrieveAllArticlesPaged():AbstractOperation
		{
			return getOperation("retrieveAllArticlesPaged");
		}

		public function get retrieveCorpusArticlesPaged():AbstractOperation
		{
			return getOperation("retrieveCorpusArticlesPaged");
		}
		
		public function get findJournalByAbbr():AbstractOperation
		{
			return getOperation("findJournalByAbbr");
		}

		public function get insertArticleCitation():AbstractOperation
		{
			return getOperation("insertArticleCitation");
		}
		
		public function get updateArticleCitation():AbstractOperation
		{
			return getOperation("updateArticleCitation");
		}

		public function get findArticleByVpdmfId():AbstractOperation
		{
			return getOperation("findArticleByVpdmfId");
		}
	}
}