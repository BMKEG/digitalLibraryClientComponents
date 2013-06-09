package edu.isi.bmkeg.digitalLibrary.citations.events
{
	
	import flexunit.framework.Assert;
		
	public class UserRequestRetrieveArticleEventTest
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
		public function testUserRequestRetrieveArticleEvent():void 
		{
			var bmkegId:int = 99;

			var ev:UserRequestRetrieveArticleEvent = new UserRequestRetrieveArticleEvent(bmkegId,true,true);
			
			Assert.assertEquals(UserRequestRetrieveArticleEvent.RETRIEVE, ev.type);
			Assert.assertEquals(bmkegId, ev.bmkegId);
			Assert.assertEquals(true, ev.bubbles);
			Assert.assertEquals(true, ev.cancelable);
			
			var ev2:UserRequestRetrieveArticleEvent = UserRequestRetrieveArticleEvent(ev.clone());

			Assert.assertEquals(UserRequestRetrieveArticleEvent.RETRIEVE, ev2.type);
			Assert.assertEquals(bmkegId, ev2.bmkegId);
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