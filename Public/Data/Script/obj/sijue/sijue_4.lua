-- �콱NPC
--���ľͺ�����

x899998_g_scriptId = 899998

--**********************************
--�¼��������
--**********************************
function x899998_OnDefaultEvent( sceneId, selfId, targetId )
		local	lev	= GetLevel( sceneId, selfId )
		if lev < 10 then
			BeginEvent(sceneId)
	   			AddText( sceneId, "����������أ���ȼ��ﵽ10�������ɣ�" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else 
			BeginEvent(sceneId)
		   	AddText( sceneId, "#W�ĸ������Ѿ������Ǵ����?СŮ�ӶԸ�λ�Ĵ���������Ϊ����" )
			AddNumText( sceneId, x899998_g_ScriptId, "#G�뿪�ľ�ׯ", 5, 200)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
end
--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x899998_OnEventRequest( sceneId, selfId, targetId, eventId )
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
		if MosDataID ==  14140 or MosDataID == 14141 or MosDataID == 14142 or MosDataID == 14143 or MosDataID == 14144 or MosDataID == 14145 then
               	        BeginEvent( sceneId ) 
	        	           AddText( sceneId, "#G����̳���ﻹû������ɾ�����ȴ�ȫ������֮���������ͣ������ȷ������ɾ��ˣ����Ҽ��һ�£�30��������Ҵ��ͣ�" )
              	           EndEvent( sceneId )
               	        DispatchEventList( sceneId, selfId, targetId )
--		end
else
			         BeginEvent( sceneId ) 

			         CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 195,212,10 )--����
			         EndEvent( sceneId )
               	         DispatchEventList( sceneId, selfId, targetId )
                          
       	            end
	    end
end
end