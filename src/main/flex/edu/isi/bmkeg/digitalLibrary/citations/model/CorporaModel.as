package edu.isi.bmkeg.digitalLibrary.citations.model
{
	import edu.isi.bmkeg.digitalLibrary.citations.events.CorporaUpdatedEvent;
	import edu.isi.bmkeg.digitalLibrary.model.citations.Corpus;
	import edu.isi.bmkeg.vpdmf.model.dao.LightViewInstance;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Actor;

	public class CorporaModel extends Actor
	{
		
		private var _corpora:ArrayCollection;
		
		public function get corpora():ArrayCollection
		{
			return _corpora;
		}
		
		public function loadCorpora(corpora:ArrayCollection):void
		{
			_corpora = corpora;
			
			var corporaEvent:CorporaUpdatedEvent = new CorporaUpdatedEvent();
			dispatch(corporaEvent);
			
		}
		
	}
	
}