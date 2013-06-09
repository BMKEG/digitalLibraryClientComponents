package edu.isi.bmkeg.digitalLibrary.citations.view
{
	
	import edu.isi.bmkeg.digitalLibrary.model.citations.Person;
	
	import flexunit.framework.Assert;
	
	import mx.collections.ArrayCollection;
		
	public class ViewHelperTest
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
		public function testFormatAuthors():void 
		{
			var a1:Person = new Person();
			a1.fullName = "John Smith";

			var a2:Person = new Person();
			a2.fullName = "Carl Jones";

			var authorList:ArrayCollection = new ArrayCollection([a1, a2]);

			var formatted:String = ViewHelper.formatAuthors(authorList);
			Assert.assertEquals(formatted, "John Smith; Carl Jones");
		}
			
		[Test]
		public function testTextLine2array():void 
		{
			var line:String = "  one  ; two;three  ";
			var a:Array = ViewHelper.textLine2array(line,";");
			Assert.assertEquals(3,a.length);
			Assert.assertEquals("one",a[0]);
			Assert.assertEquals("two",a[1]);
			Assert.assertEquals("three",a[2]);
		}
		
		[Test]
		public function testTextLine2arrayEmptyEnd():void 
		{
			var line:String = "one;two;";
			var a:Array = ViewHelper.textLine2array(line,";");
			Assert.assertEquals(2,a.length);
			Assert.assertEquals("one",a[0]);
			Assert.assertEquals("two",a[1]);
		}

		[Test]
		public function testTextLine2arrayEmptyMiddle():void 
		{
			var line:String = "one; ;two";
			var a:Array = ViewHelper.textLine2array(line,";");
			Assert.assertEquals(2,a.length);
			Assert.assertEquals("one",a[0]);
			Assert.assertEquals("two",a[1]);
		}

		[Test]
		public function testTextLine2arrayEmptyStart():void 
		{
			var line:String = ";one;two";
			var a:Array = ViewHelper.textLine2array(line,";");
			Assert.assertEquals(2,a.length);
			Assert.assertEquals("one",a[0]);
			Assert.assertEquals("two",a[1]);
		}
		
		[Test]
		public function testTextLine2arraySingleElement():void 
		{
			var line:String = "one";
			var a:Array = ViewHelper.textLine2array(line,";");
			Assert.assertEquals(1,a.length);
			Assert.assertEquals("one",a[0]);
		}
		
		[Test]
		public function testTextLine2arraySingleElementEmptyEnd():void 
		{
			var line:String = "one;";
			var a:Array = ViewHelper.textLine2array(line,";");
			Assert.assertEquals(1,a.length);
			Assert.assertEquals("one",a[0]);
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