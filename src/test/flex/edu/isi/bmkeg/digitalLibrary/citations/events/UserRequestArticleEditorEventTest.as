package edu.isi.bmkeg.digitalLibrary.citations.events
{
	
	import flexunit.framework.Assert;
		
	public class UserRequestArticleEditorEventTest
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
		public function testUserRequestArticleEditorEvent():void 
		{
			var vpdmfId:int = 123;
			
			var ev:UserRequestArticleEditorEvent = new UserRequestArticleEditorEvent(UserRequestArticleEditorEvent.OPEN,vpdmfId,true,true);
			
			Assert.assertEquals(UserRequestArticleEditorEvent.OPEN, ev.type);
			Assert.assertEquals(vpdmfId, ev.vpdmfId);
			Assert.assertEquals(true, ev.bubbles);
			Assert.assertEquals(true, ev.cancelable);
			
			var ev2:UserRequestArticleEditorEvent = UserRequestArticleEditorEvent(ev.clone());

			Assert.assertEquals(UserRequestArticleEditorEvent.OPEN, ev2.type);
			Assert.assertEquals(vpdmfId, ev2.vpdmfId);
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