package edu.isi.bmkeg.digitalLibraryModule
{
	import edu.isi.bmkeg.ftd.rl.events.*;
	import edu.isi.bmkeg.ftd.rl.services.IFtdService;
	import edu.isi.bmkeg.ftd.rl.services.impl.FtdServiceImpl;
	import edu.isi.bmkeg.ftd.rl.services.serverInteraction.IFtdServer;
	import edu.isi.bmkeg.ftd.rl.services.serverInteraction.impl.FtdServerImpl;
	
	import edu.isi.bmkeg.digitalLibrary.rl.events.*;
	import edu.isi.bmkeg.digitalLibrary.rl.services.IDigitalLibraryService;
	import edu.isi.bmkeg.digitalLibrary.rl.services.impl.DigitalLibraryServiceImpl;
	import edu.isi.bmkeg.digitalLibrary.rl.services.serverInteraction.IDigitalLibraryServer;
	import edu.isi.bmkeg.digitalLibrary.rl.services.serverInteraction.impl.DigitalLibraryServerImpl;
	
	import edu.isi.bmkeg.pagedList.model.*;
	import edu.isi.bmkeg.pagedList.events.*;
	
	import edu.isi.bmkeg.digitalLibraryModule.events.*;
	import edu.isi.bmkeg.digitalLibraryModule.model.*;
	import edu.isi.bmkeg.digitalLibraryModule.controller.*;
	import edu.isi.bmkeg.digitalLibraryModule.view.*;
 	
	import com.devaldi.controls.flexpaper.FlexPaperViewer;

	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;

	public class DigitalLibraryModuleContext extends ModuleContext
	{

		public function DigitalLibraryModuleContext(contextView:DisplayObjectContainer,  injector:IInjector)
		{
			super(contextView, true, injector);
		}
		
		override public function startup():void
		{		
			
			mediatorMap.mapView(CorpusControl, CorpusControlMediator);
			mediatorMap.mapView(ArticleCitationList, ArticleCitationListMediator);
			mediatorMap.mapView(ArticleCitationView, ArticleCitationViewMediator);
			mediatorMap.mapView(FlexPaperViewer, FlexPaperMediator);
			
			injector.mapSingleton(DigitalLibraryModel);
			injector.mapSingleton(PagedListModel);
			injector.mapSingletonOf(IDigitalLibraryService, DigitalLibraryServiceImpl);
			injector.mapSingletonOf(IDigitalLibraryServer, DigitalLibraryServerImpl);
			injector.mapSingletonOf(IFtdServer, FtdServerImpl);
			injector.mapSingletonOf(IFtdService, FtdServiceImpl);
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// list the corpora on the server
			commandMap.mapEvent(ListCorpusEvent.LIST_CORPUS, ListCorpusCommand);
			commandMap.mapEvent(ListCorpusResultEvent.LIST_CORPUS_RESULT, ListCorpusResultCommand);

			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// load the target corpus
			commandMap.mapEvent(FindCorpusByIdEvent.FIND_CORPUS_BY_ID, FindCorpusByIdCommand);
			commandMap.mapEvent(FindCorpusByIdResultEvent.FIND_CORPUSBY_ID_RESULT, FindCorpusByIdResultCommand);
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// Run a paged list query for TriageDocument objects
			// associated with a given TriageCorpus. 
			commandMap.mapEvent(ListArticleCitationPagedEvent.LIST_ARTICLECITATION_PAGED, ListArticleCitationPagedCommand);
			commandMap.mapEvent(ListArticleCitationPagedResultEvent.LIST_ARTICLECITATION_PAGED_RESULT, ListArticleCitationPagedResultCommand);
			commandMap.mapEvent(CountPagedListLengthEvent.COUNT_PAGED_LIST_LENGTH, CountArticleDocumentCommand);
			commandMap.mapEvent(CountArticleCitationResultEvent.COUNT_ARTICLECITATION_RESULT, CountArticleDocumentResultCommand);
			commandMap.mapEvent(PagedListRetrievePageEvent.PAGEDLIST_RETRIEVE_PAGE, PagedListRetrievePageCommand);
			
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// Change selection of the triagedDocument List control
			// Run a query for the Triaged document. 
			commandMap.mapEvent(FindArticleCitationByIdResultEvent.FIND_ARTICLECITATIONBY_ID_RESULT, FindArticleDocumentByIdResultCommand);
			commandMap.mapEvent(ListArticleDocumentEvent.LIST_ARTICLEDOCUMENT, ListArticleDocumentCommand);

			commandMap.mapEvent(ClearCorpusEvent.CLEAR_CORPUS, ClearCorpusCommand);

		}
		
		override public function dispose():void
		{
			mediatorMap.removeMediatorByView(contextView);
			super.dispose();
		}
		
	}
	
}