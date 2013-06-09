package edu.isi.bmkeg.digitalLibrary.citations.events
{
	
	import flexunit.framework.Assert;
		
	public class CitationsListPageFaultEventTest
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
		public function testCitationsListPageFaultEventTest():void 
		{
			var o:int = 999;
			var c:int = 111;

			var ev:CitationsListPageFaultEvent = new CitationsListPageFaultEvent(o,c,true,true);
			
			Assert.assertEquals(CitationsListPageFaultEvent.FAULT, ev.type);
			Assert.assertEquals(o, ev.offset);
			Assert.assertEquals(c, ev.count);
			Assert.assertEquals(true, ev.bubbles);
			Assert.assertEquals(true, ev.cancelable);
			
			var ev2:CitationsListPageFaultEvent = CitationsListPageFaultEvent(ev.clone());

			Assert.assertEquals(CitationsListPageFaultEvent.FAULT, ev2.type);
			Assert.assertEquals(o, ev2.offset);
			Assert.assertEquals(c, ev2.count);
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