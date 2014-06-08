global with sharing class WonderMsgSendController{

	@RemoteAction
	global static void createMsg(String msg){
		final Integer MAX_ADD_DAYS = 0;
		try{
			Datetime arrivalDate = System.now();
			arrivalDate = arrivalDate.addDays(WonderMsgUtils.getRomdomInt(MAX_ADD_DAYS, 0));
			WonderMsg__c rec = new WonderMsg__c(ArrivalDateTime__c = arrivalDate,
												message__c = msg
			);
			insert rec;
		} catch(Exception e){
			System.debug('msg='+e.getMessage());
			throw e;
		}
	}
}