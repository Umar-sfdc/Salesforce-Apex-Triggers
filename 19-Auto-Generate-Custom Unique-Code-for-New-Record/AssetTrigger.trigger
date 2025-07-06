/*

🟩 Q19: Auto-Generate Custom Unique Code for New Records
🧠 Story: Your org uses a custom object Asset__c, and every time a record is created, it must be assigned a unique Asset_Code__c (e.g., ASSET-001, ASSET-002...).
🎯 Problem Statement:
 Write a trigger to auto-generate an incrementing code for each new Asset__c record using a custom setting or custom metadata to store the last used number.

OBJECT : Asset__c
EVENT : before insert

*/
