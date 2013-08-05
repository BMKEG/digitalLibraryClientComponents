package edu.isi.bmkeg.digitalLibrary.services.serverInteraction.impl
{

	import edu.isi.bmkeg.digitalLibrary.services.serverInteraction.*;

	import mx.collections.ArrayCollection;
	import mx.rpc.AbstractOperation;
	import mx.rpc.AbstractService;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	import mx.rpc.AbstractOperation;

	import edu.isi.bmkeg.utils.dao.Utils;
	import edu.isi.bmkeg.digitalLibrary.services.serverInteraction.IExtendedDigitalLibraryServer;

	public class ExtendedDigitalLibraryServerImpl 
			extends RemoteObject 
			implements IExtendedDigitalLibraryServer
	{

		private static const SERVICES_DEST:String = "extendedDigitalLibraryServiceImpl";

		public function ExtendedDigitalLibraryServerImpl()
		{
			destination = SERVICES_DEST;
			endpoint = Utils.getRemotingEndpoint();
			showBusyCursor = true;
		}
		
		// ~~~~~~~~~~~~~~~
		// functions
		// ~~~~~~~~~~~~~~~
		public function get addPmidEncodedPdfToCorpus():AbstractOperation
		{
			return getOperation("addPmidEncodedPdfToCorpus");
		}
				
		
	}

}