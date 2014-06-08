public class WonderMsgUtils {

	public static Integer getRomdomInt(Integer max, Integer min){
		return Math.round(Math.random() * (max-min)) + min;
	}
	
	public static List<User> getActiveUser(){
		return [SELECT Name, Id FROM User WHERE isActive = true AND Profile.UserType = 'Standard'];
	}
}