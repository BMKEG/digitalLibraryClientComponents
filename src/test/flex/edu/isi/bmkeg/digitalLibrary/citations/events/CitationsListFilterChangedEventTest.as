package edu.isi.bmkeg.digitalLibrary.citations.events
{
	
	import edu.isi.bmkeg.digitalLibrary.citations.model.CitationsListFilterModel;
	
	import flexunit.framework.Assert;
		
	public class CitationsListFilterChangedEventTest
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
		public function testTestCorporaFilterChangeEvent():void 
		{
			var ev:CitationsListFilterChangedEvent = new CitationsListFilterChangedEvent(true,true);
			
			Assert.assertEquals(CitationsListFilterChangedEvent.CHANGED, ev.type);
			Assert.assertEquals(true, ev.bubbles);
			Assert.assertEquals(true, ev.cancelable);
			
			var ev2:CitationsListFilterChangedEvent = CitationsListFilterChangedEvent(ev.clone());

			Assert.assertEquals(CitationsListFilterChangedEvent.CHANGED, ev2.type);
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