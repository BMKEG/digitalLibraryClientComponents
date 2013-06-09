package edu.isi.bmkeg.digitalLibrary.citations.events
{
	
	import flexunit.framework.Assert;
		
	public class UserRequestCitationsListFilterChangeToAllEventTest
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
		public function testUserRequestCitationsListFilterChangeToAllEvent():void 
		{
			var ev:UserRequestCitationsListFilterChangeToAllEvent = new UserRequestCitationsListFilterChangeToAllEvent(true,true);
			
			Assert.assertEquals(UserRequestCitationsListFilterChangeToAllEvent.CHANGE, ev.type);
			Assert.assertEquals(true, ev.bubbles);
			Assert.assertEquals(true, ev.cancelable);
			
			var ev2:UserRequestCitationsListFilterChangeToAllEvent = UserRequestCitationsListFilterChangeToAllEvent(ev.clone());

			Assert.assertEquals(UserRequestCitationsListFilterChangeToAllEvent.CHANGE, ev2.type);
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