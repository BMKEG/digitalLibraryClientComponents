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
	
		public function listTermViews():void 
		{
			server.listTermViews.cancel();
			server.listTermViews.addEventListener(ResultEvent.RESULT, listTermViewsResultHandler);
			server.listTermViews.addEventListener(FaultEvent.FAULT, faultHandler);
			server.listTermViews.send();			
			
		}
		
		private function listTermViewsResultHandler(event:ResultEvent):void
		{
			var termList:ArrayCollection= ArrayCollection(event.result);
			dispatch(new ListTermViewsResultEvent(termList));
		}
		
	}

}
