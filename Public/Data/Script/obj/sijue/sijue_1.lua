-- �콱NPC
--���ľͺ�����

x899995_g_scriptId = 899995

--**********************************
--�¼��������
--**********************************
function x899995_OnDefaultEvent( sceneId, selfId, targetId )
		local	lev	= GetLevel( sceneId, selfId )
		if lev < 10 then
			BeginEvent(sceneId)
	   			AddText( sceneId, "����������أ���ȼ��ﵽ10�������ɣ�" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else 
			BeginEvent(sceneId)

		   		AddText( sceneId, "#W��ī�Ѿ������Ǹ��������̫���ˣ�СŮ�Ӹ�л��λ������" )
				AddNumText( sceneId, x899995_g_scriptId, "#c00ff00���������ϸ�", 5, 200)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
end
--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x899995_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 210 then
		BeginEvent( sceneId )
   		local n = GetMonsterCount(sceneId)
		if n>170 then
   		strText = "��ǰ��������Ϊ:"..n.."��,��������170���������ֶ�ˢ��,��"
  		AddText( sceneId, strText )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
   		else 
		BeginEvent( sceneId )
		LuaFnCreateMonster(531, 39339, 30, 30, 17, 0, 402030)
                AddText( sceneId, "ˢ�³ɹ���������Һ͹���������Ϊ:"..n.."����" )
           	AddText( sceneId, strText )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		end
    elseif GetNumText() == 200 then

	local nCount = GetMonsterCount(sceneId)
	for i=0, nCount-1  do
		local nObjId = GetMonsterObjID(sceneId, i)
		local MosDataID = GetMonsterDataID( sceneId, nObjId )
		--if MosDataID == 42100 then
		if MosDataID == 14101 or MosDataID == 14102 or MosDataID == 14103 or MosDataID == 14104 or MosDataID == 14105 or MosDataID == 14106 then
               	        BeginEvent( sceneId ) 
	        	           AddText( sceneId, "#G�ľ�����ﻹû������ɾ�����ȴ�ȫ������֮���������ͣ������ȷ������ɾ��ˣ����Ҽ��һ�£�30��������Ҵ��ͣ�" )
              	           EndEvent( sceneId )
               	        DispatchEventList( sceneId, selfId, targetId )
		  return
		else
               	        BeginEvent( sceneId )
               	        AddText( sceneId, "#G������Ī�������ģ���һ��ħͷɱ�˲�գ�ۣ����ٵ�����״̬���ɿ�ս��" ) 
               	        	AddNumText( sceneId, x899995_g_scriptId, "#c00ff00�봫�ҹ�ȥ", 6, 1)
              	        EndEvent( sceneId )
               	        DispatchEventList( sceneId, selfId, targetId )
		end
end
    elseif GetNumText() == 1 then
          local	lev	= GetLevel( sceneId, selfId )
		if lev < 1 then
			BeginEvent(sceneId)
	   			AddText( sceneId, "�����������أ���ȼ��ﵽ1�������ɣ�" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else 

			         BeginEvent( sceneId ) 
--			         LuaFnDelAvailableItem(sceneId,selfId,39901039,300)--ɾ����Ʒ
		         CallScriptFunction(899991 , "MakeCopyScene", sceneId, selfId)--����
--CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 540, 36, 86, 70 )
			         EndEvent( sceneId )
               	         DispatchEventList( sceneId, selfId, targetId )

       	            end
	    end
end

