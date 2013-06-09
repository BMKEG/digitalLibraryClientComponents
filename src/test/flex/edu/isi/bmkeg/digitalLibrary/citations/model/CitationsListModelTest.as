package edu.isi.bmkeg.digitalLibrary.citations.model
{
    import edu.isi.bmkeg.digitalLibrary.citations.events.CitationsListPageFaultEvent;
    import edu.isi.bmkeg.digitalLibrary.citations.events.CitationsListSelectionChangedEvent;
    import edu.isi.bmkeg.digitalLibrary.citations.events.CitationsListUpdatedEvent;
    import edu.isi.bmkeg.digitalLibrary.citations.events.UnknownCitationsListLengthEvent;
    import edu.isi.bmkeg.digitalLibrary.citations.testutils.MockEventDispatcher;
    import edu.isi.bmkeg.digitalLibrary.citations.testutils.TUtils;
    import edu.isi.bmkeg.digitalLibrary.model.citations.ArticleCitation;
    
    import flash.events.Event;
    
    import mx.collections.ArrayCollection;
    import mx.collections.errors.ItemPendingError;
    
    import org.flexunit.async.Async;
    import org.hamcrest.assertThat;
    import org.hamcrest.collection.hasItem;
    import org.hamcrest.core.allOf;
    import org.hamcrest.core.isA;
    import org.hamcrest.core.not;
    import org.hamcrest.core.throws;
    import org.hamcrest.object.equalTo;
    import org.hamcrest.object.hasProperties;
    import org.hamcrest.object.instanceOf;
    import org.hamcrest.object.notNullValue;
    import org.hamcrest.object.nullValue;
    import org.hamcrest.object.strictlyEqualTo;

    public class CitationsListModelTest
    {
        private var citationsListModel:CitationsListModel;
        private var eventDispatcher:MockEventDispatcher;

        [Before]
        public function setup():void
        {
			citationsListModel = new CitationsListModel();
            eventDispatcher = new MockEventDispatcher();

			citationsListModel.eventDispatcher = eventDispatcher;
        }

		[Test]
		public function test_initialization_citationsListEqualsNull():void
		{
			assertThat(citationsListModel.citationsList, nullValue());
		}
		
		[Test]
		public function test_initialization_selectedCitationEqualsNull():void
		{
			assertThat(citationsListModel.selectedCitation, nullValue());
		}
		
		[Test]
		public function test_initCitationsList_dispatchesUnknownCitationsListLengthEvent():void
		{
			citationsListModel.initCitationsList();			
			assertThat(eventDispatcher.dispatchedEventTypes, hasItem(UnknownCitationsListLengthEvent.UNKNOWN));
		}
				
		[Test]
		public function test_setCitationsListLength_citationsListPageLength_EqualsSetCitationsListLength():void
		{
			citationsListModel.initCitationsList();			
			citationsListModel.citationsListLength = 50;
			assertThat(citationsListModel.citationsListLength, equalTo(50));
		}
			
		[Test]
		public function test_setCitationsListLength_citationsList_NotEqualsNull():void
		{
			citationsListModel.initCitationsList();			
			citationsListModel.citationsListLength = 50;
			assertThat(citationsListModel.citationsList, notNullValue());
		}
		
		[Test]
		public function test_setCitationsListLength_dispatchesCitationsListUpdatedEvent():void
		{
			citationsListModel.initCitationsList();			
			citationsListModel.citationsListLength = 50;
			assertThat(eventDispatcher.dispatchedEventTypes, hasItem(CitationsListUpdatedEvent.UPDATED));
		}
		
		[Test]
		public function test_setCitationsListLength_doesNotDispatchesPageFaultEvent():void
		{
			citationsListModel.initCitationsList();			
			citationsListModel.citationsListLength = 50;
			assertThat(eventDispatcher.dispatchedEventTypes,  not(hasItem(CitationsListPageFaultEvent.FAULT)));
		}
		
		[Test]
		public function test_setCitationsListLength_selectedCitationEqualsNull():void
		{
			citationsListModel.initCitationsList();			
			citationsListModel.citationsListLength = 50;
			assertThat(citationsListModel.selectedCitation, nullValue());
		}
		
		[Test]
		public function test_citationsListGetItemAt_onUnassignedItem_dispatchesPageFault():void
		{
			citationsListModel.initCitationsList();			
			citationsListModel.citationsListLength = 50;
			eventDispatcher.resetDispatchedEvents();
			try
			{
				citationsListModel.citationsList.getItemAt(0);			
			}
			catch (err:Error) {}
			finally
			{
				assertThat(eventDispatcher.dispatchedEventTypes, hasItem(CitationsListPageFaultEvent.FAULT));				
			}
		}
		
		[Test]
		public function test_citationsListGetItemAt_onUnassignedItem_dispatchesIPE():void
		{
			citationsListModel.initCitationsList();			
			citationsListModel.citationsListLength = 50;
			assertThat(function():void {
				citationsListModel.citationsList.getItemAt(0);
			},
				throws(instanceOf(ItemPendingError)));
		}
		
		[Test]
		public function test_citationsListGetItemAt_equalsSetCitationsListItemAt():void
		{
			var a1:ArticleCitation = TUtils.createDummyArticle1();
			var cl:Array = [a1];
			citationsListModel.initCitationsList();			
			citationsListModel.citationsListLength = 50;
			citationsListModel.storeCitationsAt(0,cl);
			var item:* = citationsListModel.citationsList.getItemAt(0);
			assertThat(item,a1);
		}
		
		[Test]
		public function test_getSelectedCitation_equalsSetSelectedCitation():void
		{
			var a1:ArticleCitation = TUtils.createDummyArticle1();
			var cl:Array = [a1];
			citationsListModel.initCitationsList();			
			citationsListModel.citationsListLength = 50;
			citationsListModel.storeCitationsAt(0,cl);
			citationsListModel.selectedIndex = 0;

			assertThat(citationsListModel.selectedCitation, equalTo(a1));
		}
		
		[Test]
		public function test_setSelectedCitation_setToNullGetsNull():void
		{
			var a1:ArticleCitation = TUtils.createDummyArticle1();
			var cl:Array = [a1];
			citationsListModel.initCitationsList();			
			citationsListModel.citationsListLength = 50;
			citationsListModel.storeCitationsAt(0,cl);
			citationsListModel.selectedIndex = -1;
			
			assertThat(citationsListModel.selectedCitation, nullValue());
		}
		
		[Test]
		public function test_setSelectedCitation_dispatchesCitationsListSelectionChangedEventWithSelection():void
		{
			var a1:ArticleCitation = TUtils.createDummyArticle1();
			var cl:Array = [a1];
			citationsListModel.initCitationsList();			
			citationsListModel.citationsListLength = 50;
			citationsListModel.storeCitationsAt(0,cl);
			citationsListModel.selectedIndex = 0;
			
			assertThat(eventDispatcher.dispatchedEvents,
				hasItem(hasProperties({
					type:equalTo(CitationsListSelectionChangedEvent.CHANGED),
					selectedIndex: equalTo(0)
				})));
		}
		
		[Test]
		public function test_setSelectedCitation_setToNullDispatchesNull():void
		{
			var a1:ArticleCitation = TUtils.createDummyArticle1();
			var cl:Array = [a1];
			citationsListModel.initCitationsList();			
			citationsListModel.citationsListLength = 50;
			citationsListModel.storeCitationsAt(0,cl);
			citationsListModel.selectedIndex = 0;
			
			eventDispatcher.resetDispatchedEvents();
			citationsListModel.selectedIndex = -1;
			
			assertThat(eventDispatcher.dispatchedEvents,
				hasItem(hasProperties({
					type:equalTo(CitationsListSelectionChangedEvent.CHANGED),
					selectedIndex: equalTo(-1)
				})));
		}

   }
}