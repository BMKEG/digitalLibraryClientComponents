package edu.isi.bmkeg.digitalLibrary.citations.view
{
	
	import edu.isi.bmkeg.digitalLibrary.citations.testutils.TUtils;
	import edu.isi.bmkeg.digitalLibrary.model.citations.ArticleCitation;
	import edu.isi.bmkeg.digitalLibrary.model.citations.ID;
	import edu.isi.bmkeg.digitalLibrary.model.citations.Keyword;
	import edu.isi.bmkeg.digitalLibrary.model.citations.Person;
	import edu.isi.bmkeg.digitalLibrary.model.citations.URL;
	
	import flexunit.framework.Assert;
	
	import mx.collections.ArrayCollection;
		
	public class ArticleCitationEditorViewTest
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
		public function testString2authors():void 
		{
			var s:Array = new Array(2);
			s[0] = "John Smith";
			s[1] = "Carl Jones";
			
			var a:Array = ArticleCitationEditorView.string2authors(s);
			
			Assert.assertEquals(2,a.length);
			Assert.assertTrue(a[0] is Person);
			Assert.assertEquals(-1,Person(a[0]).vpdmfId);
			Assert.assertEquals("John Smith",Person(a[0]).fullName);

			Assert.assertTrue(a[1] is Person);
			Assert.assertEquals(-1,Person(a[1]).vpdmfId);
			Assert.assertEquals("Carl Jones",Person(a[1]).fullName);
		}
			
		[Test]
		public function testAuthors2strings():void 
		{
			var p1:Person =new Person();
			p1.fullName = "John Smith";

			var p2:Person =new Person();
			p2.fullName = "Carl Jones";
			
			var a:Array = [p1,p2];

			var s:Array = ArticleCitationEditorView.authors2strings(a);
			
			Assert.assertEquals(2,s.length);
			Assert.assertEquals("John Smith",s[0]);
			Assert.assertEquals("Carl Jones",s[1]);
		}
		
		[Test]
		public function testString2keywords():void 
		{
			var s:Array = new Array(2);
			s[0] = "Short term memory";
			s[1] = "Happiness";
			
			var k:Array = ArticleCitationEditorView.string2keywords(s);
			
			Assert.assertEquals(2,k.length);
			Assert.assertTrue(k[0] is Keyword);
			Assert.assertEquals(-1,Keyword(k[0]).vpdmfId);
			Assert.assertEquals("Short term memory",Keyword(k[0]).value);
			
			Assert.assertTrue(k[1] is Keyword);
			Assert.assertEquals(-1,Keyword(k[1]).vpdmfId);
			Assert.assertEquals("Happiness",Keyword(k[1]).value);
		}
				
		[Test]
		public function testKeywords2strings():void 
		{
			var k1:Keyword = new Keyword();
			k1.value = "Short term memory";
			
			var k2:Keyword = new Keyword();
			k2.value = "Happiness";
			
			
			var a:Array = [k1,k2];
			
			var s:Array = ArticleCitationEditorView.keywords2strings(a);
			
			Assert.assertEquals(2,s.length);
			Assert.assertEquals("Short term memory",s[0]);
			Assert.assertEquals("Happiness",s[1]);
		}
		
		[Test]
		public function testString2urls():void 
		{
			var s:Array = new Array(2);
			s[0] = "http://url1";
			s[1] = "http://url2";
			
			var u:Array = ArticleCitationEditorView.string2urls(s);
			
			Assert.assertEquals(2,u.length);
			Assert.assertTrue(u[0] is URL);
			Assert.assertEquals(-1,URL(u[0]).vpdmfId);
			Assert.assertEquals("http://url1",URL(u[0]).url);
			
			Assert.assertTrue(u[1] is URL);
			Assert.assertEquals(-1,URL(u[0]).vpdmfId);
			Assert.assertEquals("http://url2",URL(u[1]).url);
		}
		
		[Test]
		public function testUrls2strings():void 
		{
			var u1:URL = new URL();
			u1.url = "http://url1";
			
			var u2:URL = new URL();
			u2.url = "http://url2";
			
			
			var a:Array = [u1,u2];
			
			var s:Array = ArticleCitationEditorView.urls2strings(a);
			
			Assert.assertEquals(2,s.length);
			Assert.assertEquals("http://url1",s[0]);
			Assert.assertEquals("http://url2",s[1]);
		}
		
		[Test]
		public function testInstantiateArticleCitation():void
		{
			var view:ArticleCitationEditorView = new ArticleCitationEditorView();
			var a1:ArticleCitation = TUtils.createDummyArticle1();
			
			view.vpdmfId = -1;
			view.abstract = a1.abstractText;
			view.articleTitle = a1.title;
			view.year = String(a1.pubYear);
			view.pages = a1.pages;
			view.keywordsLine = 
				ArticleCitationEditorView.keywords2strings(a1.keywordList.source)
				.join(";");
			view.pmid  = String(a1.pmid);
			view.authorsLine = 
				ArticleCitationEditorView.authors2strings(a1.authorList.source)
				.join(";");
			view.urlsLine = 
				ArticleCitationEditorView.urls2strings(a1.fullTextUrl.source)
				.join(";");
			view.doi = ID(a1.ids.getItemAt(0)).idValue;
			view.volume = a1.volume;
			view.issue = a1.issue;
			view.journalId = a1.journal.vpdmfId;
			view.journalAbbr = a1.journal.abbr;
			view.journalTitle = a1.journal.journalTitle;
			
			// Clears vpdmfIds of related objects other than Journal in expected 
			// ArticleCitation instance
			
			a1.vpdmfId = -1;
			
			for each (var p:Person in a1.authorList)
			{
				p.vpdmfId = -1;
			}
			
			for each (var k:Keyword in a1.keywordList)
			{
				k.vpdmfId = -1;
			}
			
			for each (var u:URL in a1.fullTextUrl)
			{
				u.vpdmfId = -1;
			}
			
			ID(a1.ids.getItemAt(0)).vpdmfId = -1;

			var a2:ArticleCitation = view.instantiateArticleCitation();
			
			TUtils.assertDeepEqualsArticleCitations(a1,a2);
		}

		[Test]
		public function testLoadArticleCitation():void
		{
			var view:ArticleCitationEditorView = new ArticleCitationEditorView();
			var a1:ArticleCitation = TUtils.createDummyArticle1();
			
			view.loadArticleCitation(a1);
			
			Assert.assertEquals(a1, view._cachedArticleCitation);
			
			Assert.assertEquals(a1.vpdmfId, view.vpdmfId);
			Assert.assertEquals(a1.abstractText, view.abstract);
			Assert.assertEquals(a1.title, view.articleTitle);
			Assert.assertEquals(String(a1.pubYear), view.year);
			Assert.assertEquals(a1.pages, view.pages);
			Assert.assertEquals(
				ArticleCitationEditorView.keywords2strings(a1.keywordList.source).join(";"),
				view.keywordsLine);
			Assert.assertEquals(String(a1.pmid),view.pmid);
			Assert.assertEquals(ArticleCitationEditorView.authors2strings(a1.authorList.source)
				.join(";"),
				view.authorsLine);
			Assert.assertEquals(ArticleCitationEditorView.urls2strings(a1.fullTextUrl.source)
				.join(";"),
				view.urlsLine);
			Assert.assertEquals(ID(a1.ids.getItemAt(0)).idValue, view.doi);
			Assert.assertEquals(ID(a1.ids.getItemAt(0)).idType, "DOI");
			Assert.assertEquals(a1.volume, view.volume);
			Assert.assertEquals(a1.issue, view.issue);
			Assert.assertEquals(a1.journal.vpdmfId, view.journalId);
			Assert.assertEquals(a1.journal.abbr, view.journalAbbr);
			Assert.assertEquals(a1.journal.journalTitle, view.journalTitle);
		}
		

		[Test]
		public function testLoadAndInstantiateArticleCitation():void
		{
			var view:ArticleCitationEditorView = new ArticleCitationEditorView();
			var a1:ArticleCitation = TUtils.createDummyArticle1();
			
			view.loadArticleCitation(a1);
			
			var a2:ArticleCitation = view.instantiateArticleCitation();
			
			TUtils.assertDeepEqualsArticleCitations(a1,a2);
		}
				
		[Test]
		public function testClearFormFields():void
		{
			var view:ArticleCitationEditorView = new ArticleCitationEditorView();
			var a1:ArticleCitation = TUtils.createDummyArticle1();
			
			view.vpdmfId = a1.vpdmfId;
			view.abstract = a1.abstractText;
			view.articleTitle = a1.title;
			view.year = String(a1.pubYear);
			view.pages = a1.pages;
			view.keywordsLine = 
				ArticleCitationEditorView.keywords2strings(a1.keywordList.source)
				.join(";");
			view.pmid  = String(a1.pmid);
			view.authorsLine = 
				ArticleCitationEditorView.authors2strings(a1.authorList.source)
				.join(";");
			view.urlsLine = 
				ArticleCitationEditorView.urls2strings(a1.fullTextUrl.source)
				.join(";");
			view.doi = ID(a1.ids.getItemAt(0)).idValue;
			view.volume = a1.volume;
			view.issue = a1.issue;
			view.journalId = a1.journal.vpdmfId;
			view.journalAbbr = a1.journal.abbr;
			view.journalTitle = a1.journal.journalTitle;
			
			view.clearFormFields();
			
			Assert.assertEquals(-1,view.vpdmfId);			
			Assert.assertNull(view.abstract);
			Assert.assertNull(view.articleTitle);
			Assert.assertNull(view.year);
			Assert.assertNull(view.pages);
			Assert.assertNull(view.keywordsLine);
			Assert.assertNull(view.pmid);
			Assert.assertNull(view.authorsLine);
			Assert.assertNull(view.urlsLine);
			Assert.assertNull(view.doi);
			Assert.assertNull(view.volume);
			Assert.assertNull(view.issue);
			Assert.assertEquals(-1,view.journalId);
			Assert.assertNull(view.journalAbbr);
			Assert.assertNull(view.journalTitle);
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