public class OrderTriggerHelper {

  public static void CalculateTotalAmountOnOrder(List<Order> newOrderList) {
      for (Order__c order : newOrderList) {
        // Null check to avoid errors
        if (order.Quantity__c != null && order.Price__c != null) {
            order.Total_Amount__c = order.Quantity__c * order.Price__c;
        } else {
            order.Total_Amount__c = 0;  // Optional: set 0 if Quantity or Price is missing
        }
    }
  }

}
