package edu.isi.bmkeg.digitalLibrary.citations.service
{
	import edu.isi.bmkeg.digitalLibrary.model.citations.ArticleCitation;
	import edu.isi.bmkeg.digitalLibrary.model.citations.Corpus;

	public interface ICitationsService
	{
		function fetchAllArticles(offset:int, cnt:int):void;
		
		function fetchCorpusArticles(corpusName:String, offset:int, cnt:int):void;
		
		function fetchAllArticlesCount():void;

		function fetchCorpusArticlesCount(corpusName:String):void;

		function retrieveJournalByAbbr(abbr:String):void;
		
		function insertArticle(article:ArticleCitation):void;

		function updateArticle(article:ArticleCitation):void;

		function retrieveArticle(bmkegId:int):void;

	}
}