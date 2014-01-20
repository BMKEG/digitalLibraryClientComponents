package edu.isi.bmkeg.digitalLibrary.services.impl
{

	import edu.isi.bmkeg.digitalLibrary.model.citations.*;
	import edu.isi.bmkeg.ftd.model.*;
	import edu.isi.bmkeg.digitalLibrary.events.*;
	import edu.isi.bmkeg.digitalLibrary.services.*;
	import edu.isi.bmkeg.digitalLibrary.services.serverInteraction.*;
	import edu.isi.bmkeg.utils.dao.*;
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AbstractService;
	import mx.rpc.AsyncResponder;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.robotlegs.mvcs.Actor;

	public class ExtendedDigitalLibraryServiceImpl extends Actor implements IExtendedDigitalLibraryService {

		private var _server:IExtendedDigitalLibraryServer;

		[Inject]
		public function get server():IExtendedDigitalLibraryServer

		{
			return _server;
		}

		public function set server(s:IExtendedDigitalLibraryServer):void
		{
			_server = s;
			initServer();
		}

		private function initServer():void
		{
			if (_server is AbstractService)
			{
				AbstractService(_server).addEventListener(FaultEvent.FAULT,faultHandler);
			}
		}

		private function asyncResponderFailHandler(fail:Object, token:Object):void
		{
			faultHandler(fail as FaultEvent);
		}

		private function faultHandler(event:FaultEvent):void
		{
			var failureEvent:UploadPdfFileFaultEvent = new UploadPdfFileFaultEvent(event);
			dispatch(failureEvent);
		}

		// ~~~~~~~~~
		// functions
		// ~~~~~~~~~

		public function addPmidEncodedPdfToCorpus(pdfFileData:Object, fileName:String, corpusName:String=null):void {
			server.addPmidEncodedPdfToCorpus.cancel();
			server.addPmidEncodedPdfToCorpus.addEventListener(ResultEvent.RESULT, addPmidEncodedPdfToCorpusResultHandler);
			server.addPmidEncodedPdfToCorpus.addEventListener(FaultEvent.FAULT, faultHandler);
			server.addPmidEncodedPdfToCorpus.send(pdfFileData, fileName, corpusName);
		}
		
		private function addPmidEncodedPdfToCorpusResultHandler(event:ResultEvent):void
		{
			var ac:ArticleCitation = ArticleCitation(event.result);
			dispatch(new UploadPdfFileResultEvent(ac));
		}

		// ~~~~~~~~~
		
		public function removeFragmentBlock(frgBlk:FTDFragmentBlock):void {
			server.removeFragmentBlock.cancel();
			server.removeFragmentBlock.addEventListener(ResultEvent.RESULT, removeFragmentBlockResultHandler);
			server.removeFragmentBlock.addEventListener(FaultEvent.FAULT, faultHandler);
			server.removeFragmentBlock.send(frgBlk);			
		}
		
		private function removeFragmentBlockResultHandler(event:ResultEvent):void
		{
			var completed:Boolean = Boolean(event.result);
			dispatch(new RemoveAnnotationResultEvent(completed));
		}

		// ~~~~~~~~~

		public function listTermViews():void 
		{
			server.listTermViews.cancel();
			server.listTermViews.addEventListener(ResultEvent.RESULT, listTermViewsResultHandler);
			server.listTermViews.addEventListener(FaultEvent.FAULT, faultHandler);
			server.listTermViews.send();				
		}
		
		private function listTermViewsResultHandler(event:ResultEvent):void
		{
			var termList:ArrayCollection = ArrayCollection(event.result);
			dispatch(new ListTermViewsResultEvent(termList));
		}
		
		// ~~~~~~~~~

		public function addArticlesToCorpus(articleIds:ArrayCollection, corpusId:Number):void {
			server.addArticlesToCorpus.cancel();
			server.addArticlesToCorpus.addEventListener(ResultEvent.RESULT, addArticlesToCorpusResultHandler);
			server.addArticlesToCorpus.addEventListener(FaultEvent.FAULT, faultHandler);
			server.addArticlesToCorpus.send(articleIds, corpusId);				
		}
		
		private function addArticlesToCorpusResultHandler(event:ResultEvent):void
		{
			var count:Number = Number(event.result);
			dispatch(new AddArticleCitationToCorpusResultEvent(count));
		}

		// ~~~~~~~~~

		public function removeArticlesFromCorpus(articleIds:ArrayCollection, corpusId:Number):void {
			server.removeArticlesFromCorpus.cancel();
			server.removeArticlesFromCorpus.addEventListener(ResultEvent.RESULT, removeArticlesFromCorpusResultHandler);
			server.removeArticlesFromCorpus.addEventListener(FaultEvent.FAULT, faultHandler);
			server.removeArticlesFromCorpus.send(articleIds, corpusId);				
		}
		
		private function removeArticlesFromCorpusResultHandler(event:ResultEvent):void
		{
			var count:Number = Number(event.result);
			dispatch(new RemoveArticleCitationFromCorpusResultEvent(count));
		}

		// ~~~~~~~~~

		public function fullyDeleteArticle(articleId:Number):void {
			server.fullyDeleteArticle.cancel();
			server.fullyDeleteArticle.addEventListener(ResultEvent.RESULT, fullyDeleteArticleResultHandler);
			server.fullyDeleteArticle.addEventListener(FaultEvent.FAULT, faultHandler);
			server.fullyDeleteArticle.send(articleId);				
		}
		
		private function fullyDeleteArticleResultHandler(event:ResultEvent):void
		{
			var success:Boolean = Boolean(event.result);
			dispatch(new FullyDeleteArticleResultEvent(success));
		}

		// ~~~~~~~~~

		public function listExtendedJournalEpochs():void {
			server.listExtendedJournalEpochs.cancel();
			server.listExtendedJournalEpochs.addEventListener(ResultEvent.RESULT, listExtendedJournalEpochsResultHandler);
			server.listExtendedJournalEpochs.addEventListener(FaultEvent.FAULT, faultHandler);
			server.listExtendedJournalEpochs.send();				
		}
		
		private function listExtendedJournalEpochsResultHandler(event:ResultEvent):void
		{
			var epochList:ArrayCollection = ArrayCollection(event.result);
			dispatch(new ListExtendedJournalEpochsResultEvent(epochList));
		}
		
		// ~~~~~~~~~
		
		public function addRuleFileToJournalEpoch(ruleFileId:Number, 
												  epochId:Number,
												  epochJournal:String,
												  epochStart:Number,
												  epochEnd:Number):void {
			server.addRuleFileToJournalEpoch.cancel();
			server.addRuleFileToJournalEpoch.addEventListener(ResultEvent.RESULT, addRuleFileToJournalEpochResultHandler);
			server.addRuleFileToJournalEpoch.addEventListener(FaultEvent.FAULT, faultHandler);
			server.addRuleFileToJournalEpoch.send(ruleFileId, epochId, 
				epochJournal, epochStart, epochEnd);				
		}
		
		private function addRuleFileToJournalEpochResultHandler(event:ResultEvent):void
		{
			var id:Number = Number(event.result);
			dispatch(new AddRuleFileToJournalEpochResultEvent(id));
		}
		
		// ~~~~~~~~~
		
		public function retrieveFTDRuleSetForArticleCitation(articleId:Number):void {
			server.retrieveFTDRuleSetForArticleCitation.cancel();
			server.retrieveFTDRuleSetForArticleCitation.addEventListener(ResultEvent.RESULT, retrieveFTDRuleSetForArticleCitationHandler);
			server.retrieveFTDRuleSetForArticleCitation.addEventListener(FaultEvent.FAULT, faultHandler);
			server.retrieveFTDRuleSetForArticleCitation.send(articleId);				
		}
		
		private function retrieveFTDRuleSetForArticleCitationHandler(event:ResultEvent):void
		{
			var ruleSet:FTDRuleSet = FTDRuleSet(event.result);
			dispatch(new RetrieveFTDRuleSetForArticleCitationResultEvent(ruleSet));
		}

		// ~~~~~~~~~
		
		public function runRuleSetOnArticleCitation(ruleSetId:Number, articleId:Number):void {
			server.runRuleSetOnArticleCitation.cancel();
			server.runRuleSetOnArticleCitation.addEventListener(ResultEvent.RESULT, runRuleSetOnArticleCitationHandler);
			server.runRuleSetOnArticleCitation.addEventListener(FaultEvent.FAULT, faultHandler);
			server.runRuleSetOnArticleCitation.send(ruleSetId, articleId);				
		}
		
		private function runRuleSetOnArticleCitationHandler(event:ResultEvent):void
		{
			var articleId:Number = Number(event.result);
			dispatch(new RunRuleSetOnArticleCitationResultEvent(articleId));
		}
		
		// ~~~~~~~~~
		
		public function runRuleSetOnJournalEpoch(epochId:Number):void {
			server.runRuleSetOnJournalEpoch.cancel();
			server.runRuleSetOnJournalEpoch.addEventListener(ResultEvent.RESULT, runRuleSetOnJournalEpochResultHandler);
			server.runRuleSetOnJournalEpoch.addEventListener(FaultEvent.FAULT, faultHandler);
			server.runRuleSetOnJournalEpoch.send(epochId);				
		}
		
		private function runRuleSetOnJournalEpochResultHandler(event:ResultEvent):void
		{
			var articleId:Number = Number(event.result);
			dispatch(new RunRuleSetOnArticleCitationResultEvent(articleId));
		}
		
		// ~~~~~~~~~
		
		public function generateRuleFileFromLapdf(articleId:Number):void {
			server.generateRuleFileFromLapdf.cancel();
			server.generateRuleFileFromLapdf.addEventListener(ResultEvent.RESULT, generateRuleFileFromLapdfHandler);
			server.generateRuleFileFromLapdf.addEventListener(FaultEvent.FAULT, faultHandler);
			server.generateRuleFileFromLapdf.send(articleId);				
		}
		
		private function generateRuleFileFromLapdfHandler(event:ResultEvent):void
		{
			var csvText:String = String(event.result);
			dispatch(new GenerateRuleFileFromLapdfResultEvent(csvText));
		}
		
	}

}
