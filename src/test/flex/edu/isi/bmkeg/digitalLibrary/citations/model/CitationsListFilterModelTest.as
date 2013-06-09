package edu.isi.bmkeg.digitalLibrary.citations.model
{    
    import edu.isi.bmkeg.digitalLibrary.citations.events.CitationsListFilterChangedEvent;
    import edu.isi.bmkeg.digitalLibrary.citations.testutils.MockEventDispatcher;
    
    import mx.collections.ArrayCollection;
    
    import org.hamcrest.assertThat;
    import org.hamcrest.collection.hasItem;
    import org.hamcrest.object.equalTo;
    
    public class CitationsListFilterModelTest
    {
        private var clfModel:CitationsListFilterModel;
        private var eventDispatcher:MockEventDispatcher;

        [Before]
        public function setup():void
        {
			clfModel = new CitationsListFilterModel();
            eventDispatcher = new MockEventDispatcher();

			clfModel.eventDispatcher = eventDispatcher;
        }

		[Test]
		public function testSetFilterToAll_dispatchesCitationsListFilterChangedEvent():void
		{
			clfModel.setFilterToAll();
			
			assertThat(eventDispatcher.dispatchedEventTypes, hasItem(CitationsListFilterChangedEvent.CHANGED));
		}

		[Test]
		public function testSetFilterToCorpus_dispatchesCitationsListFilterChangedEvent():void
		{
			clfModel.setFilterToCorpus("xxx");
			
			assertThat(eventDispatcher.dispatchedEventTypes, hasItem(CitationsListFilterChangedEvent.CHANGED));
		}
		
		[Test]
        public function testSetFilterToAll_getFilterCriteria_EqualsAll():void
        {
			clfModel.setFilterToAll();
			
			assertThat(clfModel.filterCriteria, equalTo(CitationsListFilterModel.FILTER_CRITERIA_ALL));
        }

		[Test]
		public function testSetFilterToCorpus_getFilterCriteria_EqualsCorpus():void
		{
			const corpusName:String = "xxx";
			clfModel.setFilterToCorpus(corpusName);
			
			assertThat(clfModel.filterCriteria, equalTo(CitationsListFilterModel.FILTER_CRITERIA_CORPUS));
			assertThat(clfModel.corpusName, equalTo(corpusName));
		}
}
}