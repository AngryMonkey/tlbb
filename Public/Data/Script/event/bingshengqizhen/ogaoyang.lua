-- ��ʥ������NPC
--���ľͺ�ԭ��

x402093_g_scriptId = 402093

--**********************************
--�¼��������
--**********************************
function x402093_OnDefaultEvent( sceneId, selfId, targetId )
		local	lev	= GetLevel( sceneId, selfId )
		if lev < 10 then
			BeginEvent(sceneId)
	   			AddText( sceneId, "ǰ���������أ���ȼ��ﵽ10�������ɣ�" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else 
			BeginEvent(sceneId)
		   	AddText( sceneId, "    #WӢ����ֻ�����㵽�ˣ��������Ϳ�Ӣ�۵����ա���ʶ�������ˣ��;�ǧ�����һ�����ǽ����ټ�����Ȼ�������о�׼���Ĳ�����֣��ҿ��Դ����¥����" )
			AddNumText( sceneId, x402093_g_ScriptId, "#G����¥���ų�", 5, 200)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
end
--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x402093_OnEventRequest( sceneId, selfId, targetId, eventId )
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
		if MosDataID ==  14140 then
               	        BeginEvent( sceneId ) 
	        	           AddText( sceneId, "#G�ðɣ��������ٷ���¥���ųǰɣ�" )
              	           EndEvent( sceneId )
               	        DispatchEventList( sceneId, selfId, targetId )
		end

			         CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 200,182,10 )--����
                          
       	            end
	    end
end
