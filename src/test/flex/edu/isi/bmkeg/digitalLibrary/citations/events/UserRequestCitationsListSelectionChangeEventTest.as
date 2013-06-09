package edu.isi.bmkeg.digitalLibrary.citations.events
{
	
	import flexunit.framework.Assert;
		
	public class UserRequestCitationsListSelectionChangeEventTest
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
		public function testUserRequestCitationsListSelectionChangeEvent():void 
		{
			var i:int = 99;

			var ev:UserRequestCitationsListSelectionChangeEvent = new UserRequestCitationsListSelectionChangeEvent(i,true,true);
			
			Assert.assertEquals(UserRequestCitationsListSelectionChangeEvent.CHANGE, ev.type);
			Assert.assertEquals(i, ev.selectedIndex);
			Assert.assertEquals(true, ev.bubbles);
			Assert.assertEquals(true, ev.cancelable);
			
			var ev2:UserRequestCitationsListSelectionChangeEvent = UserRequestCitationsListSelectionChangeEvent(ev.clone());

			Assert.assertEquals(UserRequestCitationsListSelectionChangeEvent.CHANGE, ev2.type);
			Assert.assertEquals(i, ev2.selectedIndex);
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