x390001_g_ScriptId	= 390001

--**********************************
--�¼��������
--**********************************
function x390001_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId, "    �װ�����ң������߿��������Ƶ��ޣ�����Ƥ���ǵ���壬���ʸ��������澭������������������Щ���ץ���������������������ˣ�����и�#G#{_MONEY5000000}#W����ȥ���������ͺ��ˡ�����")
		AddNumText(sceneId, x390001_g_ScriptId,"���Ѿ���ǿ���ˡ�160����", 10, 101)
		AddNumText(sceneId, x390001_g_ScriptId,"�㿴����������Щ��Ǯ����", 5, 102)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x390001_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 101  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev>=130 then
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 584, 258, 310 )
		end
	elseif GetNumText() == 102  then
		local reply = CostMoney(sceneId,selfId,5000000)
		if reply == -1 then
			x390001_MsgBox( sceneId, selfId, targetId, "    #YС�ӣ�Ǯ�أ��㲻˵����Ǯ����?��ԣ������ûǮ������ң���Զ�㣡" )
			return	
		end
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 584, 258, 310 )
	end
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x390001_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
