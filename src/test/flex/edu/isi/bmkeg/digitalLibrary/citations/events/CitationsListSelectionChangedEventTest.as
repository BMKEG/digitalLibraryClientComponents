package edu.isi.bmkeg.digitalLibrary.citations.events
{
	
	import edu.isi.bmkeg.digitalLibrary.citations.testutils.TUtils;
	import edu.isi.bmkeg.digitalLibrary.model.citations.ArticleCitation;
	
	import flexunit.framework.Assert;
		
	public class CitationsListSelectionChangedEventTest
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
		public function testCitationsListSelectionChangedEvent():void 
		{
			var i:int = 99;

			var ev:CitationsListSelectionChangedEvent = new CitationsListSelectionChangedEvent(i,true,true);
			
			Assert.assertEquals(CitationsListSelectionChangedEvent.CHANGED, ev.type);
			Assert.assertEquals(i, ev.selectedIndex);
			Assert.assertEquals(true, ev.bubbles);
			Assert.assertEquals(true, ev.cancelable);
			
			var ev2:CitationsListSelectionChangedEvent = CitationsListSelectionChangedEvent(ev.clone());

			Assert.assertEquals(CitationsListSelectionChangedEvent.CHANGED, ev2.type);
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