package edu.isi.bmkeg.digitalLibrary.citations.events
{
	
	import edu.isi.bmkeg.digitalLibrary.model.citations.ArticleCitation;
	
	import flexunit.framework.Assert;
		
	public class ArticleCitationRetrievedEventTest
	{
			
		[Before]
		public function setUp():void
		{
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[Test]
		public function testArticleCitationRetrievedEvent():void 
		{
			var aId:int = 99;
			var aTitle:String = "A Title";
			var aYear:int = 1999;
			
			var a:ArticleCitation = new ArticleCitation();
			a.vpdmfId = aId;
			a.title = aTitle;
			a.pubYear = aYear;
			
			var ev:ArticleCitationRetrievedEvent = new ArticleCitationRetrievedEvent(a,true,true);
			
			Assert.assertEquals(ArticleCitationRetrievedEvent.ARTICLE_RETRIEVED, ev.type);
			Assert.assertEquals(aId, ev.article.vpdmfId);
			Assert.assertEquals(aTitle, ev.article.title);
			Assert.assertEquals(aYear, ev.article.pubYear);
			Assert.assertEquals(true, ev.bubbles);
			Assert.assertEquals(true, ev.cancelable);
			
			var ev2:ArticleCitationRetrievedEvent = ArticleCitationRetrievedEvent(ev.clone());

			Assert.assertEquals(ArticleCitationRetrievedEvent.ARTICLE_RETRIEVED, ev2.type);
			Assert.assertEquals(aId, ev2.article.vpdmfId);
			Assert.assertEquals(aTitle, ev2.article.title);
			Assert.assertEquals(aYear, ev2.article.pubYear);
			Assert.assertEquals(true, ev2.bubbles);
			Assert.assertEquals(true, ev2.cancelable);
		}
			
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
				
	}
}