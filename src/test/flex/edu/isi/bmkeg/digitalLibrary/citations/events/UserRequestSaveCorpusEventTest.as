package edu.isi.bmkeg.digitalLibrary.citations.events
{
	
	import edu.isi.bmkeg.digitalLibrary.model.citations.Corpus;
	
	import flexunit.framework.Assert;
		
	public class UserRequestSaveCorpusEventTest
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
		public function testUserRequestSaveCorpusEvent():void 
		{
			var cid:int = 1;
			var cname:String = "1 name";
			var cdesc:String = "1 description";
			
			var c:Corpus = new Corpus();
			c.vpdmfId = cid;
			c.name  = cname;
			c.description = cdesc;
			
			var ev:UserRequestSaveCorpusEvent = new UserRequestSaveCorpusEvent(c,true,true);
			
			Assert.assertEquals(UserRequestSaveCorpusEvent.SAVE, ev.type);
			Assert.assertEquals(cid, ev.corpus.vpdmfId);
			Assert.assertEquals(cname, ev.corpus.name);
			Assert.assertEquals(cdesc, ev.corpus.description);
			Assert.assertEquals(true, ev.bubbles);
			Assert.assertEquals(true, ev.cancelable);
			
			var ev2:UserRequestSaveCorpusEvent = UserRequestSaveCorpusEvent(ev.clone());

			Assert.assertEquals(UserRequestSaveCorpusEvent.SAVE, ev2.type);
			Assert.assertEquals(cid, ev2.corpus.vpdmfId);
			Assert.assertEquals(cname, ev2.corpus.name);
			Assert.assertEquals(cdesc, ev2.corpus.description);
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