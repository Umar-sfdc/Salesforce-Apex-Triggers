public with sharing class TaskTriggerHandler {
    public static void handleBeforeInsert() {
        System.debug('Future Code!');
    }

    public static void handleBeforeUpdate(List<Task> newTask) {
        autoClosedTaskOlderThan30(newTask);
    }   

    private static void autoClosedTaskOlderThan30(List<Task> newTask) {
    
     // Get current date once
     Date today = Date.today();
        for(Task t : newTask) {
            // Check if the task is still open and was created over 30 days ago
            if ((t.Status != 'Completed') && (t.CreatedDate != null) && (t.CreatedDate.date().daysBetween(today) > 30)) {
                t.Status = 'Completed';
            }
        }

    }
}