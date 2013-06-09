package edu.isi.bmkeg.digitalLibrary.citations.service
{
	import edu.isi.bmkeg.digitalLibrary.model.citations.Corpus;

	public interface ICorporaService
	{
		function loadCorpora():void;
		function insertCorpus(corpus:Corpus):void;
		function updateCorpus(corpus:Corpus):void;
		function retrieveCorpus(corpusId:int):void;

	}
}