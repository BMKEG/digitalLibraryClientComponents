package edu.isi.bmkeg.digitalLibrary.citations.service.serverinteraction.imp
{
	import edu.isi.bmkeg.digitalLibrary.citations.service.serverinteraction.ICitationsServer;
	import edu.isi.bmkeg.digitalLibrary.citations.testutils.TUtils;
	import edu.isi.bmkeg.digitalLibrary.model.citations.ArticleCitation;
	import edu.isi.bmkeg.digitalLibrary.model.citations.Corpus;
	import edu.isi.bmkeg.digitalLibrary.model.citations.Journal;
	import edu.isi.bmkeg.vpdmf.model.dao.LightViewInstance;
	
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AbstractOperation;
	import mx.rpc.AbstractService;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	
	public class DummyCitationsServerImp
		extends AbstractService
		implements ICitationsServer
	{
		
		public static const EVENT_DELAY:int = 1000;
		
		private static var _corpora:ArrayCollection;		
		private static var _articles:ArrayCollection;		
		private static var _journals:ArrayCollection;		
//		private static var _corporaArticles:Object;		
		
		public var callHandlerDirectly:Boolean;
		
		/**
		 * Records invoked operations. Used in unit testing.
		 */
		public var invokedOperations:Array;
		
		private static var _nextvpdmfId:int = 100;
		
		public function DummyCitationsServerImp(callHandlerDirectly:Boolean = false) 
		{
			// Create corpora
			if (_corpora == null) {
				_corpora = new ArrayCollection();
				_corpora.addItem(TUtils.createDummyCorpus1());
				_corpora.addItem(TUtils.createDummyCorpus2());
			}
			
			// Create Citations
			if (_articles == null) {
				_articles = new ArrayCollection();
				_articles.addItem(TUtils.createDummyArticle2());
				_articles.addItem(TUtils.createDummyArticle1());				
				_articles.addItem(TUtils.createDummyArticle3());				
				_articles.addItem(TUtils.createDummyArticle4());				
			}

			// Create Journals
			if (_journals == null) {
				_journals = new ArrayCollection();
				
				for each (var a:ArticleCitation in _articles)
				{
					var j:Journal = a.journal;
					if (findJournalByIdF(j.vpdmfId) == null)
					{
						_journals.addItem(j);
					}
				}
			}			
			
			
//			// Add articles to Corpora
			ArticleCitation(_articles[0]).corpora.addItem(_corpora[0]);
			ArticleCitation(_articles[1]).corpora.addItem(_corpora[1]);
			ArticleCitation(_articles[2]).corpora.addItem(_corpora[0]);
			ArticleCitation(_articles[3]).corpora.addItem(_corpora[0]);

			this.callHandlerDirectly = callHandlerDirectly;
			
			invokedOperations = new Array();
		}
		
		private var _retrieveAllArticlesPagedOp:DummyOperation;
		private var _retrieveCorpusArticlesPagedOp:DummyOperation;
		private var _countArticlesOp:DummyOperation;
		private var _countCorpusArticlesOp:DummyOperation;
		private var _getCorporaOp:DummyOperation;
		private var _getArticlesOfCorpusPagedOp:DummyOperation;
		private var _createCorpusOp:DummyOperation;
		private var _addPublicationSetToCorpusOp:DummyOperation;
		private var _findCorpusByIdOp:DummyOperation;
		private var _findJournalByAbbrOp:DummyOperation;
		private var _updateCorpusOp:DummyOperation;
		private var _insertArticleCitationOp:DummyOperation;
		private var _updateArticleCitationOp:DummyOperation;
		private var _findArticleByVpdmfIdOp:DummyOperation;
		
		
		public function get findArticleByVpdmfId():AbstractOperation
		{
			if (_findArticleByVpdmfIdOp == null) 
			{
				_findArticleByVpdmfIdOp = new DummyOperation(this,"findArticleByVpdmfId",callHandlerDirectly);
				_findArticleByVpdmfIdOp.createResultFunction = findArticleByVpdmfIdCreateResult;
			}
			return _findArticleByVpdmfIdOp;
		}
		
		public function get insertArticleCitation():AbstractOperation
		{
			if (_insertArticleCitationOp == null) 
			{
				_insertArticleCitationOp = new DummyOperation(this,"insertArticleCitation",callHandlerDirectly);
				_insertArticleCitationOp.createResultFunction = insertArticleCreateResult;
			}
			return _insertArticleCitationOp;
		}
		
		public function get updateArticleCitation():AbstractOperation
		{
			if (_updateArticleCitationOp == null) 
			{
				_updateArticleCitationOp = new DummyOperation(this,"updateArticleCitation",callHandlerDirectly);
				_updateArticleCitationOp.createResultFunction = updateArticleCreateResult;
			}
			return _updateArticleCitationOp;
		}
		
		public function get retrieveAllArticlesPaged():AbstractOperation
		{
			if (_retrieveAllArticlesPagedOp == null) 
			{
				_retrieveAllArticlesPagedOp = new DummyOperation(this,"retrieveAllArticlesPaged",callHandlerDirectly);
				_retrieveAllArticlesPagedOp.createResultFunction = retrieveAllArticlesPagedCreateResult;
			}
			return _retrieveAllArticlesPagedOp;
		}

		public function get retrieveCorpusArticlesPaged():AbstractOperation
		{
			if (_retrieveCorpusArticlesPagedOp == null) 
			{
				_retrieveCorpusArticlesPagedOp = new DummyOperation(this,"retrieveCorpusArticlesPaged",callHandlerDirectly);
				_retrieveCorpusArticlesPagedOp.createResultFunction = retrieveCorpusArticlesPagedCreateResult;
			}
			return _retrieveCorpusArticlesPagedOp;
		}
		
		public function get countArticles():AbstractOperation
		{
			if (_countArticlesOp == null) 
			{
				_countArticlesOp = new DummyOperation(this,"countArticles",callHandlerDirectly);
				_countArticlesOp.createResultFunction = countArticlesCreateResult;
			}
			return _countArticlesOp;
		}
		
		public function get countCorpusArticles():AbstractOperation
		{
			if (_countCorpusArticlesOp == null) 
			{
				_countCorpusArticlesOp = new DummyOperation(this,"countCorpusArticles",callHandlerDirectly);
				_countCorpusArticlesOp.createResultFunction = countCorpusArticlesCreateResult;
			}
			return _countCorpusArticlesOp;
		}
		
		public function get findCorpusById():AbstractOperation
		{
			if (_findCorpusByIdOp == null) 
			{
				_findCorpusByIdOp = new DummyOperation(this,"findCorpusById",callHandlerDirectly);
				_findCorpusByIdOp.createResultFunction = findCorpusByIdCreateResult;
			}
			return _findCorpusByIdOp;
		}

		public function get updateCorpus():AbstractOperation
		{
			if (_updateCorpusOp == null) 
			{
				_updateCorpusOp = new DummyOperation(this,"updateCorpus",callHandlerDirectly);
				_updateCorpusOp.createResultFunction = updateCorpusCreateResult;
			}
			return _updateCorpusOp;
		}

		public function get listAllCorporaPaged():AbstractOperation
		{
			if (_getCorporaOp == null) 
			{
				_getCorporaOp = new DummyOperation(this,"listAllCorporaPaged",callHandlerDirectly);
				_getCorporaOp.createResultFunction = getCorporaCreateResult;
			}
			return _getCorporaOp;
		}
		
		public function get findJournalByAbbr():AbstractOperation
		{
			if (_findJournalByAbbrOp == null) 
			{
				_findJournalByAbbrOp = new DummyOperation(this,"findJournalByAbbr",callHandlerDirectly);
				_findJournalByAbbrOp.createResultFunction = findJournalByAbbrCreateResult;
			}
			return _findJournalByAbbrOp;
		}
		
		public function get insertCorpus():AbstractOperation
		{
			if (_createCorpusOp == null) 
			{
				_createCorpusOp = new DummyOperation(this,"insertCorpus",callHandlerDirectly);
				_createCorpusOp.createResultFunction = createCorpusCreateResult;
			}
			return _createCorpusOp;
		}

//		public function get addPublicationSetToCorpus():AbstractOperation
//		{
//			if (_addPublicationSetToCorpusOp == null) 
//			{
//				_addPublicationSetToCorpusOp = new DummyOperation(this,"addPublicationSetToCorpus");
//				_addPublicationSetToCorpusOp.createResultFunction = addPublicationSetToCorpusCreateResult;
//			}
//			return _addPublicationSetToCorpusOp;
//		}
		
		private function retrieveAllArticlesPagedCreateResult(args:Array):ArrayCollection {
			return new ArrayCollection(_articles.toArray());
		}

		private function retrieveCorpusArticlesPagedCreateResult(args:Array):ArrayCollection {
			var corpusName:String = String(args[0]);

			return findCorpusArticlesByCorpusName(corpusName);  

		}
		
		private function countArticlesCreateResult(args:Array):int {
			return _articles.length;
		}
		
		private function countCorpusArticlesCreateResult(args:Array):int {
			
			var corpusName:String = String(args[0]);
			
			return findCorpusArticlesByCorpusName(corpusName).length;  
			
		}
		
		private function getCorporaCreateResult(args:Array):ArrayCollection {
			var corporaList:ArrayCollection = new ArrayCollection();
			
			for each (var c:Corpus in _corpora)
			{
				var li:LightViewInstance = new LightViewInstance();
				li.writeUIDValue(c.vpdmfId);
				li.vpdmfLabel = c.name;
				
				corporaList.addItem(li);
			}
			return corporaList;
		}

		private function insertArticleCreateResult(args:Array):int {			
			var article:ArticleCitation = ArticleCitation(args[0]);
			article.vpdmfId = _nextvpdmfId++;
			_articles.addItem(article);
			return  article.vpdmfId;
		}
		
		private function updateArticleCreateResult(args:Array):void {			
			var article:ArticleCitation = ArticleCitation(args[0]);
			
			deleteArticle(article.vpdmfId);
			_articles.addItem(article);
		}
		
		private function deleteArticle(vpdmfId:int):void
		{
			for (var i:int = 0; i < _articles.length; i++)
			{
				if (ArticleCitation(_articles[i]).vpdmfId == vpdmfId)
				{
					_articles.removeItemAt(i);
				}
			}
		}
		
		private function findArticleByVpdmfIdCreateResult(args:Array):ArticleCitation {			
			var vpdmfId:int = int(args[0]);
			return findArticle(vpdmfId);
		}
		
		private function findArticle(vpdmfId:int):ArticleCitation {			
			for (var i:int  = 0; i < _articles.length; i++)
			{
				var article:ArticleCitation = _articles[i];
				if (vpdmfId == article.vpdmfId)
				{
					return article;
				}
			}
			return null;
		}
		
		private function createCorpusCreateResult(args:Array):int {			
			var corpus:Corpus = Corpus(args[0]);
			corpus.vpdmfId = _nextvpdmfId++;
			_corpora.addItem(corpus);
			return  corpus.vpdmfId;
		}

		private function findCorpusByIdCreateResult(args:Array):Corpus {			
			var corpusId:int = int(args[0]);
			return findCorpus(corpusId);
		}

		private function findCorpus(corpusId:int):Corpus {			
			for (var i:int  = 0; i < _corpora.length; i++)
			{
				var corpus:Corpus = _corpora[i];
				if (corpusId == corpus.vpdmfId)
				{
					return corpus;
				}
			}
			return null;
		}

		private function updateCorpusCreateResult(args:Array):void {			
			var newCorpus:Corpus = Corpus(args[0]);
			var oldCorpus:Corpus = findCorpus(newCorpus.vpdmfId);
			copyCorpusValues(newCorpus,oldCorpus);
		}

		/**
		 * Copies non null values from fromCorpus to toCorpus
		 */
		private function copyCorpusValues(fromCorpus:Corpus, toCorpus:Corpus):void
		{
			if (fromCorpus.name != null) toCorpus.name = fromCorpus.name;
			if (fromCorpus.description != null) toCorpus.description = fromCorpus.description;
		}
		
//		private function addPublicationSetToCorpusCreateResult(args:Array):ArrayCollection {
//			var corpusId:int = int(args[0]);
//			var articles:ArrayCollection = ArrayCollection(args[1]);
//
//			var corpusArticles:ArrayCollection = ArrayCollection(_corporaArticles[corpusId]);
//			if (corpusArticles == null) {
//				corpusArticles = new ArrayCollection();
//				_corporaArticles[corpusId] = corpusArticles;
//			}
//			corpusArticles.addAll(articles);
//			return null;
//		}
		
		private function findCorpusArticlesByCorpusName(corpusName:String):ArrayCollection {
			var articles:ArrayCollection =  new ArrayCollection();
			
			for each (var a:ArticleCitation in _articles)
			{
				if (a.corpora)
				{
					for each (var c:Corpus in a.corpora)
					{
						if (c.name == corpusName)
						{
							articles.addItem(a);
							break;
						}
					}
				}
			}
			
			return articles;
		}

		private function findJournalByAbbrCreateResult(args:Array):Journal {			
			var abbr:String = String(args[0]);
			return findJournalByAbbrF(abbr);
		}
		
		private function findJournalByIdF(id:int):Journal {			
			for each (var j:Journal in _journals)
			{
				if (id == j.vpdmfId)
				{
					return j;
				}
			}
			return null;
		}

		private function findJournalByAbbrF(abbr:String):Journal
		{			
			for each (var j:Journal in _journals)
			{
				if (abbr == j.abbr)
				{
					return j;
				}
			}
			return null;
		}

		public function addInvokedOperation(opName:String, opArgs:Array, token:DummyAsyncToken):void
		{
			invokedOperations.push({name : opName, args : opArgs, token : token});
		}
		
		public function resetInvokedOperations():void
		{
			invokedOperations.length = 0;	
		}
		
		public function getInvocationsFor(name:String):Array
		{
			var result:Array = [];
			for (var i:int = 0; i < invokedOperations.length; i++)
			{
				var o:Object = invokedOperations[i];
				if (o["name"] == name)
					result.push(o);
			}
			return result;
		}
	}
	
}