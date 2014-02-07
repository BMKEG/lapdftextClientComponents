package edu.isi.bmkeg.lapdftextModule
{
	
	import edu.isi.bmkeg.lapdftextModule.controller.*;
	import edu.isi.bmkeg.lapdftextModule.events.*;
	import edu.isi.bmkeg.lapdftextModule.model.*;
	import edu.isi.bmkeg.lapdftextModule.view.*;
	import edu.isi.bmkeg.lapdftextModule.view.forms.*;
	
	import edu.isi.bmkeg.ftd.events.*;
	import edu.isi.bmkeg.ftd.services.IExtendedFtdService;
	import edu.isi.bmkeg.ftd.services.impl.ExtendedFtdServiceImpl;
	import edu.isi.bmkeg.ftd.services.serverInteraction.IExtendedFtdServer;
	import edu.isi.bmkeg.ftd.services.serverInteraction.impl.ExtendedFtdServerImpl;

	import edu.isi.bmkeg.digitalLibrary.events.*;	
	import edu.isi.bmkeg.digitalLibrary.rl.events.*;
	import edu.isi.bmkeg.digitalLibrary.rl.services.*;
	import edu.isi.bmkeg.digitalLibrary.rl.services.impl.*;
	import edu.isi.bmkeg.digitalLibrary.rl.services.serverInteraction.*;
	import edu.isi.bmkeg.digitalLibrary.rl.services.serverInteraction.impl.*;
	import edu.isi.bmkeg.digitalLibrary.services.*;
	import edu.isi.bmkeg.digitalLibrary.services.impl.*;
	import edu.isi.bmkeg.digitalLibrary.services.serverInteraction.IExtendedDigitalLibraryServer;
	import edu.isi.bmkeg.digitalLibrary.services.serverInteraction.impl.ExtendedDigitalLibraryServerImpl;
	import edu.isi.bmkeg.digitalLibraryModule.view.ArticleList;
	
	import edu.isi.bmkeg.ftd.rl.events.*;
	import edu.isi.bmkeg.ftd.rl.services.IFtdService;
	import edu.isi.bmkeg.ftd.rl.services.impl.FtdServiceImpl;
	import edu.isi.bmkeg.ftd.rl.services.serverInteraction.IFtdServer;
	import edu.isi.bmkeg.ftd.rl.services.serverInteraction.impl.FtdServerImpl;
	import edu.isi.bmkeg.pagedList.events.*;
	import edu.isi.bmkeg.pagedList.model.*;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;

	public class LapdftextModuleContext extends ModuleContext
	{

		public function LapdftextModuleContext(contextView:DisplayObjectContainer,  injector:IInjector)
		{
			super(contextView, true, injector);
		}
		
		override public function startup():void
		{		
			
			mediatorMap.mapView(ArticleList, ArticleListMediator);
			mediatorMap.mapView(JournalEpochControl, JournalEpochControlMediator);
			mediatorMap.mapView(LapdftextBlockView, LapdftextBlockViewMediator);
			//mediatorMap.mapView(FTDTextView, FTDTextViewMediator);
			//mediatorMap.mapView(FTDBlocksView, FTDBlocksViewMediator);
			//mediatorMap.mapView(RulesEditor, RulesEditorMediator);
			
			// Need a bit of extra detail to deal with popups
			mediatorMap.mapView(CorpusPopup, CorpusPopupMediator, null, false, false);
			mediatorMap.mapView(CorpusListPopup, CorpusListPopupMediator, null, false, false);
			
			injector.mapSingleton(LapdftextModel);
			injector.mapSingleton(LapdftextPagedListModel);
			
			injector.mapSingletonOf(IFtdServer, FtdServerImpl);
			injector.mapSingletonOf(IFtdService, FtdServiceImpl);
			injector.mapSingletonOf(IExtendedFtdServer, ExtendedFtdServerImpl);
			injector.mapSingletonOf(IExtendedFtdService, ExtendedFtdServiceImpl);
			injector.mapSingletonOf(IDigitalLibraryService, DigitalLibraryServiceImpl);
			injector.mapSingletonOf(IDigitalLibraryServer, DigitalLibraryServerImpl);
			injector.mapSingletonOf(IExtendedDigitalLibraryService, ExtendedDigitalLibraryServiceImpl);
			injector.mapSingletonOf(IExtendedDigitalLibraryServer, ExtendedDigitalLibraryServerImpl);


			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// List the FTD Rule Sets
			
			commandMap.mapEvent(
				ListJournalEpochEvent.LIST_JOURNALEPOCH, 
				ListExtendedJournalEpochsCommand);
			
			commandMap.mapEvent(
				ListJournalEpochResultEvent.LIST_JOURNALEPOCH_RESULT, 
				ListExtendedJournalEpochsResultCommand);

			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// Load an FTD Rule Set
			
			commandMap.mapEvent(
				FindFTDRuleSetByIdEvent.FIND_FTDRULESET_BY_ID, 
				FindFTDRuleSetByIdCommand);
			
			commandMap.mapEvent(
				FindFTDRuleSetByIdResultEvent.FIND_FTDRULESETBY_ID_RESULT, 
				FindFTDRuleSetByIdResultCommand);
			
			commandMap.mapEvent(
				RunRuleSetEvent.RUN_RULE_SET, 
				RunRuleSetCommand);
			
			commandMap.mapEvent(
				RunRuleSetCompleteEvent.RUN_RULE_SET_COMPLETE, 
				RunRuleSetCompleteCommand);

			commandMap.mapEvent(
				GenerateRuleFileFromLapdfEvent.GENERATE_RULE_FILE_FROM_LAPDF, 
				GenerateRuleFileFromLapdfCommand);
			
			commandMap.mapEvent(
				GenerateRuleFileFromLapdfResultEvent.GENERATE_RULE_FILE_FROM_LAPDF_RESULT, 
				GenerateRuleFileFromLapdfResultCommand);
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// Insert and update ExtractCorpus views
			commandMap.mapEvent(
				ListExtendedJournalEpochsEvent.LIST_EXTENDED_JOURNAL_EPOCHS,
				ListExtendedJournalEpochsCommand);
			
			commandMap.mapEvent(
				ListExtendedJournalEpochsResultEvent.LIST_EXTENDED_JOURNAL_EPOCHS_RESULT, 
				ListExtendedJournalEpochsResultCommand);
			
			commandMap.mapEvent(
				InsertJournalEpochEvent.INSERT_JOURNALEPOCH, 
				InsertJournalEpochCommand);
			
			commandMap.mapEvent(
				InsertJournalEpochResultEvent.INSERT_JOURNALEPOCH_RESULT, 
				InsertJournalEpochResultCommand);
			
			commandMap.mapEvent(
				UpdateJournalEpochEvent.UPDATE_JOURNALEPOCH, 
				UpdateJournalEpochCommand);
			
			commandMap.mapEvent(
				UpdateJournalEpochResultEvent.UPDATE_JOURNALEPOCH_RESULT, 
				UpdateJournalEpochResultCommand);

			/* TODO: Fill these out 
			commandMap.mapEvent(DeleteExtractCorpusByIdEvent.DELETE_EXTRACTCORPUS_BY_ID, 
			DeleteExtractCorpusByIdCommand);
			commandMap.mapEvent(DeleteExtractCorpusByIdResultEvent.DELETE_EXTRACTCORPUS_BY_ID_RESULT, 
			DeleteExtractCorpusByIdResultCommand);*/

			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// Rule Files & Rule Sets.
			//commandMap.mapEvent(RunRuleSetEvent.RUN_RULE_SET, RunRuleSetCommand);
			//commandMap.mapEvent(RunRuleSetCompleteEvent.RUN_RULE_SET_COMPLETE, RunRuleSetCompleteCommand);
	
			commandMap.mapEvent(
				InsertFTDRuleSetEvent.INSERT_FTDRULESET, 
				InsertFTDRuleSetCommand);
			
			commandMap.mapEvent(
				InsertFTDRuleSetResultEvent.INSERT_FTDRULESET_RESULT, 
				InsertFTDRuleSetResultCommand);
			
			commandMap.mapEvent(
				UpdateFTDRuleSetEvent.UPDATE_FTDRULESET, 
				UpdateFTDRuleSetCommand);
			
			commandMap.mapEvent(
				UpdateFTDRuleSetResultEvent.UPDATE_FTDRULESET_RESULT, 
				UpdateFTDRuleSetResultCommand);
			
			commandMap.mapEvent(
				DeleteFTDRuleSetByIdEvent.DELETE_FTDRULESET_BY_ID, 
				DeleteFTDRuleSetByIdCommand);
			
			commandMap.mapEvent(
				DeleteFTDRuleSetByIdResultEvent.DELETE_FTDRULESET_BY_ID_RESULT, 
				DeleteFTDRuleSetByIdResultCommand);			

			commandMap.mapEvent(
				ListFTDRuleSetEvent.LIST_FTDRULESET, 
				ListFTDRuleSetCommand);
			
			commandMap.mapEvent(
				ListFTDRuleSetResultEvent.LIST_FTDRULESET_RESULT, 
				ListFTDRuleSetResultCommand);
			
			commandMap.mapEvent(
				AddRuleFileToJournalEpochEvent.ADD_RULE_FILE_TO_JOURNAL_EPOCH,
				AddRuleFileToJournalEpochCommand);
			
			commandMap.mapEvent(
				AddRuleFileToJournalEpochResultEvent.ADD_RULE_FILE_TO_JOURNAL_EPOCH_RESULT, 
				AddRuleFileToJournalEpochResultCommand);

			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// Run a paged list query for articles in the target corpus
			commandMap.mapEvent(ListArticleCitationPagedEvent.LIST_ARTICLECITATION_PAGED, 
				ListArticleCitationPagedCommand);
			commandMap.mapEvent(ListArticleCitationPagedResultEvent.LIST_ARTICLECITATION_PAGED_RESULT, 
				ListArticleCitationPagedResultCommand);
			commandMap.mapEvent(CountArticleCitationResultEvent.COUNT_ARTICLECITATION_RESULT, 
				CountArticleCitationResultCommand);
			commandMap.mapEvent(PagedListRetrievePageEvent.PAGEDLIST_RETRIEVE_PAGE
				+ LapdftextPagedListModel.LIST_ID, 
				LapdfTextPagedListRetrievePageCommand);
			commandMap.mapEvent(CountPagedListLengthEvent.COUNT_PAGED_LIST_LENGTH
				+LapdftextPagedListModel.LIST_ID, 
				CountArticleCitationPagedListCommand);
			
			commandMap.mapEvent(
				FindArticleCitationByIdEvent.FIND_ARTICLECITATION_BY_ID, 
				FindArticleCitationByIdCommand);
			
			commandMap.mapEvent(
				FindArticleCitationByIdResultEvent.FIND_ARTICLECITATIONBY_ID_RESULT, 
				FindArticleCitationByIdResultCommand);
			
			commandMap.mapEvent(LoadingPdfSwfCompleteEvent.LOADING_PDF_SWF_COMPLETE, 
				LoadingPdfSwfCompleteCommand);

			commandMap.mapEvent(
				RetrieveFTDRuleSetForArticleCitationEvent.RETRIEVE_FTDRULESET_FOR_ARTICLE_CITATION, 
				RetrieveFTDRuleSetForArticleCitationCommand);
			
			commandMap.mapEvent(
				RetrieveFTDRuleSetForArticleCitationResultEvent.RETRIEVE_FTDRULESET_FOR_ARTICLE_CITATION_RESULT, 
				RetrieveFTDRuleSetForArticleCitationResultCommand);

			commandMap.mapEvent(
				RunRuleSetOnArticleCitationEvent.RUN_RULE_SET_ON_ARTICLE_CITATION, 
				RunRuleSetOnArticleCitationCommand);
			
			commandMap.mapEvent(
				RunRuleSetOnArticleCitationResultEvent.RUN_RULE_SET_ON_ARTICLE_CITATION_RESULT, 
				RunRuleSetOnArticleCitationResultCommand);

			commandMap.mapEvent(
				RunRuleSetOnJournalEpochEvent.RUN_RULE_SET_ON_JOURNAL_EPOCH, 
				RunRuleSetOnJournalEpochCommand);
			
			commandMap.mapEvent(
				RunRuleSetOnJournalEpochResultEvent.RUN_RULE_SET_ON_JOURNAL_EPOCH_RESULT, 
				RunRuleSetOnJournalEpochResultCommand);
			
			commandMap.mapEvent(
				HtmlTextLoadedFromPdfEvent.HTML_TEXT_LOADED_FROM_PDF, 
				HtmlTextLoadedFromPdfCommand);
/*  Fill these out 

			commandMap.mapEvent(ClearCorpusEvent.CLEAR_CORPUS, ClearCorpusCommand);
			
			commandMap.mapEvent(AddArticleCitationToCorpusEvent.ADD_ARTICLE_CITATION_TO_CORPUS, 
				AddArticleCitationToCorpusCommand);
			
			commandMap.mapEvent(RemoveArticleCitationFromCorpusEvent.REMOVE_ARTICLE_CITATION_FROM_CORPUS, 
				RemoveArticleCitationFromCorpusCommand);
			
			commandMap.mapEvent(FullyDeleteArticleEvent.FULLY_DELETE_ARTICLE, 
				FullyDeleteArticleCommand);*/
			
									
		}
		
		override public function dispose():void
		{
			mediatorMap.removeMediatorByView(contextView);
			super.dispose();
		}
		
	}
	
}