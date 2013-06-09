package edu.isi.bmkeg.vpdmf.model.dao
{

	// TODO: It should be defined in a VPDMf library.
	[Bindable]
	[RemoteClass(alias="edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance")]
	public class LightViewInstance
	{
		public function LightViewInstance(){}

		public var UIDString:String;
		public var vpdmfLabel:String;
		
		public function readUIDValue():int {
			var s:String = this.UIDString;
			var uid:String = s.substring(s.indexOf("=") + 1, s.length);
			return int(uid);
		}

		public function writeUIDValue(id:int):void {
			UIDString = "bmkegId=" + String(id);
		}

	}
}