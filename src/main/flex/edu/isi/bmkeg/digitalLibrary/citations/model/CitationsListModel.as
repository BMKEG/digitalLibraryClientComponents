package edu.isi.bmkeg.digitalLibrary.citations.model
{
	import edu.isi.bmkeg.digitalLibrary.citations.events.CitationsListPageFaultEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.CitationsListSelectionChangedEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.CitationsListUpdatedEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.UnknownCitationsListLengthEvent;
	import edu.isi.bmkeg.digitalLibrary.model.citations.ArticleCitation;
	import edu.isi.bmkeg.thirdparty.PagedList;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * The citations collection supporting this model is implemented using the PagedList class
	 * created by James Ward.
	 * This class implements an IList whose items are retrieved asynchronically from a remote
	 * service. When attempting to call the getItemAt() method and the requested item hasn't 
	 * been retrieved yet, the PagedList throws an ItemPendingError exception which includes
	 * a call responder for the caller to add a callback function to be called when the service
	 * completes the retrieve operation.
	 */
	public class CitationsListModel extends Actor
	{
		
		// TODO make citations list page size parametric
		static public const PAGE_SIZE:int = 100;
		
		private var _pagedCitationsList:PagedList = null;	// of ArticleCitation
//		private var _offset:int;
//		private var _pageSize:int;
		
		private var _selectedIndex:int = -1;
//		private var _selectedCitation:ArticleCitation = null;
		
		public function get selectedCitation():ArticleCitation
		{
			if (_selectedIndex == -1)
			{
				return null;
			}
			else
			{
				return ArticleCitation(_pagedCitationsList.getItemAt(_selectedIndex));
			}
		}

		public function get selectedIndex():int
		{
			return _selectedIndex;
		}
		
		public function set selectedIndex(v:int):void
		{
			if (v != _selectedIndex)
			{
				_selectedIndex = v;
				dispatch(new CitationsListSelectionChangedEvent(selectedIndex));						
			}

		}
		
		public function initCitationsList():void
		{
			dispatch(new UnknownCitationsListLengthEvent());
		}
		
		public function get citationsListLength():int
		{
			return _pagedCitationsList.length;
		}
			
		public function set citationsListLength(v:int):void
		{
			_pagedCitationsList = new PagedList(v, PAGE_SIZE);
			_pagedCitationsList.loadItemsFunction = requestFetchCitations;
			dispatch(new CitationsListUpdatedEvent());
		}
		
		public function get pageSize():int
		{
			return PAGE_SIZE;
		}
		
		public function get citationsList():IList
		{
			return _pagedCitationsList;
		}
		
		public function storeCitationsAt(offset:int, citations:Array):void
		{
			_pagedCitationsList.storeItemsAt(citations, offset); 
		}
			
		private function requestFetchCitations(list:PagedList, index:int, count:int):void 
		{
			dispatch(new CitationsListPageFaultEvent(index, count));
		}
		
	}
}