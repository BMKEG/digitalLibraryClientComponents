package edu.isi.bmkeg.digitalLibrary.citations.events
{
	
	import flexunit.framework.Assert;
		
	public class CitationsListUpdatedEventTest
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
		public function testCitationsListUpdatedEvent():void 
		{
			var ev:CitationsListUpdatedEvent = new CitationsListUpdatedEvent(true,true);
			
			Assert.assertEquals(CitationsListUpdatedEvent.UPDATED, ev.type);
			Assert.assertEquals(true, ev.bubbles);
			Assert.assertEquals(true, ev.cancelable);
			
			var ev2:CitationsListUpdatedEvent = CitationsListUpdatedEvent(ev.clone());

			Assert.assertEquals(CitationsListUpdatedEvent.UPDATED, ev2.type);
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