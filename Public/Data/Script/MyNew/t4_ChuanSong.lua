x390002_g_ScriptId	= 390002

--**********************************
--�¼��������
--**********************************
function x390002_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId, "    �װ�����ң�����������ǵ�BOSS�����ֳ�������������ء�")
		AddNumText(sceneId, x390002_g_ScriptId,"������180����", 10, 101)
		AddNumText(sceneId, x390002_g_ScriptId,"�ֵܣ�������#{_MONEY10000000}�㿴����", 5, 102)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x390002_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 101  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev>=140 then
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 585, 255, 269 )
		end
	elseif GetNumText() == 102  then
		local reply = CostMoney(sceneId,selfId,5000000)
		if reply == -1 then
			x390002_MsgBox( sceneId, selfId, targetId, "    #Y��磬���ͱ�������ˣ���ڷ���Ҳ�����ף������ɣ���湻Ǯ�������Ұɣ�" )
		else
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 585, 255, 269 )
		end
	end

end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x390002_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
