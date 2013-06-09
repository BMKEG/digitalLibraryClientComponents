package edu.isi.bmkeg.digitalLibrary.citations.events
{
	
	import edu.isi.bmkeg.digitalLibrary.model.citations.Journal;
	
	import flexunit.framework.Assert;
		
	public class JournalRetrievedEventTest
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
		public function testJournalRetrievedEvent():void 
		{
			var jId:int = 99;
			var jAbbr:String = "J Abbr";
			var jTitle:String = "J Title";
			
			var j:Journal = new Journal();
			j.vpdmfId = jId;
			j.abbr = jAbbr;
			j.journalTitle = jTitle;
			
			var ev:JournalRetrievedEvent = new JournalRetrievedEvent(j,true,true);
			
			Assert.assertEquals(JournalRetrievedEvent.JOURNAL_RETRIEVED, ev.type);
			Assert.assertEquals(jId, ev.journal.vpdmfId);
			Assert.assertEquals(jAbbr, ev.journal.abbr);
			Assert.assertEquals(jTitle, ev.journal.journalTitle);
			Assert.assertEquals(true, ev.bubbles);
			Assert.assertEquals(true, ev.cancelable);
			
			var ev2:JournalRetrievedEvent = JournalRetrievedEvent(ev.clone());

			Assert.assertEquals(JournalRetrievedEvent.JOURNAL_RETRIEVED, ev2.type);
			Assert.assertEquals(jId, ev2.journal.vpdmfId);
			Assert.assertEquals(jAbbr, ev2.journal.abbr);
			Assert.assertEquals(jTitle, ev2.journal.journalTitle);
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