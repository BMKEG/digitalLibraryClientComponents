package edu.isi.bmkeg.digitalLibrary.citations.events
{
	
	import flexunit.framework.Assert;
		
	public class UserRequestCitationsListFilterChangeToCorpusEventTest
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
		public function testUserRequestCitationsListFilterChangeToCorpusEvent():void 
		{
			const corpusName:String = "xxx";

			var ev:UserRequestCitationsListFilterChangeToCorpusEvent = new UserRequestCitationsListFilterChangeToCorpusEvent(corpusName,true,true);
			
			Assert.assertEquals(UserRequestCitationsListFilterChangeToCorpusEvent.CHANGE, ev.type);
			Assert.assertEquals(corpusName, ev.corpusName);
			Assert.assertEquals(true, ev.bubbles);
			Assert.assertEquals(true, ev.cancelable);
			
			var ev2:UserRequestCitationsListFilterChangeToCorpusEvent = UserRequestCitationsListFilterChangeToCorpusEvent(ev.clone());

			Assert.assertEquals(UserRequestCitationsListFilterChangeToCorpusEvent.CHANGE, ev2.type);
			Assert.assertEquals(corpusName, ev2.corpusName);
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