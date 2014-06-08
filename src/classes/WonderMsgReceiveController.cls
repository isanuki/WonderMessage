public with sharing class WonderMsgReceiveController {

	public String wonderMsg {get; set;}
	
	public void receiveMsg(){
		try{
			String msgId = ApexPages.currentPage().getParameters().get('id');
			if(String.isNotBlank(msgId)){
				for(WonderMsg__c rec : [SELECT Id, Message__c FROM WonderMsg__c WHERE id =: msgId]){
					wonderMsg = rec.Message__c;
				}
			}
			
		} catch(Exception e){
			System.debug('msg='+e.getMessage());
			throw e;
		}
	}
}