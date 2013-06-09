package edu.isi.bmkeg.digitalLibrary.citations.view
{
	import edu.isi.bmkeg.digitalLibrary.model.citations.Person;
	
	import mx.collections.ArrayCollection;
	import mx.utils.StringUtil;

	public class ViewHelper
	{
		
		public static function formatAuthors(authorList:ArrayCollection):String
		{
			var formattedAuthors:String = "";
			var isFirst:Boolean = true;
			
			for each  (var a:Person in authorList)
			{
				if (isFirst)
				{
					isFirst = false;
				}
				else
				{
					formattedAuthors += "; ";
				}
				formattedAuthors += a.fullName
			}
			return formattedAuthors;
		}
		
		public static function textLine2array(s:String, d:String):Array
		{
			var a:Array = StringUtil.trimArrayElements(s,";").split(";");
			for (var i:int = a.length - 1; i >= 0; i--)
			{
				if (String(a[i]).length == 0)
				{
					a.splice(i,1);
				}
			}
			return a;
		}
	}
}