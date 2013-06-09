package edu.isi.bmkeg.digitalLibrary.citations.service.serverinteraction
{
	import mx.rpc.AbstractOperation;

	public interface ICitationsServer
	{
		
		// ~~~~~~~~~~~~~~~
		// Count functions
		// ~~~~~~~~~~~~~~~

		/**
		 * 	public int countArticles() throws Exception;
		 */
		function get countArticles():AbstractOperation;
		
		/**
		 * public int countCorpusArticles(String corpusName) throws Exception;
		 */
		function get countCorpusArticles():AbstractOperation;
		
		// ~~~~~~~~~~~~~~~~~~~
		// Insert Functions
		// ~~~~~~~~~~~~~~~~~~~
		
		/**
		 * public long insertCorpus(Corpus corpus) throws Exception
		 */
		function get insertCorpus():AbstractOperation;
		
		/**
		 * 	public long insertArticleCitation(Article article) throws Exception
		 */
		function get insertArticleCitation():AbstractOperation;
		
		// ~~~~~~~~~~~~~~~~~~~
		// Update Functions
		// ~~~~~~~~~~~~~~~~~~~

		/**
		 * public void updateCorpus(Corpus corpus) throws Exception
		 */
		function get updateCorpus():AbstractOperation;

		/**
		 * 	public void updateArticleCitation(Article article) throws Exception
		 */
		function get updateArticleCitation():AbstractOperation;
		


		// ~~~~~~~~~~~~~~~~~~~
		// Delete Functions
		// ~~~~~~~~~~~~~~~~~~~
		
		// ~~~~~~~~~~~~~~~~~~~~
		// Find by id Functions
		// ~~~~~~~~~~~~~~~~~~~~
		
		/**
		 * public Corpus findCorpusById(long id) throws Exception
		 */
		function get findCorpusById():AbstractOperation;
		
		/**
		 * public Journal findJournalByAbbr(String abbr) throws Exception;
		 */
		function get findJournalByAbbr():AbstractOperation;
		
		/**
		 * 	public ArticleCitation findArticleByVpdmfId(long id) throws Exception;
		 */
		function get findArticleByVpdmfId():AbstractOperation;
		

		// ~~~~~~~~~~~~~~~~~~~~
		// check Functions
		// ~~~~~~~~~~~~~~~~~~~~
		
		// ~~~~~~~~~~~~~~~~~~~~
		// Retrieve functions
		// ~~~~~~~~~~~~~~~~~~~~
		
		/**
		 * public List<ArticleCitation> retrieveAllArticlesPaged(int offset, int cnt) throws Exception
		 */
		function get retrieveAllArticlesPaged():AbstractOperation;

		/**
		 * public List<ArticleCitation> retrieveCorpusArticlesPaged(String corpusName, int offset, int pageSize) throws Exception
		 */

		function get retrieveCorpusArticlesPaged():AbstractOperation;

		// ~~~~~~~~~~~~~~
		// List functions
		// ~~~~~~~~~~~~~~
		
		/**
		 * public List<ListItem> listAllCorporaPaged(int offset, int pageSize)  throws Exception
		 */
		function get listAllCorporaPaged():AbstractOperation;
		

		
		// ~~~~~~~~~~~~~~~~~~~~
		// Add x to y functions
		// ~~~~~~~~~~~~~~~~~~~~

		// ~~~~~~~~~~~~~~~~~~~~~~~~~
		// Remove x from y functions
		// ~~~~~~~~~~~~~~~~~~~~~~~~~

		
	}
}