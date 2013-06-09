package edu.isi.bmkeg.digitalLibrary.citations.testutils
{
	import edu.isi.bmkeg.digitalLibrary.model.citations.ArticleCitation;
	import edu.isi.bmkeg.digitalLibrary.model.citations.Corpus;
	import edu.isi.bmkeg.digitalLibrary.model.citations.ID;
	import edu.isi.bmkeg.digitalLibrary.model.citations.Journal;
	import edu.isi.bmkeg.digitalLibrary.model.citations.Keyword;
	import edu.isi.bmkeg.digitalLibrary.model.citations.Person;
	import edu.isi.bmkeg.digitalLibrary.model.citations.URL;
	
	import flexunit.framework.Assert;
	
	import mx.collections.ArrayCollection;

	public class TUtils
	{
		
		private static var _nextvpdmfId:int = 1;
		
		public static function nextVpdmfId():int
		{
			return _nextvpdmfId++;
		}
		
		public static function createDummyArticle1():ArticleCitation
		{
			var art1:ArticleCitation;
			var auth1:Person;
			
			art1 = new ArticleCitation();
			art1.vpdmfId = nextVpdmfId();
			art1.abstractText ="The parasubthalamic nucleus (PSTN) is a differentiation of the lateral hypothalamic area, characterized by a distinct population of neurons expressing beta-preprotachykinin (beta-PPT) mRNA. The axonal projections from the PSTN have been analyzed with the PHAL anterograde tract tracing method in rats. The results indicate that the cell group is distinguished by massive projections to parasympathetic preganglionic neurons in the brainstem (especially in the salivatory nuclei and dorsal motor nucleus of the vagus nerve) and to parts of the parabrachial nucleus and nucleus of the solitary tract that relay viscerosensory and gustatory information. In addition, the PSTN projects to cortical parts of the cerebral hemisphere (infralimbic, agranular insular, postpiriform transition and lateral entorhinal areas, and posterior basolateral amygdalar nucleus)-directly and also indirectly via thalamic feedback loops involving the paraventricular and mediodorsal nuclei-and to nuclear parts of the cerebral hemisphere (central amygdalar nucleus, striatal fundus, rhomboid nucleus of the bed nuclei of the stria terminalis, and substantia innominata). The PSTN is thus positioned to influence directly many cerebral hemisphere and hindbrain components of the central parasympathetic control network that is active, for example, during feeding behavior and cardiovascular regulation.";
			art1.title = "Axonal projections from the parasubthalamic nucleus";
			art1.pubYear = 2004;
			art1.pages = "581-607";
			art1.volume = "469";
			art1.issue = "4";
			
			art1.keywordList = new ArrayCollection();
			var k:Keyword;
			
			k = new Keyword();
			k.vpdmfId  = nextVpdmfId();
			k.value = "hypothalamus";
			art1.keywordList.addItem(k);
			k = new Keyword();
			k.vpdmfId  = nextVpdmfId();
			k.value = "autonomic";
			art1.keywordList.addItem(k);
			k = new Keyword();
			k.vpdmfId  = nextVpdmfId();
			k.value = "amygdala";
			art1.keywordList.addItem(k);
			k = new Keyword();
			k.vpdmfId  = nextVpdmfId();
			k.value = "nucleus of the solitary tract";
			art1.keywordList.addItem(k);
			k = new Keyword();
			k.vpdmfId  = nextVpdmfId();
			k.value = "feeding";
			art1.keywordList.addItem(k);
			
			art1.fullTextUrl = new ArrayCollection();
			var u:URL;
			u = new URL();
			u.vpdmfId  = nextVpdmfId();
			u.url = "http://www.ncbi.nlm.nih.gov/pubmed?term=14755537";
			art1.fullTextUrl.addItem(u);

			art1.pmid = 14755537;
			
			art1.ids = new ArrayCollection();
			var id:ID = new ID();
			id.vpdmfId = nextVpdmfId();
			id.idType = "DOI";
			id.idValue = "10.1002/cne.11036";
			art1.ids.addItem(id);
			
			art1.journal = new Journal();
			art1.journal.vpdmfId = nextVpdmfId();
			art1.journal.journalTitle = "THE JOURNAL OF COMPARATIVE NEUROLOGY";
			art1.journal.abbr = "J Comp Neurol";
			
			art1.authorList = new ArrayCollection();
			auth1 = new Person();
			auth1.vpdmfId = nextVpdmfId();
			auth1.fullName ="Larry Swanson";
			art1.authorList.addItem(auth1);
			
			auth1 = new Person();
			auth1.vpdmfId = nextVpdmfId();
			auth1.fullName ="M Goto";
			art1.authorList.addItem(auth1);
			
			art1.corpora = new ArrayCollection();
			
			return art1;
		}

		public static function createDummyArticle2():ArticleCitation
		{
			var art1:ArticleCitation;
			var auth1:Person;
			
			art1 = new ArticleCitation();
			art1.vpdmfId = nextVpdmfId();
			art1.abstractText ="Understanding the principles of cerebral hemisphere neural network organization is essential for understanding the biological foundations of cognition and affect-thinking and feeling. A tripartite model of cerebral structure-function organization is reviewed, with attention focused on a behavior control system differentiation that mediates voluntary influences on three fundamental classes of goal-oriented behavior common to all animals. The model postulates just three cerebral divisions, one cortical and two nuclear (lateral or striatal, and medial or pallidal), that together generate a triple descending projection to the brainstem/cord motor system. This minimal circuit element is topographically organized and regionally differentiated, with the map of cortical areas serving as a basic starting point. Virtually all of the cerebral hemisphere projects on the upper brainstem behavior control column, atop the motor system hierarchy. The latter's rostral segment helps control ingestive (eating and drinking), defensive (fight or flight), and reproductive (sexual and parental) motivated behaviors, whereas its caudal segment helps control foraging or exploratory behavior to obtain or avoid specific goal objects associated with all classes of motivated behavior.";
			art1.title = "Anatomy of the soul as reflected in the cerebral hemispheres: neural circuits underlying voluntary control of basic motivated behaviors";
			art1.pubYear = 2005;
			art1.pages = "122-152";
			art1.volume = "493";
			art1.issue = "1";
			
			art1.keywordList = new ArrayCollection();
			var k:Keyword;
			
			k = new Keyword();
			k.vpdmfId  = nextVpdmfId();
			k.value = "basal ganglia";
			art1.keywordList.addItem(k);
			k = new Keyword();
			k.vpdmfId  = nextVpdmfId();
			k.value = "cerebral cortex";
			art1.keywordList.addItem(k);
			k = new Keyword();
			k.vpdmfId  = nextVpdmfId();
			k.value = "hypothalamus";
			art1.keywordList.addItem(k);
			k = new Keyword();
			k.vpdmfId  = nextVpdmfId();
			k.value = "thalamus";
			art1.keywordList.addItem(k);

			art1.fullTextUrl = new ArrayCollection();
			var u:URL;
			u = new URL();
			u.vpdmfId  = nextVpdmfId();
			u.url = "http://www.ncbi.nlm.nih.gov/pubmed?term=16254987";
			art1.fullTextUrl.addItem(u);

			art1.pmid = 16254987;

			art1.ids = new ArrayCollection();
			var id:ID = new ID();
			id.vpdmfId = nextVpdmfId();
			id.idType = "DOI";
			id.idValue = "10.1002/cne.20733";
			art1.ids.addItem(id);

			art1.journal = new Journal();
			art1.journal.vpdmfId = nextVpdmfId();
			art1.journal.journalTitle = "THE JOURNAL OF COMPARATIVE NEUROLOGY";
			art1.journal.abbr = "J Comp Neurol";

			art1.authorList = new ArrayCollection();
			auth1 = new Person();
			auth1.vpdmfId = nextVpdmfId();
			auth1.fullName ="Larry Swanson";
			art1.authorList.addItem(auth1);

			art1.corpora = new ArrayCollection();

			return art1;
		}

		public static function createDummyArticle3():ArticleCitation
		{
			var art1:ArticleCitation;
			var auth1:Person;
			
			art1 = new ArticleCitation();
			art1.vpdmfId = nextVpdmfId();
			art1.abstractText ="The paraventricular nucleus of the hypothalamus (PVH) plays a critical role in the regulation of autonomic, neuroendocrine, and behavioral activities. This understanding has come from extensive characterization of the PVH in rats, and for this mammalian species we now have a robust model of basic PVH neuroanatomy and function. However, in mice, whose use as a model research animal has burgeoned with the increasing sophistication of tools for genetic manipulation, a comparable level of PVH characterization has not been achieved. To address this, we employed a variety of fluorescent tract tracing and immunostaining techniques in several different combinations to determine the neuronal connections and cyto- and chemoarchitecture of the PVH in the commonly used C57BL/6J male mouse. Our findings reveal a distinct organization in the mouse PVH that is substantially different from the PVH of male rats. The differences are particularly evident with respect to the spatial relations of two principal neuroendocrine divisions (magnocellular and parvicellular) and three descending preautonomic populations in the PVH. We discuss these data in relation to what is known about PVH function and provide the work as a resource for further studies of the neuronal architecture and function of the mouse PVH.";
			art1.title = "Cyto- and chemoarchitecture of the hypothalamic paraventricular nucleus in the C57BL/6J male mouse: a study of immunostaining and multiple fluorescent tract tracing.";
			art1.pubYear = 2012;
			art1.pages = "6-33";
			art1.volume = "520";
			art1.issue = "1";
			
			art1.keywordList = new ArrayCollection();
			var k:Keyword;
						
			art1.fullTextUrl = new ArrayCollection();
			var u:URL;
			u = new URL();
			u.vpdmfId  = nextVpdmfId();
			u.url = "http://www.ncbi.nlm.nih.gov/pubmed/21674499";
			art1.fullTextUrl.addItem(u);
			
			art1.pmid = 21674499;
			
			art1.ids = new ArrayCollection();
			var id:ID = new ID();
			id.vpdmfId = nextVpdmfId();
			id.idType = "DOI";
			id.idValue = "10.1002/cne.22698";
			art1.ids.addItem(id);
			
			art1.journal = new Journal();
			art1.journal.vpdmfId = nextVpdmfId();
			art1.journal.journalTitle = "THE JOURNAL OF COMPARATIVE NEUROLOGY";
			art1.journal.abbr = "J Comp Neurol";
			
			art1.authorList = new ArrayCollection();
			auth1 = new Person();
			auth1.vpdmfId = nextVpdmfId();
			auth1.fullName ="Biag, Jonathan";
			art1.authorList.addItem(auth1);

			art1.authorList = new ArrayCollection();
			auth1 = new Person();
			auth1.vpdmfId = nextVpdmfId();
			auth1.fullName ="Hintiryan, Houri";
			art1.authorList.addItem(auth1);
			
			art1.authorList = new ArrayCollection();
			auth1 = new Person();
			auth1.vpdmfId = nextVpdmfId();
			auth1.fullName ="Gou, Lin";
			art1.authorList.addItem(auth1);

			art1.authorList = new ArrayCollection();
			auth1 = new Person();
			auth1.vpdmfId = nextVpdmfId();
			auth1.fullName ="Askarinam, Asal";
			art1.authorList.addItem(auth1);

			art1.authorList = new ArrayCollection();
			auth1 = new Person();
			auth1.vpdmfId = nextVpdmfId();
			auth1.fullName ="Hahn, Joel D";
			art1.authorList.addItem(auth1);

			art1.authorList = new ArrayCollection();
			auth1 = new Person();
			auth1.vpdmfId = nextVpdmfId();
			auth1.fullName ="Toga, Arthur W";
			art1.authorList.addItem(auth1);

			art1.authorList = new ArrayCollection();
			auth1 = new Person();
			auth1.vpdmfId = nextVpdmfId();
			auth1.fullName ="Dong, Hong-Wei";
			art1.authorList.addItem(auth1);

			art1.corpora = new ArrayCollection();

			return art1;
		}

		public static function createDummyArticle4():ArticleCitation
		{
			var art1:ArticleCitation;
			var auth1:Person;
			
			art1 = new ArticleCitation();
			art1.vpdmfId = nextVpdmfId();
			art1.abstractText = "The paraventricular nucleus of the hypothalamus (PVH) coordinates neuroendocrine, autonomic, and behavioral responses to help maintain energy and body water balance. The rat paraventricular nucleus has three major divisions: descending with axonal projections to somatomotor-behavioral and autonomic circuitry, magnocellular neuroendocrine with projections directly to the posterior pituitary, and parvicellular neuroendocrine with projections to the median eminence for controlling anterior pituitary hormone secretion. The present work was undertaken to provide high-resolution mapping of spatial relationships among the two magnocellular neuroendocrine and five parvicellular neuroendocrine neuron types throughout the nucleus. Double immunohistochemical labeling for two neuron types combined with retrograde labeling to identify neuroendocrine neurons positively was used in individual sections spaced 45 mum apart, along with a grid transfer method for reducing plane of section artifacts when comparing staining pattern data between animals. The results indicate that whereas each neuroendocrine neuron phenotype displays a unique distribution pattern, there is extensive partial overlap in a complex pattern between small \"hot spots\" with a relatively high density of a particular neuron type and few if any other phenotypes. In addition, the distribution of non-neuroendocrine neurons staining with each of the markers (but not retrogradely labeled) was mapped and compared with each other and with the neuroendocrine neuron populations. This spatial organization raises important questions about the differential functional regulation of individual-and perhaps sets of-neuroendocrine motor neuron populations in the PVH by synaptic mechanisms and by less traditional mechanisms like dendritic neurotransmitter release and gap junctions within and between neuron types.";
			art1.title = "Comparison of the spatial distribution of seven types of neuroendocrine neurons in the rat paraventricular nucleus: toward a global 3D model.";
			art1.pubYear = 2009;
			art1.pages = "423-41";
			art1.volume = "516";
			art1.issue = "5";
			
			art1.keywordList = new ArrayCollection();
			var k:Keyword;
			
			art1.fullTextUrl = new ArrayCollection();
			var u:URL;
			u = new URL();
			u.vpdmfId  = nextVpdmfId();
			u.url = "http://www.ncbi.nlm.nih.gov/pubmed/19655400";
			art1.fullTextUrl.addItem(u);
			
			art1.pmid = 19655400;
			
			art1.ids = new ArrayCollection();
			var id:ID = new ID();
			id.vpdmfId = nextVpdmfId();
			id.idType = "DOI";
			id.idValue = "10.1002/cne.22126";
			art1.ids.addItem(id);
			
			art1.journal = new Journal();
			art1.journal.vpdmfId = nextVpdmfId();
			art1.journal.journalTitle = "THE JOURNAL OF COMPARATIVE NEUROLOGY";
			art1.journal.abbr = "J Comp Neurol";
			
			art1.authorList = new ArrayCollection();
			auth1 = new Person();
			auth1.vpdmfId = nextVpdmfId();
			auth1.fullName ="Simmons, Donna M";
			art1.authorList.addItem(auth1);
			
			art1.authorList = new ArrayCollection();
			auth1 = new Person();
			auth1.vpdmfId = nextVpdmfId();
			auth1.fullName ="Swanson, Larry W";
			art1.authorList.addItem(auth1);
			
			art1.corpora = new ArrayCollection();

			return art1;
		}

		public static function createDummyCorpus1():Corpus {
			var c:Corpus = new Corpus();
			c.vpdmfId = nextVpdmfId();
			c.description = "Brain Connectivity Description";
			c.name = "Brain Connectivity";
			return c;
		}
		
		public static function createDummyCorpus2():Corpus {
			var c:Corpus = new Corpus();
			c.vpdmfId = nextVpdmfId();
			c.description = "Activation Studies Description";
			c.name = "Activation Studies";
			return c;
		}
		
		public static function assertDeepEqualsArticleCitations(a1:ArticleCitation,a2:ArticleCitation):void
		{
			Assert.assertEquals(a1.vpdmfId, a2.vpdmfId);
			Assert.assertEquals(a1.abstractText, a2.abstractText);
			Assert.assertEquals(a1.title, a2.title);
			Assert.assertEquals(a1.pubYear, a2.pubYear);
			Assert.assertEquals(a1.pages, a2.pages);
			Assert.assertEquals(a1.volume, a2.volume);
			Assert.assertEquals(a1.issue, a2.issue);
			Assert.assertEquals(a1.pmid, a2.pmid);
			
			if (a1.keywordList)
			{
				Assert.assertNotNull(a2.keywordList);
				assertDeepEqualsKeywords(a1.keywordList, a2.keywordList);
			}
			else
			{
				Assert.assertNull(a2.keywordList);
			}
			
			if (a1.authorList)
			{
				Assert.assertNotNull(a2.authorList);
				assertDeepEqualsAuthorList(a1.authorList, a2.authorList);
			}
			else
			{
				Assert.assertNull(a2.authorList);
			}

			if (a1.fullTextUrl)
			{
				Assert.assertNotNull(a2.fullTextUrl);
				assertDeepEqualsUrls(a1.fullTextUrl,a2.fullTextUrl);
			}
			else
			{
				Assert.assertNull(a2.fullTextUrl);
			}
			
			if (a1.ids)
			{
				Assert.assertNotNull(a2.ids);
				assertDeepEqualsIds(a1.ids,a2.ids);
			}
			else
			{
				Assert.assertNull(a2.ids);
			}
			
			if (a1.journal)
			{
				assertDeepEqualsJournal(a1.journal, a2.journal);
			}
			else
			{
				Assert.assertNull(a2.journal);
			}
		}
		
		public static function assertDeepEqualsJournal(j1:Journal, j2:Journal):void
		{
			Assert.assertEquals(j1.vpdmfId, j2.vpdmfId);
			Assert.assertEquals(j1.abbr, j2.abbr);
			Assert.assertEquals(j1.journalTitle, j2.journalTitle);
		}
		
		public static function assertDeepEqualsKeywords(k1s:ArrayCollection, k2s:ArrayCollection):void
		{
			Assert.assertEquals(k1s.length, k2s.length);
			for (var i:int = 0; i < k1s.length; i++)
			{
				var k1:Keyword = Keyword(k1s.getItemAt(i));
				var k2:Keyword = Keyword(k2s.getItemAt(i));
				
				Assert.assertEquals(k1.vpdmfId, k2.vpdmfId);
				Assert.assertEquals(k1.value, k2.value);
			}
		}

		public static function assertDeepEqualsUrls(k1s:ArrayCollection, k2s:ArrayCollection):void
		{
			Assert.assertEquals(k1s.length, k2s.length);
			for (var i:int = 0; i < k1s.length; i++)
			{
				var k1:URL = URL(k1s.getItemAt(i));
				var k2:URL = URL(k2s.getItemAt(i));
				
				Assert.assertEquals(k1.vpdmfId, k2.vpdmfId);
				Assert.assertEquals(k1.url, k2.url);
			}
		}
		
		public static function assertDeepEqualsIds(id1s:ArrayCollection, id2s:ArrayCollection):void
		{
			Assert.assertEquals(id1s.length, id2s.length);
			for (var i:int = 0; i < id1s.length; i++)
			{
				var id1:ID = ID(id1s.getItemAt(i));
				var id2:ID = ID(id2s.getItemAt(i));
				
				Assert.assertEquals(id1.vpdmfId, id2.vpdmfId);
				Assert.assertEquals(id1.idType, id2.idType);
				Assert.assertEquals(id1.idValue, id2.idValue);
			}
		}
		
		public static function assertDeepEqualsAuthorList(a1s:ArrayCollection, a2s:ArrayCollection):void
		{
			Assert.assertEquals(a1s.length, a2s.length);
			for (var i:int = 0; i < a1s.length; i++)
			{
				var p1:Person = Person(a1s.getItemAt(i));
				var p2:Person = Person(a2s.getItemAt(i));
				
				Assert.assertEquals(p1.vpdmfId, p2.vpdmfId);
				Assert.assertEquals(p1.fullName, p2.fullName);
			}
		}
	}
}