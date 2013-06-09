package edu.isi.bmkeg.digitalLibrary.citations.events
{
	
	import flexunit.framework.Assert;
		
	public class CitationsStorageChangedEventTest
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
		public function testCitationsStorageChangedEvent():void 
		{
			var ev:CitationsStorageChangedEvent = new CitationsStorageChangedEvent(true,true);
			
			Assert.assertEquals(CitationsStorageChangedEvent.CHANGED, ev.type);
			Assert.assertEquals(true, ev.bubbles);
			Assert.assertEquals(true, ev.cancelable);
			
			var ev2:CitationsStorageChangedEvent = CitationsStorageChangedEvent(ev.clone());

			Assert.assertEquals(CitationsStorageChangedEvent.CHANGED, ev2.type);
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