package edu.isi.bmkeg.digitalLibrary.citations.service.imp
{
    import edu.isi.bmkeg.digitalLibrary.citations.model.CitationsListModel;
    import edu.isi.bmkeg.digitalLibrary.citations.service.serverinteraction.ICitationsServer;
    import edu.isi.bmkeg.digitalLibrary.citations.service.serverinteraction.imp.DummyAsyncToken;
    import edu.isi.bmkeg.digitalLibrary.citations.service.serverinteraction.imp.DummyCitationsServerImp;
    import edu.isi.bmkeg.digitalLibrary.citations.testutils.MockEventDispatcher;
    import edu.isi.bmkeg.digitalLibrary.citations.testutils.TUtils;
    
    import flash.events.Event;
    
    import mockolate.mock;
    import mockolate.nice;
    import mockolate.prepare;
    import mockolate.received;
    import mockolate.verify;
    
    import mx.collections.ArrayCollection;
    import mx.collections.ArrayList;
    import mx.collections.IList;
    import mx.rpc.AsyncResponder;
    import mx.rpc.events.ResultEvent;
    
    import org.flexunit.async.Async;
    import org.hamcrest.assertThat;
    import org.hamcrest.collection.array;
    import org.hamcrest.collection.emptyArray;
    import org.hamcrest.collection.hasItem;
    import org.hamcrest.core.not;
    import org.hamcrest.number.greaterThan;
    import org.hamcrest.object.equalTo;
    import org.hamcrest.object.notNullValue;
    import org.hamcrest.object.strictlyEqualTo;

    public class CitationsServiceTest
    {
        private var citationsService:CitationsService;
        private var eventDispatcher:MockEventDispatcher;
		private var citationsListModel:CitationsListModel;
		private var dummyServer:DummyCitationsServerImp;
		
        [Before(async)]
        public function setup():void
        {
            eventDispatcher = new MockEventDispatcher();
	
			citationsService = new CitationsService();
			dummyServer = new DummyCitationsServerImp(true);
			citationsService.citationsServer = dummyServer;
			citationsService.eventDispatcher = eventDispatcher;
			prepareMockolates();			
        }
		
		public function prepareMockolates():void
		{
			Async.proceedOnEvent(this, prepare(CitationsListModel), Event.COMPLETE);
		}

		[Test]
		public function testFetchAllArticles_invokesRetrieveAllArticlesPaged():void
		{		
	
			var cList:IList = new ArrayList();
			citationsListModel = nice(CitationsListModel);
			mock(citationsListModel).getter("citationsList").returns(cList);
			citationsService.citationsListModel = citationsListModel;
			
			dummyServer.resetInvokedOperations();
			
			var offset:int = 100;
			var cnt:int = 10;
			citationsService.fetchAllArticles(offset, cnt);
			
			var ops:Array = dummyServer.getInvocationsFor("retrieveAllArticlesPaged");
			
			assertThat(ops.length,equalTo(1));
			
			var op:Object = ops[0];
			assertThat(op.args[0], equalTo(offset));
			assertThat(op.args[1],equalTo(cnt));
			
			var token:DummyAsyncToken = op.token;
			assertThat(token.responders.length,equalTo(1));
			
			var resp:MyAsyncResponder = token.responders[0] as MyAsyncResponder;
			assertThat(resp, notNullValue());
			assertThat(resp.token.offset, equalTo(offset));
			assertThat(resp.token.citations, strictlyEqualTo(cList));
		}

		[Test]
		public function testFetchArticlesResultHandler_sameCitationsList_storesCitations():void
		{		
			
			var cList:IList = new ArrayList();
			citationsListModel = nice(CitationsListModel);
			mock(citationsListModel).getter("citationsList").returns(cList);
			citationsService.citationsListModel = citationsListModel;
			
			var offset:int = 100;
			var token:Object = {citations:cList, offset:offset};
			var result:ArrayCollection = new ArrayCollection([TUtils.createDummyArticle1()]);
			var re:ResultEvent = new ResultEvent(ResultEvent.RESULT,false,true,result);
			citationsService.fetchArticlesResultHandler(re,token);
			
			assertThat(citationsListModel,
				received().method("storeCitationsAt")
				.args(equalTo(offset),array(result.getItemAt(0)))
			)
		}

		[Test]
		public function testFetchArticlesResultHandler_differentCitationsList_dontStoresCitations():void
		{		
			
			var cList:IList = new ArrayList();
			citationsListModel = nice(CitationsListModel);
			mock(citationsListModel).getter("citationsList").returns(cList);
			citationsService.citationsListModel = citationsListModel;
			
			var offset:int = 100;
			var token:Object = {citations:new ArrayList(), offset:offset};
			var result:ArrayCollection = new ArrayCollection([TUtils.createDummyArticle1()]);
			citationsService.fetchArticlesResultHandler(result,token);
			
			assertThat(citationsListModel,
				received().method("storeCitationsAt").never());
		}
		
		[Test]
		public function testFetchCorpusArticles_invokesRetrieveCorpusArticlesPaged():void
		{		
			
			var cList:IList = new ArrayList();
			citationsListModel = nice(CitationsListModel);
			mock(citationsListModel).getter("citationsList").returns(cList);
			citationsService.citationsListModel = citationsListModel;
			
			dummyServer.resetInvokedOperations();
			
			const offset:int = 100;
			const cnt:int = 10;
			const corpusName:String = "Brain Connectivity";
			
			citationsService.fetchCorpusArticles(corpusName, offset, cnt);
			
			var ops:Array = dummyServer.getInvocationsFor("retrieveCorpusArticlesPaged");
			
			assertThat(ops.length,equalTo(1));
			
			var op:Object = ops[0];
			assertThat(op.args[0], equalTo(corpusName));
			assertThat(op.args[1], equalTo(offset));
			assertThat(op.args[2],equalTo(cnt));
			
			var token:DummyAsyncToken = op.token;
			assertThat(token.responders.length,equalTo(1));
			
			var resp:MyAsyncResponder = token.responders[0] as MyAsyncResponder;
			assertThat(resp, notNullValue());
			assertThat(resp.token.offset, equalTo(offset));
			assertThat(resp.token.citations, strictlyEqualTo(cList));
		}

		[Test]
		public function testFetchArticlesCount_invokesCountArticles():void
		{		
			
			citationsListModel = nice(CitationsListModel);
			citationsService.citationsListModel = citationsListModel;
			dummyServer.resetInvokedOperations();
			
			citationsService.fetchAllArticlesCount();
			
			var ops:Array = dummyServer.getInvocationsFor("countArticles");
			
			assertThat(ops.length,equalTo(1));
		}
		
		[Test]
		public function testFetchArticlesCount_setsCitationsListLength():void
		{		
			
			citationsListModel = nice(CitationsListModel);
			citationsService.citationsListModel = citationsListModel;

			citationsService.fetchAllArticlesCount();
			
			assertThat(citationsListModel,
				received().setter("citationsListLength")
				.args(greaterThan(0)))
		}
	
		[Test]
		public function testFetchCorpusArticlesCount_invokesCountCorpusArticles():void
		{		
			
			citationsListModel = nice(CitationsListModel);
			citationsService.citationsListModel = citationsListModel;
			dummyServer.resetInvokedOperations();

			const corpusName:String = "Brain Connectivity";
			
			citationsService.fetchCorpusArticlesCount(corpusName);
			
			var ops:Array = dummyServer.getInvocationsFor("countCorpusArticles");
			
			assertThat(ops.length,equalTo(1));
		}
		
		[Test]
		public function testFetchCorpusArticlesCount_setsCitationsListLength():void
		{		
			
			citationsListModel = nice(CitationsListModel);
			citationsService.citationsListModel = citationsListModel;
			
			const corpusName:String = "Brain Connectivity";

			citationsService.fetchCorpusArticlesCount(corpusName);
			
			assertThat(citationsListModel,
				received().setter("citationsListLength")
				.args(greaterThan(0)))
		}
		
	}
}