<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>WonderMsgIncoming</fullName>
        <field>Incoming__c</field>
        <literalValue>1</literalValue>
        <name>WonderMsgIncoming</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>WonderMsgCreate</fullName>
        <active>true</active>
        <formula>true</formula>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>WonderMsgIncoming</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>WonderMsg__c.ArrivalDateTime__c</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
