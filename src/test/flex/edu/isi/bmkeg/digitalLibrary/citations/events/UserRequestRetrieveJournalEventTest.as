package edu.isi.bmkeg.digitalLibrary.citations.events
{
	
	import flexunit.framework.Assert;
		
	public class UserRequestRetrieveJournalEventTest
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
		public function testUserRequestRetrieveJournalEvent():void 
		{
			var jAbbr:String = "J Abbr";
			
			var ev:UserRequestRetrieveJournalEvent = new UserRequestRetrieveJournalEvent(jAbbr,true,true);
			
			Assert.assertEquals(UserRequestRetrieveJournalEvent.RETRIEVE, ev.type);
			Assert.assertEquals(jAbbr, ev.journalAbbr);
			Assert.assertEquals(true, ev.bubbles);
			Assert.assertEquals(true, ev.cancelable);
			
			var ev2:UserRequestRetrieveJournalEvent = UserRequestRetrieveJournalEvent(ev.clone());

			Assert.assertEquals(UserRequestRetrieveJournalEvent.RETRIEVE, ev2.type);
			Assert.assertEquals(jAbbr, ev2.journalAbbr);
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