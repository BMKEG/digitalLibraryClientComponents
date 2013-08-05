package edu.isi.bmkeg.digitalLibrary.services.impl
{

	import edu.isi.bmkeg.digitalLibrary.services.*;
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
			var oesVpdmfId:Number = Number(event.result);
			dispatch(new UploadPdfFileResultEvent(oesVpdmfId));
		}
	}

}
