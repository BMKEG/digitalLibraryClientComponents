package edu.isi.bmkeg.digitalLibrary.citations.events
{
	
	import edu.isi.bmkeg.digitalLibrary.citations.testutils.TUtils;
	import edu.isi.bmkeg.digitalLibrary.model.citations.ArticleCitation;
	
	import flexunit.framework.Assert;
		
	public class UserRequestCitationActionEventTest
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
		public function testUserRequestCitationActionEvent():void 
		{
			var cit:ArticleCitation = TUtils.createDummyArticle1();
			
			var ev:UserRequestCitationActionEvent = new UserRequestCitationActionEvent(UserRequestCitationActionEvent.EDIT,cit,true,true);
			
			Assert.assertEquals(UserRequestCitationActionEvent.EDIT, ev.type);
			Assert.assertEquals(cit, ev.citation);
			Assert.assertEquals(true, ev.bubbles);
			Assert.assertEquals(true, ev.cancelable);
			
			var ev2:UserRequestCitationActionEvent = UserRequestCitationActionEvent(ev.clone());

			Assert.assertEquals(UserRequestCitationActionEvent.EDIT, ev2.type);
			Assert.assertEquals(cit, ev2.citation);
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