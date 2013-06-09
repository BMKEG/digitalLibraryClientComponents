package edu.isi.bmkeg.digitalLibrary.citations.events
{
	
	import edu.isi.bmkeg.digitalLibrary.citations.testutils.TUtils;
	import edu.isi.bmkeg.digitalLibrary.model.citations.ArticleCitation;
	
	import flexunit.framework.Assert;
		
	public class UserRequestSaveArticleEventTest
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
		public function testUserRequestSaveArticleEvent():void 
		{
			var a:ArticleCitation = TUtils.createDummyArticle1();
						
			var ev:UserRequestSaveArticleEvent = new UserRequestSaveArticleEvent(a,true,true);
			
			Assert.assertEquals(UserRequestSaveArticleEvent.SAVE, ev.type);
			Assert.assertEquals(a, ev.article);
			Assert.assertEquals(true, ev.bubbles);
			Assert.assertEquals(true, ev.cancelable);
			
			var ev2:UserRequestSaveArticleEvent = UserRequestSaveArticleEvent(ev.clone());

			Assert.assertEquals(UserRequestSaveArticleEvent.SAVE, ev2.type);
			Assert.assertEquals(a, ev2.article);
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