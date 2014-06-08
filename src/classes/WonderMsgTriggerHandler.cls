public with sharing class WonderMsgTriggerHandler {

	public void onBeforeUpdate(WonderMsg__c[] newRecs, Map<Id,WonderMsg__c> oldMap){
		
		List<WonderMsg__c> targetRecs = new List<WonderMsg__c>();
		for(WonderMsg__c newRec : newRecs){
			WonderMsg__c oldRec = oldMap.get(newRec.Id);
			// フラグが変更されたレコードを対象とする 
			if(newRec.Incoming__c == true && oldRec.Incoming__c == false){
				targetRecs.add(newRec);
			}
		}
		
		// 組織のUser数が多い場合はガバナを考慮して非同期Apexに変更する予定
		User[] users = WonderMsgUtils.getActiveUser();
		
		List<FeedItem> feeds = new List<FeedItem>();
		for(WonderMsg__c rec : newRecs){
			User us = getSendUser(rec, users);
			feeds.add(createFeed(us.Id, rec.Id));
			rec.OwnerId = us.Id;
		}
		insert feeds;
	}
	
	private user getSendUser(WonderMsg__c rec, List<User> users){
		User retUser;
		// 自分以外の有効なユーザをランダムで取得
		do{
			retUser = users.get(WonderMsgUtils.getRomdomInt(users.size()-1, 0));
		} while(rec.OwnerId == retUser.Id);
		return retUser;
	}
	
	private FeedItem createFeed(Id userId, Id msgId){
		FeedItem fItem = new FeedItem();
		fItem.Type = 'TextPost';
		fItem.ParentId = userId;
		fItem.CreatedById = userId;
		String baseUrl = URL.getSalesforceBaseUrl().toExternalForm().replaceFirst('http:','https:');
		fItem.Body = '浪江町の仲間からメッセージが届きました。\n'+baseUrl+'/apex/WonderMsgReceive?id='+msgId;
		return fItem;
	}
}