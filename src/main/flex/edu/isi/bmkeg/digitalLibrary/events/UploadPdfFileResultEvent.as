package edu.isi.bmkeg.digitalLibrary.events
{
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.rpc.events.FaultEvent;
	
	public class UploadPdfFileResultEvent extends Event 
	{
		
		public static const UPLOAD_PDF_FILE_RESULT:String = "uploadPdfFileResult";
		
		public var vpdmfId:Number;
		
		public function UploadPdfFileResultEvent(vpdmfId:Number) {
			this.vpdmfId = vpdmfId;
			super(UPLOAD_PDF_FILE_RESULT);
		}
		
		override public function clone() : Event
		{
			return new UploadPdfFileResultEvent(vpdmfId);
		}
		
	}
}
